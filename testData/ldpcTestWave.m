% ldpcTestWave.m - create baseband I/Q for testLdpcDecoder.v

writeTestVectors = 0;
writeMatFile = 0;
writeSimVectors = 1;

% PN sequence order
pnOrder = 6;
pnLength = 2^pnOrder - 1;

% Samples per symbol
sps = 4;

% LDPC parameters
% codeRate = 1/2;
codeRate = 2/3;
% codeRate = 4/5;
infoBitsPerCodeword = 1024;
% infoBitsPerCodeword = 4096;
if (infoBitsPerCodeword == 4096)
    syncLength = 4*64;
else 
    syncLength = 64;
end
codewordBits = infoBitsPerCodeword/codeRate;
parityBits = codewordBits - infoBitsPerCodeword;


% Constants for extracting a cyclic waveform
bitsPerFrame = syncLength + codewordBits;
frames = pnLength;

% Offset to start grabbing soqpsk samples
OFFSET_BITS = bitsPerFrame - 384;

syncBits = [ 1 1 1 1    1 1 0 0     1 0 1 1     1 0 0 0 ...
             1 0 0 0    1 0 0 1     0 0 1 1     1 0 0 0 ...
             1 1 0 1    1 0 0 0     1 1 0 1     0 1 1 1 ...
             0 1 1 0    1 0 1 0     0 1 0 0     1 1 1 1 ]; 
if (infoBitsPerCodeword == 4096)
    syncBits = [ syncBits syncBits not(syncBits) syncBits ];
end

syncMatrix = ones(frames,1) * syncBits;

% Create a frame per row of pn data
infoBits = cast(pngen(pnOrder,frames*infoBitsPerCodeword),'double');
infoMatrix = reshape(infoBits,[infoBitsPerCodeword frames])';

% LDPC encode each row

if (infoBitsPerCodeword == 4096)
    if (codeRate == 1/2)
        load W_ROW_ROM_1024_1_2;
    elseif (codeRate == 2/3)
        load W_ROW_ROM_1024_2_3;
    else % Must be 4/5
        load W_ROW_ROM_4096_4_5;
    end
else 
    if (codeRate == 1/2)
        load W_ROW_ROM_1024_1_2;
    elseif (codeRate == 2/3)
        load W_ROW_ROM_1024_2_3;
    else % Must be 4/5
        load W_ROW_ROM_1024_4_5;
    end
end
for i=1:frames
    codedMatrix(i,:) = LdpcEncoder1(infoMatrix(i,:),W_ROW_ROM,parityBits/8);
end


% Combine sync with payload
framedBits = [ syncMatrix not(codedMatrix)];

% Add cyclic start and end frames
framedBits = [ syncBits   not(codedMatrix(frames,:)) ;       ...
               syncMatrix not(codedMatrix) ;                 ...
               syncBits   not(codedMatrix(1,:)) ]; 

% Turn it back into a single row vector
framedBits = reshape(framedBits',[1 (frames+2)*bitsPerFrame]);

% SOQPSK Modulator
FeherDiffEncode = 0;
z = soqpskmod(framedBits, sps, 1, FeherDiffEncode);

% get the middle portion to avoid the startup and ending transistions
midSectionStart = OFFSET_BITS*sps;
midSectionEnd = midSectionStart + frames*bitsPerFrame*sps;

beginning = angle(z(midSectionStart-16:midSectionStart+16));
endz = angle(z(midSectionEnd-16:midSectionEnd+16));

figure(1);
plot(beginning, '*');
%figure;
%plot(middle, '*');
figure(2);
plot(endz, '*');

z = z(midSectionStart:midSectionEnd-1);

figure(3);
plot(angle(z(1:32)), '*');
figure(4);
plot(angle(z(end-32:end)), '*');

lenz = length(z)

beginingPhase = angle(z(1))
endingPhase = angle(z(end))

if (writeMatFile == 1) 
    if (infoBitsPerCodeword == 4096)
        fprintf('Generating ldpc_4096_4_5_4x.mat\n');
        title = sprintf('ldpc_4096_4_5_4x.mat');
    else
        fprintf('Generating ldpc_1024_4_5_4x.mat\n');
        title = sprintf('ldpc_1024_4_5_4x.mat');
    end
    I=real(z);
    Q=imag(z);
    Marker = zeros(1, length(z));
    Marker(1) = 1;
    save(title, 'I', 'Q', 'Marker', '-mat');
    IT = I';
    QT = Q';
end
if (writeTestVectors == 1)
    realz = real(z)';
    imagz = imag(z)';
    if (infoBitsPerCodeword == 4096)
        save('ldpcTestWaveform_I_4096_4_5.txt','realz','-ascii');
        save('ldpcTestWaveform_Q_4096_4_5.txt','imagz','-ascii');
    else
        save('ldpcTestWaveform_I_1024_4_5.txt','realz','-ascii');
        save('ldpcTestWaveform_Q_1024_4_5.txt','imagz','-ascii');
    end
end
if (writeSimVectors == 1)
    framedBits = framedBits - 0.5;
    iData = downsample(framedBits,2,0);
    iData = upsample(iData,2,0);
    qData = downsample(framedBits,2,1);
    qData = upsample(qData,2,1);
    if (infoBitsPerCodeword == 4096)
        if (codeRate == 1/2)
            save('ldpcSimWaveform_I_4096_1_2.txt','iData','-ascii');
            save('ldpcSimWaveform_Q_4096_1_52txt','qData','-ascii');
        elseif (codeRate == 2/3)
            save('ldpcSimWaveform_I_4096_2_3.txt','iData','-ascii');
            save('ldpcSimWaveform_Q_4096_2_3.txt','qData','-ascii');
        else % Must be 4/5
            save('ldpcSimWaveform_I_4096_4_5.txt','iData','-ascii');
            save('ldpcSimWaveform_Q_4096_4_5.txt','qData','-ascii');
        end
    else
        if (codeRate == 1/2)
            save('ldpcSimWaveform_I_1024_1_2.txt','iData','-ascii');
            save('ldpcSimWaveform_Q_1024_1_52txt','qData','-ascii');
        elseif (codeRate == 2/3)
            save('ldpcSimWaveform_I_1024_2_3.txt','iData','-ascii');
            save('ldpcSimWaveform_Q_1024_2_3.txt','qData','-ascii');
        else % Must be 4/5
            save('ldpcSimWaveform_I_1024_4_5.txt','iData','-ascii');
            save('ldpcSimWaveform_Q_1024_4_5.txt','qData','-ascii');
        end
    end
end

