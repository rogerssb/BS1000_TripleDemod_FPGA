`include "addressMap.v"
`timescale 1ns/1ps

module multihSuperbaudTED(
    input                       clk,symEn,sym2xEn,reset,
    input       signed  [17:0]  i,q,
    output                      tedOutputEn,
    output      signed  [17:0]  tedOutput,
    output  reg                 syncPulse,
    output  reg                 symEnEven
);

    function signed [17:0] saturatedSum;
        input   signed  [17:0]  a;
        input   signed  [17:0]  b;

        reg     signed  [18:0]  sum;
        
        begin
            sum = {a[17],a} + {b[17],b};
            if (sum[18] && !sum[17]) begin
                saturatedSum = 18'h20001;
            end
            else if (!sum[18] && sum[17]) begin
                saturatedSum = 18'h1ffff;
            end
            else begin
                saturatedSum = sum[17:0];
            end
        end
    endfunction


    /*
	// Compute the signals that feed the upper and lower branches
	for(i=0;i<m_nNumSamplesInProcessingBatch;++i)
	{
		// NUM MULTIPLIES = 4*m_nNumSamplesInProcessingBatch
		nSampleIndexTemp = MOD(m_nSampleIndex + i,2*m_sim.N*m_rx.Nh);
		vReRe = m_pCos[nSampleIndexTemp]*pRealIn[i];
		vReIm = m_pCos[nSampleIndexTemp]*pImagIn[i];
		vImRe = m_pSin[nSampleIndexTemp]*pRealIn[i];
		vImIm = m_pSin[nSampleIndexTemp]*pImagIn[i];
		
		iUpperLower = m_nUpperLowerLen-m_nNumSamplesInProcessingBatch + i;
		m_pUpperInputReal[iUpperLower] = vReRe - vImIm;
		m_pUpperInputImag[iUpperLower] = vReIm + vImRe;
		m_pLowerInputReal[iUpperLower] = vReRe + vImIm;
		m_pLowerInputImag[iUpperLower] = vReIm - vImRe;
		
		// Compute the outputs of the upper and lower filters
		// NUM MULTIPLIES = 2*N*FilterLen
		vUpperReal = -ComputeOneFilterSample(m_pUpperInputImag + i, m_pFilterCoeffsQuan, m_nFilterLen);
		vUpperImag = +ComputeOneFilterSample(m_pUpperInputReal + i, m_pFilterCoeffsQuan, m_nFilterLen);
		vLowerReal = m_pLowerInputReal[iUpperLower - m_nLowerPathDelay];
		vLowerImag = m_pLowerInputImag[iUpperLower - m_nLowerPathDelay];
		
		// Compute -Imag(sum(conj(Upper)*Lower))
		// NUM MULTIPLIES = 2*m_nNumSamplesInProcessingBatch
		vImagSum += vUpperReal*vLowerImag - vUpperImag*vLowerReal;
	}
    */

    // Create a delay line for the clock enables
    reg             [31:0]  symEnSR;
    reg             [31:0]  sym2xEnSR;
    always @(posedge clk) begin
        symEnSR <= {symEnSR[30:0],symEn};
        sym2xEnSR <= {sym2xEnSR[30:0],sym2xEn};
    end


    //------------------------ Upper and Lower Rotations ----------------------
    //
    // We process the incoming samples as pairs of symbols under the assumption 
    // the bitsync loop will drive the pair boundary to line up with the superbaud
    // boundary. Since there are 2 samples per symbol, we process 4 samples for 
    // each TED output. The first step in the process is to apply a different 
    // rotation to each of the four samples. The rotations are created by sampling
    // the unit circle at angles of i*pi/4, 0 <= i < 4, for the first four samples
    // followed by i*pi/4, 4 <= i < 8, for the next four. These two sets of four 
    // rotations are alternated for each set of four samples.
    //
    // These rotation constants can be generated from combinations of 0, 1, and 
    // 1/sqrt(2).

    wire    signed  [34:0]  iDivSqrt2;
    wire    signed  [17:0]  iSqrt2 = iDivSqrt2[34:17];
    divSqrt2WithCE iDiv (
        .clk(clk),
        .ce(sym2xEn),
        .a(i),
        .p(iDivSqrt2)
    );
    wire    signed  [34:0]  qDivSqrt2;
    wire    signed  [17:0]  qSqrt2 = qDivSqrt2[34:17];
    divSqrt2WithCE qDiv (
        .clk(clk),
        .ce(sym2xEn),
        .a(q),
        .p(qDivSqrt2)
    );

    // Rotation State Machine
    reg     signed  [17:0]  iRot;
    reg     signed  [17:0]  qRot;
    reg             [2:0]   sampleCount;
        `define ROT_0       0
        `define ROT_45      1
        `define ROT_90      2
        `define ROT_135     3
        `define ROT_180     4
        `define ROT_225     5
        `define ROT_270     6
        `define ROT_315     7
    reg     signed  [17:0]  upperReal,upperImag;
    reg     signed  [17:0]  lowerReal,lowerImag;
    always @(posedge clk) begin
        // Create a counter to count the samples in a two symbol pairs.
        if (reset) begin
            sampleCount <= `ROT_315;
            upperReal <= 0;
            upperImag <= 0;
            lowerReal <= 0;
            lowerImag <= 0;
        end
        else if (sym2xEn) begin
            syncPulse <= (sampleCount == 0);
            symEnEven <= sampleCount[1];
            `ifdef ALTERNATE_PHASE
            if ((sampleCount == 7) && !symEn) begin
            `else
            if ((sampleCount == 7) && symEn) begin
            `endif
                sampleCount <= 7;
            end
            else begin
                sampleCount <= sampleCount + 1;
            end
        end
        // Use the sampleCount to form the rotations
        if (sym2xEn) begin
            iRot <= i;
            qRot <= q;
            case (sampleCount)
                `ROT_0: begin        // Rotate upper and lower by 0 degrees
                    upperReal <= iRot;
                    upperImag <= qRot;
                    lowerReal <= iRot;
                    lowerImag <= qRot;
                end
                `ROT_45: begin      // Rotate upper by 45 and lower by -45
                    upperReal <= saturatedSum( iSqrt2,-qSqrt2);
                    upperImag <= saturatedSum( qSqrt2, iSqrt2);
                    lowerReal <= saturatedSum( iSqrt2, qSqrt2);
                    lowerImag <= saturatedSum( qSqrt2,-iSqrt2);
                end
                `ROT_90: begin      // Rotate Upper by 90 and lower by -90
                    upperReal <= -qRot;
                    upperImag <=  iRot;
                    lowerReal <=  qRot;
                    lowerImag <= -iRot;
                end
                `ROT_135: begin     // Rotate Upper by 135 and lower by -135
                    upperReal <= saturatedSum(-iSqrt2,-qSqrt2);
                    upperImag <= saturatedSum(-qSqrt2, iSqrt2);
                    lowerReal <= saturatedSum(-iSqrt2, qSqrt2);
                    lowerImag <= saturatedSum(-qSqrt2,-iSqrt2);
                end
                `ROT_180: begin     // Rotate upper by 180 and lower by -180
                    upperReal <= -iRot;
                    upperImag <= -qRot;
                    lowerReal <= -iRot;
                    lowerImag <= -qRot;
                end
                `ROT_225: begin      // Rotate upper by 225 and lower by -225
                    upperReal <= saturatedSum(-iSqrt2, qSqrt2);
                    upperImag <= saturatedSum(-qSqrt2,-iSqrt2);
                    lowerReal <= saturatedSum(-iSqrt2,-qSqrt2);
                    lowerImag <= saturatedSum(-qSqrt2, iSqrt2);
                end
                `ROT_270: begin      // Rotate Upper by 270 and lower by -270
                    upperReal <=  qRot;
                    upperImag <= -iRot;
                    lowerReal <= -qRot;
                    lowerImag <=  iRot;
                end
                `ROT_315: begin     // Rotate Upper by 315 and lower by -315
                    upperReal <= saturatedSum(iSqrt2, qSqrt2);
                    upperImag <= saturatedSum(qSqrt2,-iSqrt2);
                    lowerReal <= saturatedSum(iSqrt2,-qSqrt2);
                    lowerImag <= saturatedSum(qSqrt2, iSqrt2);
                end
            endcase
        end
    end


    //-------------------------- Upper and Lower Filters ----------------------
    //
    // The upper signal is filtered by a FIR whose coefficients are calculated
    // from the Multih transmit waveform. The lower signal is delayed to match 
    // the group delay of the upper filter. 
    // 
    // The upper filter coefficients downsampled to 2 samples per symbol are:
    //      -0.0003
    //      -0.0026
    //      -0.0097
    //      -0.0221
    //      -0.0364
    //      -0.0389
    //      -0.0173
    //      -0.0000
    //      -0.0173
    //      -0.0389
    //      -0.0364
    //      -0.0221
    //      -0.0097
    //      -0.0026
    //      -0.0003
    //
    // The gain of this filter is not important since it can be corrected with 
    // the bitsync loop gain. So, we quantize this response to powers of 2 so 
    // the filter can be implemented using only shifts and adds and end up with 
    // the following 9 coefficients:
    //      -0.0625
    //      -0.1250
    //      -0.1250
    //      -0.0625
    //      -0.0000
    //      -0.0625
    //      -0.1250
    //      -0.1250
    //      -0.0625
    //
    // The filter we actually constructed used positive versions of the coefficients.
    // This inversion is resolved in the final output section.
    //

    wire    signed  [17:0]  upperFilterReal;
    multihSuperbaudH1 h1Real(
        .clk(clk), 
        .clkEn(sym2xEn), 
        .reset(reset),
        .din(upperReal),
        .dout(upperFilterReal)
    );
    wire    signed  [17:0]  upperFilterImag;
    multihSuperbaudH1 h1Imag(
        .clk(clk), 
        .clkEn(sym2xEn),
        .reset(reset), 
        .din(upperImag),
        .dout(upperFilterImag)
    );

  
    
    reg     signed  [17:0]  lowerRealSR[5:0];
    reg     signed  [17:0]  lowerImagSR[5:0];
    wire    signed  [17:0]  lowerFilterReal = lowerRealSR[4];
    wire    signed  [17:0]  lowerFilterImag = lowerImagSR[4];
    integer                 k;
    always @(posedge clk) begin
        if (sym2xEn) begin
            lowerRealSR[0] <= lowerReal;
            lowerImagSR[0] <= lowerImag;
            for (k = 0; k < 5; k = k + 1) begin
                lowerRealSR[k+1] <= lowerRealSR[k];
                lowerImagSR[k+1] <= lowerImagSR[k];
            end
        end
    end

    //-------------------------- Final Output ---------------------------------
    //
    // The final output is created by multiplying the complex conjugate of the 
    // upper filter output by the lower filter output. We then take the imaginary
    // part of this multiplication and sum it up across four samples.
    //
    // Each imaginary term is ur*li - ui*lr. However, we must account for the 
    // filter inversion in the h1 filter coefficients so the upper terms are
    // inverted to give
    //
    //              ted output = sum(ui*lr - ur*li)
    //
    // across four samples.
    // 
    // We'll use the sampleCount variable to determine the 4 sample boundary.

    wire    signed  [35:0]  urliProduct;
    mpy18x18PL0 urTimesLi (
        .a(upperFilterReal),
        .b(lowerFilterImag),
        .p(urliProduct)
    );
    wire    signed  [35:0]  uilrProduct;
    mpy18x18PL0 uiTimesLr (
        .a(upperFilterImag),
        .b(lowerFilterReal),
        .p(uilrProduct)
    );

    reg     signed  [17:0]  tedTerm;
    reg     signed  [19:0]  tedAccum;
    wire    signed  [19:0]  tedSum = tedAccum + {{2{tedTerm[17]}},tedTerm};
    reg     signed  [17:0]  tedOutputReg;
    always @(posedge clk) begin
        if (sym2xEn) begin
            tedTerm <= saturatedSum(-uilrProduct[34:17],urliProduct[34:17]);
            `ifdef ALTERNATE_PHASE
            if (sampleCount[1:0] == 2'b11) begin
            `else
            if (sampleCount[1:0] == 2'b11) begin
            `endif
                tedAccum <= tedTerm;
                // Saturate the sum
                casex (tedAccum[19:16])
                    4'b0001,
                    4'b001x,
                    4'b01xx:    tedOutputReg <= 18'h1ffff;
                    4'b1110,
                    4'b110x,
                    4'b10xx:    tedOutputReg <= 18'h20001;
                    default:    tedOutputReg <= tedAccum[17:0];
                endcase
                /*
                casex (tedAccum[19:17])
                    3'b001,
                    3'b01x:     tedOutputReg <= 18'h1ffff;
                    3'b110,
                    3'b10x:     tedOutputReg <= 18'h20001;
                    default:    tedOutputReg <= tedAccum[17:0];
                endcase
                */
                //tedOutputReg <= tedAccum;
            end
            else begin
                tedAccum <= tedSum;
            end
        end
    end
    assign                  tedOutputEn = sym2xEn;
    assign                  tedOutput = tedOutputReg;


    `ifdef SIMULATE
    real upperRealFloat, upperImagFloat;
    always @* upperRealFloat = $itor(upperReal)/(2**17);
    always @* upperImagFloat = $itor(upperImag)/(2**17);
    real lowerRealFloat, lowerImagFloat;
    always @* lowerRealFloat = $itor(lowerReal)/(2**17);
    always @* lowerImagFloat = $itor(lowerImag)/(2**17);
    real upperFilterRealFloat, upperFilterImagFloat;
    always @* upperFilterRealFloat = $itor(upperFilterReal)/(2**17);
    always @* upperFilterImagFloat = $itor(upperFilterImag)/(2**17);
    real lowerFilterRealFloat, lowerFilterImagFloat;
    always @* lowerFilterRealFloat = $itor(lowerFilterReal)/(2**17);
    always @* lowerFilterImagFloat = $itor(lowerFilterImag)/(2**17);
    real    tedOutputFloat;
    always @* tedOutputFloat = $itor(tedOutput)/(2**17);
    `endif


endmodule


`ifdef TEST_MODULE

`timescale 1ns/100ps

module test;

    reg reset,clk;

    // Create the clocks
    parameter decimation = 10;
    parameter HC = 5;
    parameter C = 2*HC;
    reg clken;
    always #HC clk = clk^clken;

    reg sym2xEn;
    reg [7:0]sym2xEnCount;
    reg symEn;
    reg evenSample;
    always @(posedge clk) begin
        if (reset) begin
            evenSample <= 0;
            sym2xEnCount <= 0;
        end
        else if (sym2xEnCount == 0) begin
            sym2xEnCount <= decimation-1;
            sym2xEn <= 1;
            if (evenSample) begin
                symEn <= 1;
            end
            evenSample <= ~evenSample;
        end
        else begin
            sym2xEnCount <= sym2xEnCount - 1;
            sym2xEn <= 0;
            symEn <= 0;
        end
    end

    `define SAMPLE_PERIOD   (C*1e-9)
    `define TWO_POW_31      2147483648
    `define TWO_POW_32      4294967296
    `define TWO_POW_17      131072

    // Create an impulse to drive the filter with
    reg             [5:0]   sampleCount;
    reg     signed  [17:0]  iTestInput,qTestInput;
    always @(posedge clk) begin
        if (reset) begin
            sampleCount <= 0;
        end
        else if (sym2xEn) begin
            sampleCount <= sampleCount + 1;
            if (sampleCount == 7) begin
                iTestInput <= 18'h10000;
                qTestInput <= 18'h10000;
            end
            else if (sampleCount == 8) begin
                iTestInput <= 18'h10000;
                qTestInput <= 18'h10000;
            end
            else begin
                iTestInput <= 18'h0;
                qTestInput <= 18'h0;
            end
        end
    end



    // Instantiate the TED
    wire    signed  [17:0]  tedOutput;
    multihSuperbaudTED ted ( 
        .clk(clk), 
        .reset(reset), 
        .symEn(symEn),
        .sym2xEn(sym2xEn),
        .i(iTestInput),
        .q(qTestInput),
        .tedOutput()
    );


    initial begin
        reset = 0;
        clk = 0;

        // Turn on the clock
        clken=1;
        #(10*C) ;

        reset = 1;
        #(2*C) ;
        reset = 0;

        repeat (256) @(posedge sym2xEn)  ;

        $stop;

    end


endmodule


`endif
