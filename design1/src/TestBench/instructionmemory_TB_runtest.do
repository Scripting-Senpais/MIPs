SetActiveLib -work
comp -include "d:\Uni\PROJECTS\HW Project\MIPs\design1/src/instructionmemory.vhd" 
comp -include "$DSN\src\TestBench\instructionmemory_TB.vhd" 
asim TESTBENCH_FOR_instructionmemory 
wave 
wave -noreg ReadAddress
wave -noreg Instruction
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\instructionmemory_TB_tim_cfg.vhd" 
# asim TIMING_FOR_instructionmemory 
