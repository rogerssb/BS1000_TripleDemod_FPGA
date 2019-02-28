#!/bin/bash
# argument 1 is CH0 bitrate
# argument 2 is CH1 bitrate
# argument 3 is the serial port used
./modbusWrite -w1        -r1   -p$3
sleep 1
# Ch0 bitrate
./modbusWrite -d$1       -r12  -p$3
sleep 2
# Dual decoder config. Set for 180 clock phase
./modbusWrite -w0x0006   -r2   -p$3
sleep 1
./modbusWrite -w0x0001   -r109 -p$3
sleep 2
# Ch1 bitrate
./modbusWrite -d$2       -r32  -p$3
sleep 2
# Ch1 decoder config. Set for 180 clock phase
./modbusWrite -w0x0006   -r30  -p$3
sleep 1
./modbusWrite -w0x0001   -r111 -p$3
sleep 1
# CandD output muxes: Ch0=>BS Coax, Ch1=> Enc Coax
./modbusWrite -w1 -r3 -p$3
sleep 1
./modbusWrite -w3 -r7 -p$3


