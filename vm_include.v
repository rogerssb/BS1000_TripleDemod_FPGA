//  2^(-k)      
//  1                 
//  0.5          
//  0.25         
//  0.125        
//  0.0625       
//  0.03125      
//  0.015625     
//  0.0078125   
//
// atan(2^(-k)) * 2^bits / 2 / (2*pi) 


parameter atan_ki = n==08 ? 'h0020 : (
                    n==10 ? 'h0080 : (
                    n==12 ? 'h0200 : (
                    n==14 ? 'h0800 : (
                    n==16 ? 'h2000 : (
                    n==18 ? 'h08000 : 'h20000))))),

          atan_k0 = n==08 ? 'h0010 : (
                    n==10 ? 'h0040 : (
                    n==12 ? 'h0100 : (
                    n==14 ? 'h0400 : (
                    n==16 ? 'h1000 : (
                    n==18 ? 'h04000 : 'h10000))))),

          atan_k1 = n==08 ? 'h0009 : (
                    n==10 ? 'h0026 : (
                    n==12 ? 'h0097 : (
                    n==14 ? 'h025d : (
                    n==16 ? 'h0972 : (
                    n==18 ? 'h025c8 : 'h09720))))),

          atan_k2 = n==08 ? 'h0005 : (
                    n==10 ? 'h0014 : (
                    n==12 ? 'h0050 : (
                    n==14 ? 'h013f : (
                    n==16 ? 'h04fe : (
                    n==18 ? 'h013f6 : 'h04fda))))),

          atan_k3 = n==08 ? 'h0003 : (
                    n==10 ? 'h000a : (
                    n==12 ? 'h0029 : (
                    n==14 ? 'h00a2 : (
                    n==16 ? 'h0289 : (
                    n==18 ? 'h00a22 : 'h02889))))),

          atan_k4 = n==08 ? 'h0001 : (
                    n==10 ? 'h0005 : (
                    n==12 ? 'h0014 : (
                    n==14 ? 'h0051 : (
                    n==16 ? 'h0146 : (
                    n==18 ? 'h00516 : 'h01458))))),

          atan_k5 = n==08 ? 'h0001 : (
                    n==10 ? 'h0003 : (
                    n==12 ? 'h000a : (
                    n==14 ? 'h0029 : (
                    n==16 ? 'h00a3 : (
                    n==18 ? 'h0028c : 'h00a2f))))),

          atan_k6 = n==08 ? 'h0000 : (
                    n==10 ? 'h0001 : (
                    n==12 ? 'h0005 : (
                    n==14 ? 'h0014 : (
                    n==16 ? 'h0051 : (
                    n==18 ? 'h00146 : 'h00518))))),

          atan_k7 = n==08 ? 'h0000 : (
                    n==10 ? 'h0001 : (
                    n==12 ? 'h0003 : (
                    n==14 ? 'h000a : (
                    n==16 ? 'h0029 : (
                    n==18 ? 'h000a3 : 'h0028c)))));


parameter natan_ki = n==08 ? 'hffe0 : (
                        n==10 ? 'hff80 : (
                        n==12 ? 'hfe00 : (
                        n==14 ? 'hf800 : (
                        n==16 ? 'hfe00 : (
                        n==18 ? 'hf8000 : 'he0000))))),

             natan_k0 = n==08 ? 'hfff0 : (
                        n==10 ? 'hffc0 : (
                        n==12 ? 'hff00 : (
                        n==14 ? 'hfc00 : (
                        n==16 ? 'hf000 : (
                        n==18 ? 'hfc000 : 'hf0000))))),

             natan_k1 = n==08 ? 'hfff7 : (
                        n==10 ? 'hffda : (
                        n==12 ? 'hff69 : (
                        n==14 ? 'hfda3 : (
                        n==16 ? 'hf68e : (
                        n==18 ? 'hfda38 : 'hf68e0))))),

             natan_k2 = n==08 ? 'hfffb : (
                        n==10 ? 'hffec : (
                        n==12 ? 'hffb0 : (
                        n==14 ? 'hfec1 : (
                        n==16 ? 'hfb02 : (
                        n==18 ? 'hfec0a : 'hfb026))))),

             natan_k3 = n==08 ? 'hfffd : (
                        n==10 ? 'hfff6 : (
                        n==12 ? 'hffd7 : (
                        n==14 ? 'hff5e : (
                        n==16 ? 'hfd77 : (
                        n==18 ? 'hff5de : 'hfd777))))),

             natan_k4 = n==08 ? 'hffff : (
                        n==10 ? 'hfffb : (
                        n==12 ? 'hffec : (
                        n==14 ? 'hffaf : (
                        n==16 ? 'hfeba : (
                        n==18 ? 'hffaea : 'hfeba8))))),

             natan_k5 = n==08 ? 'hffff : (
                        n==10 ? 'hfffd : (
                        n==12 ? 'hfff6 : (
                        n==14 ? 'hffd7 : (
                        n==16 ? 'hff5d : (
                        n==18 ? 'hffd74 : 'hff5d1))))),

             natan_k6 = n==08 ? 'h0000 : (
                        n==10 ? 'hffff : (
                        n==12 ? 'hfffb : (
                        n==14 ? 'hffec : (
                        n==16 ? 'hffaf : (
                        n==18 ? 'hffeba : 'hffae8))))),

             natan_k7 = n==08 ? 'h0000 : (
                        n==10 ? 'hffff : (
                        n==12 ? 'hfffd : (
                        n==14 ? 'hfff6 : (
                        n==16 ? 'hffd7 : (
                        n==18 ? 'hfff5d : 'hffd74)))));


//  for n = 10, parameters are set to match the CORDIC in the Microdyne RCB-4000

// magnitude output slice

parameter mh = 10, ml = 2;

// phase output slice

parameter ph = 8, pl = 1;


