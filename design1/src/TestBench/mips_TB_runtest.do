SetActiveLib -work
comp -include "C:\Users\Sandy 3Laa\Desktop\HW Project\MIPs\design1/src/mips.vhd" 
comp -include "$DSN\src\TestBench\mips_TB.vhd" 
asim TESTBENCH_FOR_mips 
wave 
wave -noreg clk
wave -noreg reset
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\mips_TB_tim_cfg.vhd" 
# asim TIMING_FOR_mips 
