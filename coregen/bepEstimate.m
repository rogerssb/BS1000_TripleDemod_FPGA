writeFile = 1;

llrMax = log(4e10);
llrMin = 0;
llrRange = (llrMax - llrMin);
llr = llrMin : llrRange/31 : llrMax;
% The "-2" is to force the final result to be 2^32 - 1.
lut = round((2^33 - 2)./(1 + exp(llr)));
if writeFile == 1
    fid = fopen('bepEstimate.txt','w');
    fprintf(fid,'%d\n',lut);
    fclose(fid);

    fid = fopen('bepEstimate0to7.coe','w');
    fprintf(fid,'memory_initialization_radix = 10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',mod(lut(1:31),2^8) );
    fprintf(fid,'%d;\n',mod(lut(32),2^8) );
    fclose(fid);
    lut = round((lut - mod(lut,2^8))./(2^8));

    fid = fopen('bepEstimate8to15.coe','w');
    fprintf(fid,'memory_initialization_radix = 10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',mod(lut(1:31),2^8) );
    fprintf(fid,'%d;\n',mod(lut(32),2^8) );
    fclose(fid);
    lut = round((lut - mod(lut,2^8))./(2^8));

    fid = fopen('bepEstimate16to23.coe','w');
    fprintf(fid,'memory_initialization_radix = 10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',mod(lut(1:31),2^8) );
    fprintf(fid,'%d;\n',mod(lut(32),2^8) );
    fclose(fid);
    lut = round((lut - mod(lut,2^8))./(2^8));

    fid = fopen('bepEstimate24to31.coe','w');
    fprintf(fid,'memory_initialization_radix = 10;\n');
    fprintf(fid,'memory_initialization_vector=\n');
    fprintf(fid,'%d,\n',lut(1:31) );
    fprintf(fid,'%d;\n',lut(32) );
    fclose(fid);

end
