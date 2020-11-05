set projDir "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/vivado"
set projName "16bitalu1"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/au_top_0.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/alucombine_1.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/reset_conditioner_2.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/counter_3.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/sevensegment_display_4.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/add_5.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/boolean_6.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/compare_7.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/shifter_8.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/counter_9.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/seven_segment_10.v" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/verilog/decoder_11.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/constraint/alchitry.xdc" "C:/Users/ASUS/Downloads/alucode/16bitalu1/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
