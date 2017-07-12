set project_directory   [file dirname [info script]]
set project_name        "my project"

open_project [file join $project_directory $project_name]

# Synthesis
reset_run   synth_1
launch_runs synth_1
wait_on_run synth_1

# Implementetion
launch_runs impl_1
wait_on_run impl_1

# Report
open_run    impl_1
report_utilization -file [file join $project_directory "project.rpt" ]
report_timing      -file [file join $project_directory "project.rpt" ] -append

# Generate bitstream
launch_runs impl_1 -to_step write_bitstream -job 4
wait_on_run impl_1

# Exit
close_project
