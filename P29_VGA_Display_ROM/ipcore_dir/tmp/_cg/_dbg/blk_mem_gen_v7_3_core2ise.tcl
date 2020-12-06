set errorCount 0

project new blk_mem_gen_v7_3

project set "Manual Implementation Compile Order" true

project set family  spartan6
project set device  xc6slx16
project set package csg324
project set speed   -3

if { ![xfile add "./blk_mem_gen_v7_3/doc/pg058-blk-mem-gen.pdf" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/doc/pg058-blk-mem-gen.pdf' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/doc/blk_mem_gen_v7_3_vinfo.html" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/doc/blk_mem_gen_v7_3_vinfo.html' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/blk_mem_gen_v7_3_readme.txt" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/blk_mem_gen_v7_3_readme.txt' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_exdes.ucf" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_exdes.ucf' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_exdes.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_exdes.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_exdes.xdc" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_exdes.xdc' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_prod.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/example_design/blk_mem_gen_v7_3_prod.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/implement/implement.bat" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/implement/implement.bat' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/implement/implement.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/implement/implement.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/implement/planAhead_ise.bat" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/implement/planAhead_ise.bat' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/implement/planAhead_ise.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/implement/planAhead_ise.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/implement/planAhead_ise.tcl" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/implement/planAhead_ise.tcl' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/implement/xst.prj" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/implement/xst.prj' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/implement/xst.scr" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/implement/xst.scr' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/addr_gen.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/addr_gen.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/blk_mem_gen_v7_3_synth.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/blk_mem_gen_v7_3_synth.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/blk_mem_gen_v7_3_tb.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/blk_mem_gen_v7_3_tb.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/bmg_stim_gen.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/bmg_stim_gen.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/bmg_tb_pkg.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/bmg_tb_pkg.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/checker.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/checker.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/data_gen.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/data_gen.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/simcmds.tcl" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/simcmds.tcl' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/simulate_isim.bat" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/simulate_isim.bat' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/simulate_mti.bat" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/simulate_mti.bat' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/simulate_mti.do" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/simulate_mti.do' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/simulate_mti.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/simulate_mti.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/simulate_ncsim.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/simulate_ncsim.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/simulate_vcs.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/simulate_vcs.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/ucli_commands.key" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/ucli_commands.key' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/vcs_session.tcl" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/vcs_session.tcl' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/wave_mti.do" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/wave_mti.do' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/functional/wave_ncsim.sv" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/functional/wave_ncsim.sv' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/random.vhd" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/random.vhd' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/simcmds.tcl" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/simcmds.tcl' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/simulate_isim.bat" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/simulate_isim.bat' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/simulate_mti.bat" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/simulate_mti.bat' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/simulate_mti.do" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/simulate_mti.do' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/simulate_mti.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/simulate_mti.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/simulate_ncsim.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/simulate_ncsim.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/simulate_vcs.sh" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/simulate_vcs.sh' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/ucli_commands.key" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/ucli_commands.key' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/vcs_session.tcl" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/vcs_session.tcl' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/wave_mti.do" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/wave_mti.do' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3/simulation/timing/wave_ncsim.sv" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3/simulation/timing/wave_ncsim.sv' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3.ngc" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3.ngc' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3.vho" -view implementation -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3.vho' to ISE project."
   incr errorCount
}
if { ![xfile add "./blk_mem_gen_v7_3.vhd" -view all -origin_type created] } {
   puts "ERROR: Failed to add './blk_mem_gen_v7_3.vhd' to ISE project."
   incr errorCount
}

project set top "blk_mem_gen_v7_3"

project set "Project Generator" CoreGen
project set "Implementation Stop View" Structural

project save
project close

exit $errorCount
