%
% script for producing the new template header file for the trellis
% detector
%
% This version does the following:
%   * uses gen_fqpsk() to generate the waveforms
%   * has a detection filter with unit gain
%   * produces LUT entries based on the 8 waveform representation
%     of the Tier 1 waveforms
%

Create_lu_table = 1;
Create_coe_files = 1;
DrawPlots = 0;

Nb = 32;

% df is the detection filter--it is used to generate the LUT entries 
% and is needed for the generation of the header file
EvenTaps = 1;
mode = 2;
[b_k, beta_k, c_k] = gen_pam2(Nb, mode, EvenTaps);
df = c_k(1:2*Nb,2);

% df = [ 0.02046496156855, 0.13540717273869, 0.35768804191911, 0.54607947695240, ...
%        0.54607947695240, 0.35768804191911, 0.13540717273869, 0.02046496156855];

df_gain = sum(df);

df = df/df_gain;        % set the DC gain of the detection filter to 1

len = 2136;

offset = 8;
% generate the 4 signals
b = zeros(64*8+32,1);
for n = 0:63
    b([8*n+1:8*n+8]+offset) = [0, dec2bin(n,6)-'0', 0]';
end
s00 = gen_fqpsk(b,Nb,2);
sig00 = conv(df,s00);

b = zeros(64*8+32,1);
for n = 0:63
    b([8*n+1:8*n+8]+offset) = [0, dec2bin(n,6)-'0', 1]';
end
s01 = gen_fqpsk(b,Nb,2);
sig01 = conv(df,s01);

b = zeros(64*8+32,1);
for n = 0:63
    b([8*n+1:8*n+8]+offset) = [1, dec2bin(n,6)-'0', 0]';
end
s10 = gen_fqpsk(b,Nb,2);
sig10 = conv(df,s10);

b = zeros(64*8+32,1);
for n = 0:63
    b([8*n+1:8*n+8]+offset) = [1, dec2bin(n,6)-'0', 1]';
end
s11 = gen_fqpsk(b,Nb,2);
sig11 = conv(df,s11);


% then extract the signals and average the four together
temp00 = zeros(Nb+1,64);
temp01 = zeros(Nb+1,64);
temp10 = zeros(Nb+1,64);
temp11 = zeros(Nb+1,64);
template = zeros(Nb+1,65);
template2 = zeros(Nb+1,65);

% generate the table for when the I bit is the first bit
samp_offset = 15*Nb+1;
for n = 1:32
    sig_a = sig00([0:Nb]+(n-1)*8*Nb+samp_offset);
    sig_b = sig01([0:Nb]+(n-1)*8*Nb+samp_offset);
    sig_c = sig00([0:Nb]+(n+32-1)*8*Nb+samp_offset);
    sig_d = sig01([0:Nb]+(n+32-1)*8*Nb+samp_offset);
    template(:,2*(n-1)+1) = (sig_a + sig_b + sig_c + sig_d)/4;
    
    sig_a = sig10([0:Nb]+(n-1)*8*Nb+samp_offset);
    sig_b = sig11([0:Nb]+(n-1)*8*Nb+samp_offset);
    sig_c = sig10([0:Nb]+(n+32-1)*8*Nb+samp_offset);
    sig_d = sig11([0:Nb]+(n+32-1)*8*Nb+samp_offset);
    template(:,2*(n-1)+2) = (sig_a + sig_b + sig_c + sig_d)/4;
end

% generate the table for when the Q bit is the first bit
samp_offset = 14*Nb+1;
for n = 1:64
    temp00(:,n) = sig00([0:Nb]+(n-1)*8*Nb+samp_offset);
    temp01(:,n) = sig01([0:Nb]+(n-1)*8*Nb+samp_offset);
    temp10(:,n) = sig10([0:Nb]+(n-1)*8*Nb+samp_offset);
    temp11(:,n) = sig11([0:Nb]+(n-1)*8*Nb+samp_offset);

    template2(:,n) = (temp00(:,n)+temp01(:,n)+temp10(:,n)+temp11(:,n))/4;
end

% generate the templates based on the 8 waveform representation of the Tier 1
% waveforms
template_8 = zeros(Nb+1,16);
template_8_2 = zeros(Nb+1,16);
for n = 1:16
    ndx = 2*n-1;
    template_8(:,n) = (template(:,ndx)+template(:,ndx+1)+template(:,ndx+32)+template(:,ndx+33))/4;
    template_8_2(:,n) = (template2(:,ndx)+template2(:,ndx+1)+template2(:,ndx+32)+template2(:,ndx+33))/4;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Create lu_table.h %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(Create_lu_table)
    % open the header file
    file_name = sprintf('lu_table_8wave_%02d.h',Nb);
    fid = fopen(file_name,'wt');
%     fid = fopen('c:\nelson\space_time\stc_soqpsk_delay\lu_table.h','wt');
    
    fprintf(fid,'/* \n');
    fprintf(fid,' *  This header file contains the lookup tables for generating the trellis \n');
    fprintf(fid,' *  used for detecting the STC encoded Tier 1 signals.  It also contains the matched \n');
    fprintf(fid,' *  filter taps.  There are two tables--one for when the I bit is the MSB in the index \n');
    fprintf(fid,' *  and one for when the Q bit is the MSB in the index.\n');
    fprintf(fid,' *  \n');
    fprintf(fid,' *  Note that this version is based on the 8 waveform representation of the Tier 1 modulations.\n');
    fprintf(fid,' *  \n');
    fprintf(fid,' *  The sample rate for this file is %d samples per bit\n',Nb);
    fprintf(fid,' *  \n');
    fprintf(fid,' *  These are the samples you get for the waveforms after they have been filtered \n');
    fprintf(fid,' *  with the detection filter given below. \n');
    fprintf(fid,' *  \n');
    fprintf(fid,' *  NOTE: these are the updated versions of the tables.\n');
    fprintf(fid,' *  \n');
    fprintf(fid,' *  This file was produced by gen_trellis_template_header_8wave.m\n');
    fprintf(fid,' */ \n\n');
    
    fprintf(fid,'#define    MF_LENGTH   %d      // (MF_LENGTH is 2*NB)\n\n',length(df));
    fprintf(fid,'#define    NB_LUT      %d      // samples/bit in the LUT\n\n',Nb);
    
    % write out the template samples
    fprintf(fid,'float lu_tableI_r[16][%d] = { ',Nb+1);
    
    nn = 0;
    for n = 1:16;
        fprintf(fid,'\n                           { ');
        for nn = 1:Nb+1;
            fprintf(fid,'% .8ff, ',real(template_8(nn,n)));
        end
        fprintf(fid,'},');
    end
    fprintf(fid,' };\n\n');
    
    fprintf(fid,'float lu_tableI_i[16][%d] = { ',Nb+1);
    
    nn = 0;
    for n = 1:16;
        fprintf(fid,'\n                           { ');
        for nn = 1:Nb+1;
            fprintf(fid,'% .8ff, ',imag(template_8(nn,n)));
        end
        fprintf(fid,'},');
    end
    fprintf(fid,' };\n\n');
    
    % write out the template samples
    fprintf(fid,'float lu_tableQ_r[16][%d] = { ',Nb+1);
    
    nn = 0;
    for n = 1:16;
        fprintf(fid,'\n                           { ');
        for nn = 1:Nb+1;
            fprintf(fid,'% .8ff, ',real(template_8_2(nn,n)));
        end
        fprintf(fid,'},');
    end
    fprintf(fid,' };\n\n');
    
    fprintf(fid,'float lu_tableQ_i[16][%d] = { ',Nb+1);
    
    nn = 0;
    for n = 1:16;
        fprintf(fid,'\n                           { ');
        for nn = 1:Nb+1;
            fprintf(fid,'% .8ff, ',imag(template_8_2(nn,n)));
        end
        fprintf(fid,'},');
    end
    fprintf(fid,' };\n\n');
    
    % write out the matched filter taps
    fprintf(fid,'float mf[%d] = {',length(df));
    
    nn = 0;
    for n = 1:length(df);
        if(n>1)
            fprintf(fid,'\n               ');
        end
        fprintf(fid,'% .8ff,',df(n));
    end
    fprintf(fid,' };\n\n');
    
    
    fclose(fid);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Create .coe files %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(Create_coe_files == 1)
    file_name = sprintf('y8_IReal_QImag.coe');
    fid = fopen(file_name,'wt');
    fprintf(fid,'memory_initialization_radix = 10;\n');
    fprintf(fid,'memory_initialization_vector =\n');
    nn = 0;
    for n = 1:15;
        for nn = 1:Nb+1;
            fprintf(fid,' %d,\n',round((2^17)*real(template_8(nn,n))));
        end
    end
    for nn = 1:Nb;
        fprintf(fid,' %d,\n',round((2^17)*real(template_8(nn,16))));
    end
    fprintf(fid,' %d;\n',round((2^17)*real(template_8(Nb+1,16))));
    fclose(fid);

    file_name = sprintf('y8_IImag_QReal.coe');
    fid = fopen(file_name,'wt');
    fprintf(fid,'memory_initialization_radix = 10;\n');
    fprintf(fid,'memory_initialization_vector =\n');
    nn = 0;
    for n = 1:15;
        for nn = 1:Nb+1;
            fprintf(fid,' %d,\n',round((2^17)*imag(template_8(nn,n))));
        end
    end
    for nn = 1:Nb;
        fprintf(fid,' %d,\n',round((2^17)*imag(template_8(nn,16))));
    end
    fprintf(fid,' %d;\n',round((2^17)*imag(template_8(Nb+1,16))));
    fclose(fid);

end



