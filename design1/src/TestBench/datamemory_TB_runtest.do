SetActiveLib -work
comp -include "C:\Users\Sandy 3Laa\Desktop\HW Project\MIPs\design1/src/DataMemory.vhd" 
comp -include "$DSN\src\TestBench\datamemory_TB.vhd" 
asim TESTBENCH_FOR_datamemory 
wave 
wave -noreg MemRead
wave -noreg MemWrite
wave -noreg Address
wave -noreg WriteData
wave -noreg ReadData
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\datamemory_TB_tim_cfg.vhd" 
# asim TIMING_FOR_datamemory 
