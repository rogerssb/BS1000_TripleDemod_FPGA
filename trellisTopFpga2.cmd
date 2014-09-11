setMode -bs
setCable -port auto
Identify -inferir
identifyMPM
attachflash -position 2 -spi "AT45DB642D"
assignfiletoattachedflash -position 2 -file trellisTopFpga2.mcs
Program -p 2 -dataWidth 1 -spionly -e -v -loadfpga
quit
