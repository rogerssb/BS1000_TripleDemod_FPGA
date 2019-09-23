order = 34;
bitSize = 16;
hb = firhalfband(order,0.00001,'dev');% hb = firhalfband(order,.5);
fvt = fvtool(hb,'FS',1,'Color','white');
hb_e = hb(1:2:order+1);
hb_e_fix= round(hb_e.*(2^(bitSize-1)-1)); 
hb_o = hb(2:2:order+1);
hb_o_fix = round(hb_o.*(2^(bitSize-1)-1));
%gain=sum(hbf_e);

delta = 0.05;
hbPMc = firpm(order,[0 0.25-delta 0.25+delta 0.5]*2,[1 1 0 0]);
dcGain = sum(hbPMc);
hbPMc = hbPMc / dcGain;
hbPMc_e=hbPMc(1:2:order+1);
fvt = fvtool(hbPMc,'FS',1,'Color',[.5 .5 .5]);
