SetActiveLib -work
comp -include "d:\Uni\PROJECTS\HW Project\MIPs\design1/src/RegisterFile.vhd" 
comp -include "$DSN\src\TestBench\registerfile_TB.vhd" 
asim TESTBENCH_FOR_registerfile 
wave 
wave -noreg ReadRegister1
wave -noreg ReadRegister2
wave -noreg WriteRegister
wave -noreg RegWrite
wave -noreg WriteData
wave -noreg ReadData1
wave -noreg ReadData2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\registerfile_TB_tim_cfg.vhd" 
# asim TIMING_FOR_registerfile 
