setMode -bs
setCable -port auto
Identify -inferir
identifyMPM
attachflash -position 1 -spi "AT45DB642D"
assignfiletoattachedflash -position 1 -file legacyCmaTop.mcs
Program -p 1 -dataWidth 1 -spionly -e -v -loadfpga
quit
