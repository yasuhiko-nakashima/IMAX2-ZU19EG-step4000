onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+design_1 -L xilinx_vip -L xpm -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_8 -L zynq_ultra_ps_e_vip_v1_0_8 -L xil_defaultlib -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xlconstant_v1_1_7 -L smartconnect_v1_0 -L axi_register_slice_v2_1_22 -L blk_mem_gen_v8_4_4 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {design_1.udo}

run -all

endsim

quit -force
