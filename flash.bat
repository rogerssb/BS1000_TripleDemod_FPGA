SET XILINX_PATH="C:\Xilinx\13.4\ISE_DS\ISE\bin\nt64"

%XILINX_PATH%\promgen -w -p mcs -c FF -o %1 -s 8192 -u 0000 %1.bit -spi
%XILINX_PATH%\impact.exe -batch %1.cmd

