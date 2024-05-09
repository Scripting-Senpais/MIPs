SetActiveLib -work
comp -include "d:\Uni\PROJECTS\HW Project\MIPs\design1/src/ALU.vhd" 
comp -include "$DSN\src\TestBench\alu_TB.vhd" 
asim TESTBENCH_FOR_alu 
wave 
wave -noreg A1
wave -noreg A2
wave -noreg ALU_CONTROL
wave -noreg ALU_RESULT
wave -noreg ZERO
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\alu_TB_tim_cfg.vhd" 
# asim TIMING_FOR_alu 
