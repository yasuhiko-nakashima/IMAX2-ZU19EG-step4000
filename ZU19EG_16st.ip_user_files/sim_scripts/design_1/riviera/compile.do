vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_8
vlib riviera/zynq_ultra_ps_e_vip_v1_0_8
vlib riviera/xil_defaultlib
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/xlconstant_v1_1_7
vlib riviera/smartconnect_v1_0
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/blk_mem_gen_v8_4_4

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 riviera/axi_vip_v1_1_8
vmap zynq_ultra_ps_e_vip_v1_0_8 riviera/zynq_ultra_ps_e_vip_v1_0_8
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_8  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/sim/design_1_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_1/sim/design_1_proc_sys_reset_0_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/sim/bd_afc3.v" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_0/sim/bd_afc3_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/sim/bd_afc3_psr0_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/sim/bd_afc3_psr_aclk_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/sim/bd_afc3_psr_aclk1_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_4/sim/bd_afc3_arsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_5/sim/bd_afc3_rsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_6/sim/bd_afc3_awsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_7/sim/bd_afc3_wsw_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_8/sim/bd_afc3_bsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ea34/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_9/sim/bd_afc3_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_10/sim/bd_afc3_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8047/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_11/sim/bd_afc3_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_12/sim/bd_afc3_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_13/sim/bd_afc3_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_14/sim/bd_afc3_srn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_15/sim/bd_afc3_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_16/sim/bd_afc3_swn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_17/sim/bd_afc3_sbn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_18/sim/bd_afc3_s01mmu_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_19/sim/bd_afc3_s01tr_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_20/sim/bd_afc3_s01sic_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_21/sim/bd_afc3_s01a2s_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_22/sim/bd_afc3_sarn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_23/sim/bd_afc3_srn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_24/sim/bd_afc3_sawn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_25/sim/bd_afc3_swn_1.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_26/sim/bd_afc3_sbn_1.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_27/sim/bd_afc3_m00s2a_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_28/sim/bd_afc3_m00arn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_29/sim/bd_afc3_m00rn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_30/sim/bd_afc3_m00awn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_31/sim/bd_afc3_m00wn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_32/sim/bd_afc3_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/7bd7/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_33/sim/bd_afc3_m00e_0.sv" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_0/sim/design_1_axi_smc_0.v" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram128/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/da1e/hdl" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/25b7/hdl/verilog" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/896c/hdl/verilog" "+incdir+../../../bd/design_1/ipshared/f838/src" "+incdir+../../../../ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src" "+incdir+/opt/xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram128/sim/fpga_bram128.v" \
"../../../bd/design_1/ipshared/f838/src/bit24_booth_wallace.v" \
"../../../bd/design_1/ipshared/f838/src/fsm.v" \
"../../../bd/design_1/ipshared/f838/src/lmring.v" \
"../../../bd/design_1/ipshared/f838/src/nbit_csa.v" \
"../../../bd/design_1/ipshared/f838/src/nbit_ndepth_queue.v" \
"../../../bd/design_1/ipshared/f838/src/nbit_register.v" \
"../../../bd/design_1/ipshared/f838/src/stage1.v" \
"../../../bd/design_1/ipshared/f838/src/stage2.v" \
"../../../bd/design_1/ipshared/f838/src/stage3.v" \
"../../../bd/design_1/ipshared/f838/src/stage4.v" \
"../../../bd/design_1/ipshared/f838/src/stage5.v" \
"../../../bd/design_1/ipshared/f838/src/unit.v" \
"../../../bd/design_1/ipshared/f838/src/emax6.v" \
"../../../bd/design_1/ip/design_1_emax6_0_0/sim/design_1_emax6_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

