
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Final_project -dir "D:/Semestre_9/Sistemas_Digitales_Avanzados/sisdig_final/Final_project/planAhead_run_3" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Semestre_9/Sistemas_Digitales_Avanzados/sisdig_final/Final_project/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Semestre_9/Sistemas_Digitales_Avanzados/sisdig_final/Final_project} {ipcore_dir} }
add_files [list {ipcore_dir/ROM_1.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Top.ucf" [current_fileset -constrset]
add_files [list {Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
