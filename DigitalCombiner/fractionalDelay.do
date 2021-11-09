onerror {resume}
quietly virtual function -install /testFractionalDelay -env /testFractionalDelay { &{/testFractionalDelay/sampleOffset[13], /testFractionalDelay/sampleOffset[12], /testFractionalDelay/sampleOffset[11], /testFractionalDelay/sampleOffset[10], /testFractionalDelay/sampleOffset[9], /testFractionalDelay/sampleOffset[8], /testFractionalDelay/sampleOffset[7], /testFractionalDelay/sampleOffset[6], /testFractionalDelay/sampleOffset[5] }} IntOffsey
quietly WaveActivateNextPane {} 0
add wave -noupdate /testFractionalDelay/C
add wave -noupdate /testFractionalDelay/HC
add wave -noupdate /testFractionalDelay/OffTunedSines
add wave -noupdate /testFractionalDelay/SAMPLE_FREQ
add wave -noupdate /testFractionalDelay/clk
add wave -noupdate /testFractionalDelay/clken
add wave -noupdate /testFractionalDelay/cosineOut
add wave -noupdate /testFractionalDelay/ddsreset
add wave -noupdate /testFractionalDelay/freq
add wave -noupdate /testFractionalDelay/iIn
add wave -noupdate /testFractionalDelay/reset
add wave -noupdate /testFractionalDelay/sineOut
add wave -noupdate /testFractionalDelay/sync
add wave -noupdate /testFractionalDelay/syncCount
add wave -noupdate /testFractionalDelay/syncDecimation
add wave -noupdate {/testFractionalDelay/iIn[17]}
add wave -noupdate -radix sfixed {/testFractionalDelay/delay/in[17]}
add wave -noupdate -radix sfixed {/testFractionalDelay/delay/out[17]}
add wave -noupdate -format Analog-Step -height 74 -max 65219.0 -min -65220.0 -radix sfixed -childformat {{{/testFractionalDelay/delay/in[17]} -radix sfixed} {{/testFractionalDelay/delay/in[16]} -radix sfixed} {{/testFractionalDelay/delay/in[15]} -radix sfixed} {{/testFractionalDelay/delay/in[14]} -radix sfixed} {{/testFractionalDelay/delay/in[13]} -radix sfixed} {{/testFractionalDelay/delay/in[12]} -radix sfixed} {{/testFractionalDelay/delay/in[11]} -radix sfixed} {{/testFractionalDelay/delay/in[10]} -radix sfixed} {{/testFractionalDelay/delay/in[9]} -radix sfixed} {{/testFractionalDelay/delay/in[8]} -radix sfixed} {{/testFractionalDelay/delay/in[7]} -radix sfixed} {{/testFractionalDelay/delay/in[6]} -radix sfixed} {{/testFractionalDelay/delay/in[5]} -radix sfixed} {{/testFractionalDelay/delay/in[4]} -radix sfixed} {{/testFractionalDelay/delay/in[3]} -radix sfixed} {{/testFractionalDelay/delay/in[2]} -radix sfixed} {{/testFractionalDelay/delay/in[1]} -radix sfixed} {{/testFractionalDelay/delay/in[0]} -radix sfixed}} -subitemconfig {{/testFractionalDelay/delay/in[17]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[16]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[15]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[14]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[13]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[12]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[11]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[10]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[9]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[8]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[7]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[6]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[5]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[4]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[3]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[2]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[1]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/in[0]} {-height 15 -radix sfixed}} /testFractionalDelay/delay/in
add wave -noupdate -format Analog-Step -height 74 -max 65497.0 -min -65499.0 -radix sfixed -childformat {{{/testFractionalDelay/delay/out[17]} -radix sfixed} {{/testFractionalDelay/delay/out[16]} -radix sfixed} {{/testFractionalDelay/delay/out[15]} -radix sfixed} {{/testFractionalDelay/delay/out[14]} -radix sfixed} {{/testFractionalDelay/delay/out[13]} -radix sfixed} {{/testFractionalDelay/delay/out[12]} -radix sfixed} {{/testFractionalDelay/delay/out[11]} -radix sfixed} {{/testFractionalDelay/delay/out[10]} -radix sfixed} {{/testFractionalDelay/delay/out[9]} -radix sfixed} {{/testFractionalDelay/delay/out[8]} -radix sfixed} {{/testFractionalDelay/delay/out[7]} -radix sfixed} {{/testFractionalDelay/delay/out[6]} -radix sfixed} {{/testFractionalDelay/delay/out[5]} -radix sfixed} {{/testFractionalDelay/delay/out[4]} -radix sfixed} {{/testFractionalDelay/delay/out[3]} -radix sfixed} {{/testFractionalDelay/delay/out[2]} -radix sfixed} {{/testFractionalDelay/delay/out[1]} -radix sfixed} {{/testFractionalDelay/delay/out[0]} -radix sfixed}} -subitemconfig {{/testFractionalDelay/delay/out[17]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[16]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[15]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[14]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[13]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[12]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[11]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[10]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[9]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[8]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[7]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[6]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[5]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[4]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[3]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[2]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[1]} {-height 15 -radix sfixed} {/testFractionalDelay/delay/out[0]} {-height 15 -radix sfixed}} /testFractionalDelay/delay/out
add wave -noupdate /testFractionalDelay/delay/reset
add wave -noupdate -format Analog-Step -height 74 -max 30.999999999999996 -radix unsigned /testFractionalDelay/delay/sampleOffset
add wave -noupdate /testFractionalDelay/IntDelay/Delay
add wave -noupdate /testFractionalDelay/sampleOffset
add wave -noupdate /testFractionalDelay/delay/sync
add wave -noupdate -format Analog-Step -height 74 -max 65531.999999999985 -min -65534.0 -radix sfixed /testFractionalDelay/Capture
add wave -noupdate /testFractionalDelay/fracOffset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {702428536 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 311
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {700260364 ps} {704596708 ps}
bookmark add wave bookmark0 {{2508730 ps} {2540670 ps}} 0
bookmark add wave bookmark1 {{3023030 ps} {3054970 ps}} 0
bookmark add wave bookmark2 {{2187685 ps} {2199857 ps}} 33
bookmark add wave bookmark3 {{3212803 ps} {3228773 ps}} 48
