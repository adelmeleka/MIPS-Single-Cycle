onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/dut/mips/clk
add wave -noupdate /testbench/dut/mips/reset
add wave -noupdate /testbench/dut/mips/pc
add wave -noupdate /testbench/dut/mips/instr
add wave -noupdate /testbench/dut/mips/aluout
add wave -noupdate /testbench/dut/mips/writedata
add wave -noupdate /testbench/dut/mips/memwrite
add wave -noupdate /testbench/dut/mips/readdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
configure wave -valuecolwidth 73
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
WaveRestoreZoom {62 ns} {125 ns}
