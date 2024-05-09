SetActiveLib -work
comp -include "C:\Users\Sandy 3Laa\Desktop\HW Project\MIPs\design1/src/control.vhd" 
comp -include "$DSN\src\TestBench\control_TB.vhd" 
asim TESTBENCH_FOR_control 
wave 
wave -noreg funct
wave -noreg opCode
wave -noreg RegDst
wave -noreg Branch
wave -noreg memRead
wave -noreg memWrite
wave -noreg ALUsrc
wave -noreg RegWrite
wave -noreg memToReg
wave -noreg op
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\control_TB_tim_cfg.vhd" 
# asim TIMING_FOR_control 
