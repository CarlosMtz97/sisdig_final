
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Final_Project_Videogame -dir "D:/Semestre_9/Sistemas_Digitales_Avanzados/sisdig_final/Final_Project_Videogame/planAhead_run_5" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Semestre_9/Sistemas_Digitales_Avanzados/sisdig_final/Final_Project_Videogame/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Semestre_9/Sistemas_Digitales_Avanzados/sisdig_final/Final_Project_Videogame} }
set_property target_constrs_file "Top.ucf" [current_fileset -constrset]
add_files [list {Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
