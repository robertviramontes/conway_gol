# Legal Notice: (C)2014 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	lt24_qsys_nios2_gen2_0 	lt24_qsys_nios2_gen2_0:*
set 	lt24_qsys_nios2_gen2_0_oci 	lt24_qsys_nios2_gen2_0_nios2_oci:the_lt24_qsys_nios2_gen2_0_nios2_oci
set 	lt24_qsys_nios2_gen2_0_oci_break 	lt24_qsys_nios2_gen2_0_nios2_oci_break:the_lt24_qsys_nios2_gen2_0_nios2_oci_break
set 	lt24_qsys_nios2_gen2_0_ocimem 	lt24_qsys_nios2_gen2_0_nios2_ocimem:the_lt24_qsys_nios2_gen2_0_nios2_ocimem
set 	lt24_qsys_nios2_gen2_0_oci_debug 	lt24_qsys_nios2_gen2_0_nios2_oci_debug:the_lt24_qsys_nios2_gen2_0_nios2_oci_debug
set 	lt24_qsys_nios2_gen2_0_wrapper 	lt24_qsys_nios2_gen2_0_jtag_debug_slave_wrapper:the_lt24_qsys_nios2_gen2_0_jtag_debug_slave_wrapper
set 	lt24_qsys_nios2_gen2_0_jtag_tck 	lt24_qsys_nios2_gen2_0_jtag_debug_slave_tck:the_lt24_qsys_nios2_gen2_0_jtag_debug_slave_tck
set 	lt24_qsys_nios2_gen2_0_jtag_sysclk 	lt24_qsys_nios2_gen2_0_jtag_debug_slave_sysclk:the_lt24_qsys_nios2_gen2_0_jtag_debug_slave_sysclk
set 	lt24_qsys_nios2_gen2_0_oci_path 	 [format "%s|%s" $lt24_qsys_nios2_gen2_0 $lt24_qsys_nios2_gen2_0_oci]
set 	lt24_qsys_nios2_gen2_0_oci_break_path 	 [format "%s|%s" $lt24_qsys_nios2_gen2_0_oci_path $lt24_qsys_nios2_gen2_0_oci_break]
set 	lt24_qsys_nios2_gen2_0_ocimem_path 	 [format "%s|%s" $lt24_qsys_nios2_gen2_0_oci_path $lt24_qsys_nios2_gen2_0_ocimem]
set 	lt24_qsys_nios2_gen2_0_oci_debug_path 	 [format "%s|%s" $lt24_qsys_nios2_gen2_0_oci_path $lt24_qsys_nios2_gen2_0_oci_debug]
set 	lt24_qsys_nios2_gen2_0_jtag_tck_path 	 [format "%s|%s|%s" $lt24_qsys_nios2_gen2_0_oci_path $lt24_qsys_nios2_gen2_0_wrapper $lt24_qsys_nios2_gen2_0_jtag_tck]
set 	lt24_qsys_nios2_gen2_0_jtag_sysclk_path 	 [format "%s|%s|%s" $lt24_qsys_nios2_gen2_0_oci_path $lt24_qsys_nios2_gen2_0_wrapper $lt24_qsys_nios2_gen2_0_jtag_sysclk]
set 	lt24_qsys_nios2_gen2_0_jtag_sr 	 [format "%s|*sr" $lt24_qsys_nios2_gen2_0_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$lt24_qsys_nios2_gen2_0_oci_break_path|break_readreg*] -to [get_keepers *$lt24_qsys_nios2_gen2_0_jtag_sr*]
set_false_path -from [get_keepers *$lt24_qsys_nios2_gen2_0_oci_debug_path|*resetlatch]     -to [get_keepers *$lt24_qsys_nios2_gen2_0_jtag_sr[33]]
set_false_path -from [get_keepers *$lt24_qsys_nios2_gen2_0_oci_debug_path|monitor_ready]  -to [get_keepers *$lt24_qsys_nios2_gen2_0_jtag_sr[0]]
set_false_path -from [get_keepers *$lt24_qsys_nios2_gen2_0_oci_debug_path|monitor_error]  -to [get_keepers *$lt24_qsys_nios2_gen2_0_jtag_sr[34]]
set_false_path -from [get_keepers *$lt24_qsys_nios2_gen2_0_ocimem_path|*MonDReg*] -to [get_keepers *$lt24_qsys_nios2_gen2_0_jtag_sr*]
set_false_path -from *$lt24_qsys_nios2_gen2_0_jtag_sr*    -to *$lt24_qsys_nios2_gen2_0_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$lt24_qsys_nios2_gen2_0_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$lt24_qsys_nios2_gen2_0_oci_debug_path|monitor_go
