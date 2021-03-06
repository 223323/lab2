
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name lab2 -dir "/work/HDL/synthesis/lab2/planAhead_run_1" -part xc6slx45fgg676-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/work/HDL/synthesis/lab2/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/work/HDL/synthesis/lab2} {../../source/coregen/char_rom} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
