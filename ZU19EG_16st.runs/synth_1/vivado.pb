
~
Sourcing tcl script '%s'
201*common2A
-/home/nakashim/.Xilinx/Vivado/Vivado_init.tcl2default:defaultZ17-201h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
�
 Loaded user IP repository '%s'.
1135*coregen2E
1/home/nakashim/proj-arm64/fpga/ZU19EG-step4000_IP2default:defaultZ19-1700h px� 
~
"Loaded Vivado IP repository '%s'.
1332*coregen25
!/opt/xilinx/Vivado/2020.2/data/ip2default:defaultZ19-2313h px� 
�
Command: %s
53*	vivadotcl2�
�synth_design -top design_1_wrapper -part xczu19eg-ffvb1517-2-i -directive PerformanceOptimized -fsm_extraction one_hot -keep_equivalent_registers -resource_sharing off -no_lc -shreg_min_size 52default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xczu19eg2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xczu19eg2default:defaultZ17-349h px� 
�
�The version limit for your license is '%s' and has expired for new software. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
719*common2
2022.082default:defaultZ17-1540h px� 
\
Loading part %s157*device2)
xczu19eg-ffvb1517-2-i2default:defaultZ21-403h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
211312default:defaultZ8-7075h px� 
�
%s*synth2�
�Starting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:08 . Memory (MB): peak = 5278.098 ; gain = 46.254 ; free physical = 101028 ; free virtual = 125657
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2$
design_1_wrapper2default:default2
 2default:default2z
d/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.srcs/sources_1/imports/design_1_wrapper.v2default:default2
122default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
design_12default:default2
 2default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
132default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2&
design_1_axi_smc_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/synth/design_1_axi_smc_0.v2default:default2
572default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
bd_afc32default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
102default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2&
clk_map_imp_5Y9LOC2default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14392default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_one_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_0/synth/bd_afc3_one_0.v2default:default2
572default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys20
xlconstant_v1_1_7_xlconstant2default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v2default:default2
232default:default8@Z8-6157h px� 
Q
%s
*synth29
%	Parameter CONST_VAL bound to: 1'b1 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter CONST_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys20
xlconstant_v1_1_7_xlconstant2default:default2
 2default:default2
12default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v2default:default2
232default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_one_02default:default2
 2default:default2
22default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_0/synth/bd_afc3_one_0.v2default:default2
572default:default8@Z8-6155h px� 
�
synthesizing module '%s'638*oasys2"
bd_afc3_psr0_02default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/synth/bd_afc3_psr0_0.vhd2default:default2
742default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_NUM_BUS_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_PERP_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_NUM_INTERCONNECT_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_PERP_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
12642default:default2
U02default:default2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/synth/bd_afc3_psr0_0.vhd2default:default2
1292default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
13232default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_NUM_BUS_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_PERP_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_NUM_INTERCONNECT_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_PERP_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b1 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	FDRE_inst2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
13922default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b1 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
FDRE_BSR2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14082default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

FDRE_BSR_N2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14342default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b1 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
FDRE_PER2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14572default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

FDRE_PER_N2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14812default:default8@Z8-113h px� 
�
synthesizing module '%s'638*oasys2
lpf2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
8162default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SRL162default:default2K
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
780182default:default2
	POR_SRL_I2default:default2
SRL162default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
8682default:default8@Z8-3491h px� 
�
synthesizing module '%s'%s4497*oasys2
SRL162default:default2
 2default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
780182default:default8@Z8-6157h px� 
\
%s
*synth2D
0	Parameter INIT bound to: 16'b0000000000000000 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
SRL162default:default2
 2default:default2
32default:default2
12default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
780182default:default8@Z8-6155h px� 
�
synthesizing module '%s'638*oasys2
cdc_sync2default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
1062default:default8@Z8-638h px� 
_
%s
*synth2G
3	Parameter C_CDC_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_RESET_STATE bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_SINGLE_BIT bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_FLOP_INPUT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_VECTOR_WIDTH bound to: 2 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_MTBF_STAGES bound to: 4 - type: integer 
2default:defaulth p
x
� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys24
 CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to2default:default2
FDR2default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
5142default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys29
%CROSS_PLEVEL_IN2SCNDRY_s_level_out_d22default:default2
FDR2default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
5452default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys29
%CROSS_PLEVEL_IN2SCNDRY_s_level_out_d32default:default2
FDR2default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
5542default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys29
%CROSS_PLEVEL_IN2SCNDRY_s_level_out_d42default:default2
FDR2default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
5642default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys29
%CROSS_PLEVEL_IN2SCNDRY_s_level_out_d52default:default2
FDR2default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
5742default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys29
%CROSS_PLEVEL_IN2SCNDRY_s_level_out_d62default:default2
FDR2default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
5842default:default8@Z8-113h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
cdc_sync2default:default2
42default:default2
12default:default2�
{/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd2default:default2
1062default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
lpf2default:default2
52default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
8162default:default8@Z8-256h px� 
�
synthesizing module '%s'638*oasys2 
sequence_psr2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
3012default:default8@Z8-638h px� 
�
synthesizing module '%s'638*oasys2
upcnt_n2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
1252default:default8@Z8-638h px� 
[
%s
*synth2C
/	Parameter C_SIZE bound to: 6 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
upcnt_n2default:default2
62default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
1252default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
sequence_psr2default:default2
72default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
3012default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
proc_sys_reset2default:default2
82default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
13232default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
bd_afc3_psr0_02default:default2
92default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/synth/bd_afc3_psr0_0.vhd2default:default2
742default:default8@Z8-256h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
mb_reset2default:default2"
bd_afc3_psr0_02default:default2
psr02default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14862default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
bus_struct_reset2default:default2"
bd_afc3_psr0_02default:default2
psr02default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14862default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
peripheral_reset2default:default2"
bd_afc3_psr0_02default:default2
psr02default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14862default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2&
peripheral_aresetn2default:default2"
bd_afc3_psr0_02default:default2
psr02default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14862default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
psr02default:default2"
bd_afc3_psr0_02default:default2
102default:default2
62default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14862default:default8@Z8-7023h px� 
�
synthesizing module '%s'638*oasys2&
bd_afc3_psr_aclk_02default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/synth/bd_afc3_psr_aclk_0.vhd2default:default2
742default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_NUM_BUS_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_PERP_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_NUM_INTERCONNECT_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_PERP_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
12642default:default2
U02default:default2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/synth/bd_afc3_psr_aclk_0.vhd2default:default2
1292default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2&
bd_afc3_psr_aclk_02default:default2
102default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/synth/bd_afc3_psr_aclk_0.vhd2default:default2
742default:default8@Z8-256h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
mb_reset2default:default2&
bd_afc3_psr_aclk_02default:default2
psr_aclk2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
bus_struct_reset2default:default2&
bd_afc3_psr_aclk_02default:default2
psr_aclk2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
peripheral_reset2default:default2&
bd_afc3_psr_aclk_02default:default2
psr_aclk2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2&
peripheral_aresetn2default:default2&
bd_afc3_psr_aclk_02default:default2
psr_aclk2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14932default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
psr_aclk2default:default2&
bd_afc3_psr_aclk_02default:default2
102default:default2
62default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14932default:default8@Z8-7023h px� 
�
synthesizing module '%s'638*oasys2'
bd_afc3_psr_aclk1_02default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/synth/bd_afc3_psr_aclk1_0.vhd2default:default2
742default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_NUM_BUS_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_PERP_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_NUM_INTERCONNECT_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_PERP_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
12642default:default2
U02default:default2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/synth/bd_afc3_psr_aclk1_0.vhd2default:default2
1292default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2'
bd_afc3_psr_aclk1_02default:default2
112default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/synth/bd_afc3_psr_aclk1_0.vhd2default:default2
742default:default8@Z8-256h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
mb_reset2default:default2'
bd_afc3_psr_aclk1_02default:default2
	psr_aclk12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
15002default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
bus_struct_reset2default:default2'
bd_afc3_psr_aclk1_02default:default2
	psr_aclk12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
15002default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
peripheral_reset2default:default2'
bd_afc3_psr_aclk1_02default:default2
	psr_aclk12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
15002default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2&
peripheral_aresetn2default:default2'
bd_afc3_psr_aclk1_02default:default2
	psr_aclk12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
15002default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
	psr_aclk12default:default2'
bd_afc3_psr_aclk1_02default:default2
102default:default2
62default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
15002default:default8@Z8-7023h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2&
clk_map_imp_5Y9LOC2default:default2
 2default:default2
122default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
14392default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys21
m00_exit_pipeline_imp_1TZX5BB2default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
15092default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2"
bd_afc3_m00e_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_33/synth/bd_afc3_m00e_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2%
xpm_cdc_async_rst2default:default2
 2default:default2R
</opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv2default:default2
11752default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
xpm_cdc_async_rst2default:default2
 2default:default2
132default:default2
12default:default2R
</opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv2default:default2
11752default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
bd_afc3_m00e_02default:default2
 2default:default2
222default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_33/synth/bd_afc3_m00e_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
m00_exit_pipeline_imp_1TZX5BB2default:default2
 2default:default2
232default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
15092default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2)
m00_nodes_imp_1GOYQYZ2default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
18902default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_m00arn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_28/synth/bd_afc3_m00arn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2%
xpm_memory_sdpram2default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2#
xpm_memory_base2default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 5792 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 181 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 181 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 181 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 181 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 181 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 181 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 181 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 181 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 181 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 181 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 181 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 181 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 184 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 184 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 181 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
xpm_memory_base2default:default2
 2default:default2
312default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
xpm_memory_sdpram2default:default2
 2default:default2
322default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
xpm_cdc_gray2default:default2
 2default:default2R
</opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv2default:default2
2842default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
xpm_cdc_gray2default:default2
 2default:default2
332default:default2
12default:default2R
</opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv2default:default2
2842default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_m00arn_02default:default2
 2default:default2
412default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_28/synth/bd_afc3_m00arn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_m00awn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_30/synth/bd_afc3_m00awn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_m00awn_02default:default2
 2default:default2
422default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_30/synth/bd_afc3_m00awn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
bd_afc3_m00bn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_32/synth/bd_afc3_m00bn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized02default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized02default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter MEMORY_SIZE bound to: 608 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter WRITE_DATA_WIDTH_A bound to: 19 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter READ_DATA_WIDTH_A bound to: 19 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter BYTE_WRITE_WIDTH_A bound to: 19 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter WRITE_DATA_WIDTH_B bound to: 19 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter READ_DATA_WIDTH_B bound to: 19 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter BYTE_WRITE_WIDTH_B bound to: 19 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_MIN_WIDTH_DATA_A bound to: 19 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_MIN_WIDTH_DATA_B bound to: 19 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MIN_WIDTH_DATA bound to: 19 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_MIN_WIDTH_DATA_ECC bound to: 19 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_COL_WRITE_A bound to: 19 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_COL_WRITE_B bound to: 19 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter rsta_loop_iter bound to: 20 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter rstb_loop_iter bound to: 20 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 19 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized02default:default2
 2default:default2
422default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized02default:default2
 2default:default2
422default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized12default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized12default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter MEMORY_SIZE bound to: 224 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter WRITE_DATA_WIDTH_A bound to: 7 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_DATA_WIDTH_A bound to: 7 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter BYTE_WRITE_WIDTH_A bound to: 7 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter WRITE_DATA_WIDTH_B bound to: 7 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_DATA_WIDTH_B bound to: 7 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter BYTE_WRITE_WIDTH_B bound to: 7 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA_A bound to: 7 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA_B bound to: 7 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter P_MIN_WIDTH_DATA bound to: 7 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_ECC bound to: 7 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_COL_WRITE_A bound to: 7 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_COL_WRITE_B bound to: 7 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter rsta_loop_iter bound to: 8 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter rstb_loop_iter bound to: 8 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 7 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized12default:default2
 2default:default2
422default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized12default:default2
 2default:default2
422default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
bd_afc3_m00bn_02default:default2
 2default:default2
432default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_32/synth/bd_afc3_m00bn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
bd_afc3_m00rn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_29/synth/bd_afc3_m00rn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized22default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized22default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 4448 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 139 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 139 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 139 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 139 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 139 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 139 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 139 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 139 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 139 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 139 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 139 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 139 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 140 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 140 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 139 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized22default:default2
 2default:default2
432default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized22default:default2
 2default:default2
432default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized32default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized32default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 4416 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 138 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 138 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 138 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 138 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 138 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 138 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 138 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 138 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 138 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 138 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 138 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 138 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 140 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 140 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 138 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized32default:default2
 2default:default2
432default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized32default:default2
 2default:default2
432default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
bd_afc3_m00rn_02default:default2
 2default:default2
442default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_29/synth/bd_afc3_m00rn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
bd_afc3_m00wn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_31/synth/bd_afc3_m00wn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized42default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized42default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter MEMORY_SIZE bound to: 4 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter WRITE_DATA_WIDTH_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_DATA_WIDTH_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter BYTE_WRITE_WIDTH_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter WRITE_DATA_WIDTH_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_DATA_WIDTH_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter BYTE_WRITE_WIDTH_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 2 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter P_MIN_WIDTH_DATA bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_ECC bound to: 1 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter P_MAX_DEPTH_DATA bound to: 4 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_COL_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_COL_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 2 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 2 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter rsta_loop_iter bound to: 4 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter rstb_loop_iter bound to: 4 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized42default:default2
 2default:default2
442default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized42default:default2
 2default:default2
442default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized52default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized52default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 5152 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 1 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 161 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 161 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 161 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 161 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 161 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 161 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 161 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 161 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 161 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 161 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 161 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 161 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 164 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 164 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 161 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized52default:default2
 2default:default2
442default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized52default:default2
 2default:default2
442default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
bd_afc3_m00wn_02default:default2
 2default:default2
452default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_31/synth/bd_afc3_m00wn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2)
m00_nodes_imp_1GOYQYZ2default:default2
 2default:default2
462default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
18902default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_m00s2a_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_27/synth/bd_afc3_m00s2a_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_m00s2a_02default:default2
 2default:default2
482default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_27/synth/bd_afc3_m00s2a_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_s00a2s_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_12/synth/bd_afc3_s00a2s_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_s00a2s_02default:default2
 2default:default2
502default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_12/synth/bd_afc3_s00a2s_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys21
s00_entry_pipeline_imp_USCCV82default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
21952default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_s00mmu_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_9/synth/bd_afc3_s00mmu_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_s00mmu_02default:default2
 2default:default2
542default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_9/synth/bd_afc3_s00mmu_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_s00sic_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_11/synth/bd_afc3_s00sic_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_s00sic_02default:default2
 2default:default2
592default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_11/synth/bd_afc3_s00sic_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
bd_afc3_s00tr_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_10/synth/bd_afc3_s00tr_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
bd_afc3_s00tr_02default:default2
 2default:default2
622default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_10/synth/bd_afc3_s00tr_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
s00_entry_pipeline_imp_USCCV82default:default2
 2default:default2
632default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
21952default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2(
s00_nodes_imp_Y7M43I2default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
28542default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2"
bd_afc3_sarn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_13/synth/bd_afc3_sarn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized62default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized62default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter MEMORY_SIZE bound to: 576 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter WRITE_DATA_WIDTH_A bound to: 18 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter READ_DATA_WIDTH_A bound to: 18 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter BYTE_WRITE_WIDTH_A bound to: 18 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter WRITE_DATA_WIDTH_B bound to: 18 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter READ_DATA_WIDTH_B bound to: 18 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter BYTE_WRITE_WIDTH_B bound to: 18 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_MIN_WIDTH_DATA_A bound to: 18 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_MIN_WIDTH_DATA_B bound to: 18 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MIN_WIDTH_DATA bound to: 18 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_MIN_WIDTH_DATA_ECC bound to: 18 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_COL_WRITE_A bound to: 18 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_COL_WRITE_B bound to: 18 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter rsta_loop_iter bound to: 20 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter rstb_loop_iter bound to: 20 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 18 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized62default:default2
 2default:default2
632default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized62default:default2
 2default:default2
632default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized72default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized72default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 5216 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 163 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 163 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 163 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 163 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 163 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 163 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 163 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 163 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 163 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 163 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 163 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 163 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 164 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 164 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 163 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized72default:default2
 2default:default2
632default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized72default:default2
 2default:default2
632default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
bd_afc3_sarn_02default:default2
 2default:default2
642default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_13/synth/bd_afc3_sarn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
bd_afc3_sawn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_15/synth/bd_afc3_sawn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
bd_afc3_sawn_02default:default2
 2default:default2
652default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_15/synth/bd_afc3_sawn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_sbn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_17/synth/bd_afc3_sbn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized82default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized82default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MEMORY_SIZE bound to: 32 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter WRITE_DATA_WIDTH_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_DATA_WIDTH_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter BYTE_WRITE_WIDTH_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter WRITE_DATA_WIDTH_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_DATA_WIDTH_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter BYTE_WRITE_WIDTH_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter P_MIN_WIDTH_DATA bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_ECC bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_COL_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_COL_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter rsta_loop_iter bound to: 4 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter rstb_loop_iter bound to: 4 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized82default:default2
 2default:default2
652default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized82default:default2
 2default:default2
652default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys25
!xpm_memory_sdpram__parameterized92default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys23
xpm_memory_base__parameterized92default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter MEMORY_SIZE bound to: 800 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter WRITE_DATA_WIDTH_A bound to: 25 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter READ_DATA_WIDTH_A bound to: 25 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter BYTE_WRITE_WIDTH_A bound to: 25 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter WRITE_DATA_WIDTH_B bound to: 25 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter READ_DATA_WIDTH_B bound to: 25 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter BYTE_WRITE_WIDTH_B bound to: 25 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_MIN_WIDTH_DATA_A bound to: 25 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_MIN_WIDTH_DATA_B bound to: 25 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MIN_WIDTH_DATA bound to: 25 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_MIN_WIDTH_DATA_ECC bound to: 25 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_COL_WRITE_A bound to: 25 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_COL_WRITE_B bound to: 25 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter rsta_loop_iter bound to: 28 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter rstb_loop_iter bound to: 28 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 25 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys23
xpm_memory_base__parameterized92default:default2
 2default:default2
652default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys25
!xpm_memory_sdpram__parameterized92default:default2
 2default:default2
652default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_sbn_02default:default2
 2default:default2
662default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_17/synth/bd_afc3_sbn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_srn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_14/synth/bd_afc3_srn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys26
"xpm_memory_sdpram__parameterized102default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys24
 xpm_memory_base__parameterized102default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 4736 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 148 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 148 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 148 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 148 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 148 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 148 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 148 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 148 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 148 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 148 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 148 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 148 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 148 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 148 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 148 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 xpm_memory_base__parameterized102default:default2
 2default:default2
672default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys26
"xpm_memory_sdpram__parameterized102default:default2
 2default:default2
672default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys26
"xpm_memory_sdpram__parameterized112default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys24
 xpm_memory_base__parameterized112default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 4704 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 147 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 147 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 147 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 147 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 147 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 147 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 147 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 147 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 147 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 147 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 147 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 147 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 148 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 148 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 147 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 xpm_memory_base__parameterized112default:default2
 2default:default2
672default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys26
"xpm_memory_sdpram__parameterized112default:default2
 2default:default2
672default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_srn_02default:default2
 2default:default2
682default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_14/synth/bd_afc3_srn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_swn_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_16/synth/bd_afc3_swn_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys26
"xpm_memory_sdpram__parameterized122default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys24
 xpm_memory_base__parameterized122default:default2
 2default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter MEMORY_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter MEMORY_SIZE bound to: 4864 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter MEMORY_PRIMITIVE bound to: 1 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter CLOCKING_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter ECC_MODE bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter MEMORY_INIT_FILE bound to: none - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_INIT_PARAM bound to: (null) - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter USE_MEM_INIT_MMI bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter USE_MEM_INIT bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter MEMORY_OPTIMIZATION bound to: true - type: string 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter WAKEUP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter AUTO_SLEEP_TIME bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter MESSAGE_CONTROL bound to: 0 - type: integer 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter VERSION bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter USE_EMBEDDED_CONSTRAINT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CASCADE_HEIGHT bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter SIM_ASSERT_CHK bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter WRITE_PROTECT bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_A bound to: 152 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_A bound to: 152 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_A bound to: 152 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_A bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_A bound to: 2 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_A bound to: SYNC - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter WRITE_DATA_WIDTH_B bound to: 152 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter READ_DATA_WIDTH_B bound to: 152 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter BYTE_WRITE_WIDTH_B bound to: 152 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter ADDR_WIDTH_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter READ_RESET_VALUE_B bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter WRITE_MODE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter RST_MODE_B bound to: SYNC - type: string 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter P_MEMORY_PRIMITIVE bound to: distributed - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_A bound to: 152 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_B bound to: 152 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_MIN_WIDTH_DATA bound to: 152 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter P_MIN_WIDTH_DATA_ECC bound to: 152 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_MAX_DEPTH_DATA bound to: 32 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter P_ECC_MODE bound to: no_ecc - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter P_MEMORY_OPT bound to: yes - type: string 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_A bound to: 152 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_WIDTH_COL_WRITE_B bound to: 152 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_COLS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter P_NUM_ROWS_WRITE_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_NUM_ROWS_READ_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_WIDTH_ADDR_WRITE_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_A bound to: 5 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter P_WIDTH_ADDR_READ_B bound to: 5 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter P_WIDTH_ADDR_LSB_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_WIDTH_ADDR_LSB_READ_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter P_ENABLE_BYTE_WRITE_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter P_SDP_WRITE_MODE bound to: yes - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rsta_loop_iter bound to: 152 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter rstb_loop_iter bound to: 152 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter NUM_CHAR_LOC bound to: 0 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter MAX_NUM_CHAR bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter P_MIN_WIDTH_DATA_SHFT bound to: 152 - type: integer 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter P_MIN_WIDTH_DATA_LDW bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys24
 xpm_memory_base__parameterized122default:default2
 2default:default2
692default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys26
"xpm_memory_sdpram__parameterized122default:default2
 2default:default2
692default:default2
12default:default2X
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv2default:default2
84042default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_swn_02default:default2
 2default:default2
702default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_16/synth/bd_afc3_swn_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2(
s00_nodes_imp_Y7M43I2default:default2
 2default:default2
712default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
28542default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_s01a2s_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_21/synth/bd_afc3_s01a2s_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_s01a2s_02default:default2
 2default:default2
722default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_21/synth/bd_afc3_s01a2s_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys22
s01_entry_pipeline_imp_1W4H5O02default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
31502default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_s01mmu_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_18/synth/bd_afc3_s01mmu_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_s01mmu_02default:default2
 2default:default2
732default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_18/synth/bd_afc3_s01mmu_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
bd_afc3_s01sic_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_20/synth/bd_afc3_s01sic_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
bd_afc3_s01sic_02default:default2
 2default:default2
742default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_20/synth/bd_afc3_s01sic_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2#
bd_afc3_s01tr_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_19/synth/bd_afc3_s01tr_0.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
bd_afc3_s01tr_02default:default2
 2default:default2
752default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_19/synth/bd_afc3_s01tr_0.sv2default:default2
582default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys22
s01_entry_pipeline_imp_1W4H5O02default:default2
 2default:default2
762default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
31502default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2)
s01_nodes_imp_1RW0SI02default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
38092default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2"
bd_afc3_sarn_12default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_22/synth/bd_afc3_sarn_1.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
bd_afc3_sarn_12default:default2
 2default:default2
772default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_22/synth/bd_afc3_sarn_1.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
bd_afc3_sawn_12default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_24/synth/bd_afc3_sawn_1.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
bd_afc3_sawn_12default:default2
 2default:default2
782default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_24/synth/bd_afc3_sawn_1.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_sbn_12default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_26/synth/bd_afc3_sbn_1.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_sbn_12default:default2
 2default:default2
792default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_26/synth/bd_afc3_sbn_1.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_srn_12default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_23/synth/bd_afc3_srn_1.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_srn_12default:default2
 2default:default2
802default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_23/synth/bd_afc3_srn_1.sv2default:default2
582default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_swn_12default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_25/synth/bd_afc3_swn_1.sv2default:default2
582default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_swn_12default:default2
 2default:default2
812default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_25/synth/bd_afc3_swn_1.sv2default:default2
582default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2)
s01_nodes_imp_1RW0SI02default:default2
 2default:default2
822default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
38092default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2+
switchboards_imp_4N4PBE2default:default2
 2default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
41052default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2"
bd_afc3_arsw_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_4/synth/bd_afc3_arsw_0.sv2default:default2
572default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
bd_afc3_arsw_02default:default2
 2default:default2
852default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_4/synth/bd_afc3_arsw_0.sv2default:default2
572default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
bd_afc3_awsw_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_6/synth/bd_afc3_awsw_0.sv2default:default2
572default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
bd_afc3_awsw_02default:default2
 2default:default2
862default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_6/synth/bd_afc3_awsw_0.sv2default:default2
572default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_bsw_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_8/synth/bd_afc3_bsw_0.sv2default:default2
572default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_bsw_02default:default2
 2default:default2
872default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_8/synth/bd_afc3_bsw_0.sv2default:default2
572default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_rsw_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_5/synth/bd_afc3_rsw_0.sv2default:default2
572default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_rsw_02default:default2
 2default:default2
882default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_5/synth/bd_afc3_rsw_0.sv2default:default2
572default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
bd_afc3_wsw_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_7/synth/bd_afc3_wsw_0.sv2default:default2
572default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
bd_afc3_wsw_02default:default2
 2default:default2
892default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_7/synth/bd_afc3_wsw_0.sv2default:default2
572default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2+
switchboards_imp_4N4PBE2default:default2
 2default:default2
902default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
41052default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
bd_afc32default:default2
 2default:default2
912default:default2
12default:default2�
/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/synth/bd_afc3.v2default:default2
102default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2&
design_1_axi_smc_02default:default2
 2default:default2
922default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/synth/design_1_axi_smc_0.v2default:default2
572default:default8@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
M00_AXI_awlock2default:default2&
design_1_axi_smc_02default:default2
axi_smc2default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
1302default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2!
M00_AXI_awqos2default:default2&
design_1_axi_smc_02default:default2
axi_smc2default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
1302default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
M00_AXI_awuser2default:default2&
design_1_axi_smc_02default:default2
axi_smc2default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
1302default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
M00_AXI_arlock2default:default2&
design_1_axi_smc_02default:default2
axi_smc2default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
1302default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2!
M00_AXI_arqos2default:default2&
design_1_axi_smc_02default:default2
axi_smc2default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
1302default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2"
M00_AXI_aruser2default:default2&
design_1_axi_smc_02default:default2
axi_smc2default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
1302default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
axi_smc2default:default2&
design_1_axi_smc_02default:default2
1162default:default2
1102default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
1302default:default8@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2(
design_1_clk_wiz_0_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v2default:default2
712default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys20
design_1_clk_wiz_0_0_clk_wiz2default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v2default:default2
692default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
IBUF2default:default2
 2default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
329832default:default8@Z8-6157h px� 
g
%s
*synth2O
;	Parameter CAPACITANCE bound to: DONT_CARE - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter IBUF_DELAY_VALUE bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter IBUF_LOW_PWR bound to: TRUE - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter IFD_DELAY_VALUE bound to: AUTO - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter IOSTANDARD bound to: DEFAULT - type: string 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IBUF2default:default2
 2default:default2
932default:default2
12default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
329832default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

MMCME4_ADV2default:default2
 2default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
403912default:default8@Z8-6157h px� 
e
%s
*synth2M
9	Parameter BANDWIDTH bound to: OPTIMIZED - type: string 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKFBOUT_MULT_F bound to: 24.000000 - type: double 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter CLKFBOUT_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter CLKFBOUT_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
i
%s
*synth2Q
=	Parameter CLKIN1_PERIOD bound to: 20.000000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKIN2_PERIOD bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT0_DIVIDE_F bound to: 4.000000 - type: double 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter CLKOUT0_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKOUT0_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT0_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CLKOUT1_DIVIDE bound to: 6 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter CLKOUT1_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKOUT1_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT1_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CLKOUT2_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter CLKOUT2_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKOUT2_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT2_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CLKOUT3_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter CLKOUT3_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKOUT3_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT3_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter CLKOUT4_CASCADE bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CLKOUT4_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter CLKOUT4_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKOUT4_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT4_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CLKOUT5_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter CLKOUT5_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKOUT5_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT5_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter CLKOUT6_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter CLKOUT6_DUTY_CYCLE bound to: 0.500000 - type: double 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter CLKOUT6_PHASE bound to: 0.000000 - type: double 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter CLKOUT6_USE_FINE_PS bound to: FALSE - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter COMPENSATION bound to: AUTO - type: string 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter DIVCLK_DIVIDE bound to: 1 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter IS_CLKFBIN_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter IS_CLKIN1_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter IS_CLKIN2_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter IS_CLKINSEL_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter IS_PSEN_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
\
%s
*synth2D
0	Parameter IS_PSINCDEC_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	Parameter IS_PWRDWN_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
W
%s
*synth2?
+	Parameter IS_RST_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter REF_JITTER1 bound to: 0.010000 - type: double 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter REF_JITTER2 bound to: 0.010000 - type: double 
2default:defaulth p
x
� 
]
%s
*synth2E
1	Parameter SS_EN bound to: FALSE - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter SS_MODE bound to: CENTER_HIGH - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter SS_MOD_PERIOD bound to: 10000 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter STARTUP_WAIT bound to: FALSE - type: string 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

MMCME4_ADV2default:default2
 2default:default2
942default:default2
12default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
403912default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
BUFG2default:default2
 2default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
10832default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
BUFG2default:default2
 2default:default2
952default:default2
12default:default2M
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
10832default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys20
design_1_clk_wiz_0_0_clk_wiz2default:default2
 2default:default2
962default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v2default:default2
692default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2(
design_1_clk_wiz_0_02default:default2
 2default:default2
972default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v2default:default2
712default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2&
design_1_emax6_0_02default:default2
 2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/synth/design_1_emax6_0_0.v2default:default2
572default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
emax62default:default2
 2default:default2�
n/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/emax6.v2default:default2
322default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2%
nbit_ndepth_queue2default:default2
 2default:default2�
z/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_ndepth_queue.v2default:default2
82default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter REG_WIDTH bound to: 342 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter QUEUE_DEPTH bound to: 2 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter QPTR_BITS bound to: 1 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter QNUM_BITS bound to: 2 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
nbit_ndepth_queue2default:default2
 2default:default2
982default:default2
12default:default2�
z/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_ndepth_queue.v2default:default2
82default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
unit2default:default2
 2default:default2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
302default:default8@Z8-6157h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 0 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'%s4497*oasys2
stage12default:default2
 2default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage1.v2default:default2
262default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stage12default:default2
 2default:default2
992default:default2
12default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage1.v2default:default2
262default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
stage22default:default2
 2default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
292default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
cex2default:default2
 2default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
11802default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
cex2default:default2
 2default:default2
1002default:default2
12default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
11802default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mex2default:default2
 2default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
11932default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mex2default:default2
 2default:default2
1012default:default2
12default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
11932default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
eam2default:default2
 2default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
13322default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
eam2default:default2
 2default:default2
1022default:default2
12default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
13322default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
exe12default:default2
 2default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
4342default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2!
nbit_register2default:default2
 2default:default2�
v/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_register.v2default:default2
252default:default8@Z8-6157h px� 
_
%s
*synth2G
3	Parameter REG_WIDTH bound to: 32 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
nbit_register2default:default2
 2default:default2
1032default:default2
12default:default2�
v/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_register.v2default:default2
252default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
exe12default:default2
 2default:default2
1042default:default2
12default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
4342default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
fpu12default:default2
 2default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
7862default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2'
bit24_booth_wallace2default:default2
 2default:default2�
|/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/bit24_booth_wallace.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
nbit_csa2default:default2
 2default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 31 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
nbit_csa2default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2,
nbit_csa__parameterized02default:default2
 2default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 33 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
nbit_csa__parameterized02default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2,
nbit_csa__parameterized12default:default2
 2default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 32 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
nbit_csa__parameterized12default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2,
nbit_csa__parameterized22default:default2
 2default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 36 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
nbit_csa__parameterized22default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2,
nbit_csa__parameterized32default:default2
 2default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 39 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
nbit_csa__parameterized32default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2,
nbit_csa__parameterized42default:default2
 2default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6157h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 42 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
nbit_csa__parameterized42default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2,
nbit_csa__parameterized52default:default2
 2default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6157h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-61572default:default2
1002default:defaultZ17-14h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 45 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
nbit_csa__parameterized52default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 44 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2,
nbit_csa__parameterized62default:default2
 2default:default2
1052default:default2
12default:default2�
q/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_csa.v2default:default2
252default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
bit24_booth_wallace2default:default2
 2default:default2
1062default:default2
12default:default2�
|/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/bit24_booth_wallace.v2default:default2
232default:default8@Z8-6155h px� 
^
%s
*synth2F
2	Parameter REG_WIDTH bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
nbit_register__parameterized02default:default2
 2default:default2
1062default:default2
12default:default2�
v/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_register.v2default:default2
252default:default8@Z8-6155h px� 
^
%s
*synth2F
2	Parameter REG_WIDTH bound to: 9 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
nbit_register__parameterized12default:default2
 2default:default2
1062default:default2
12default:default2�
v/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_register.v2default:default2
252default:default8@Z8-6155h px� 
_
%s
*synth2G
3	Parameter REG_WIDTH bound to: 26 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
nbit_register__parameterized22default:default2
 2default:default2
1062default:default2
12default:default2�
v/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_register.v2default:default2
252default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
fpu12default:default2
 2default:default2
1072default:default2
12default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
7862default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

popcount122default:default2
 2default:default2
1082default:default2
12default:default2�
o/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/stage2.v2default:default2
10942default:default8@Z8-6155h px� 
^
%s
*synth2F
2	Parameter REG_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys21
nbit_register__parameterized32default:default2
 2default:default2
1082default:default2
12default:default2�
v/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/nbit_register.v2default:default2
252default:default8@Z8-6155h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-61552default:default2
1002default:defaultZ17-14h px� 
^
%s
*synth2F
2	Parameter OP_WIDTH bound to: 27 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter REG_WIDTH bound to: 27 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'638*oasys2 
fpga_bram1282default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram128/synth/fpga_bram128.vhd2default:default2
762default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_XDEVICEFAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_ELABORATION_DIR bound to: ./ - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_INTERFACE_TYPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_AXI_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_AXI_SLAVE_TYPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_USE_BRAM_BLOCK bound to: 0 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_ENABLE_32BIT_ADDRESS bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_CTRL_ECC_ALGO bound to: NONE - type: string 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_HAS_AXI_ID bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_AXI_ID_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_MEM_TYPE bound to: 2 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter C_BYTE_SIZE bound to: 8 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter C_ALGORITHM bound to: 1 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter C_PRIM_TYPE bound to: 1 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_LOAD_INIT_FILE bound to: 0 - type: integer 
2default:defaulth p
x
� 
u
%s
*synth2]
I	Parameter C_INIT_FILE_NAME bound to: no_coe_file_loaded - type: string 
2default:defaulth p
x
� 
n
%s
*synth2V
B	Parameter C_INIT_FILE bound to: fpga_bram128.mem - type: string 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_USE_DEFAULT_DATA bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_DEFAULT_DATA bound to: 0 - type: string 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_HAS_RSTA bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_RST_PRIORITY_A bound to: CE - type: string 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_RSTRAM_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_INITA_VAL bound to: 0 - type: string 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter C_HAS_ENA bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_HAS_REGCEA bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_USE_BYTE_WEA bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_WEA_WIDTH bound to: 32 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_WRITE_MODE_A bound to: WRITE_FIRST - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_WRITE_WIDTH_A bound to: 256 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_READ_WIDTH_A bound to: 256 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_WRITE_DEPTH_A bound to: 4096 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_READ_DEPTH_A bound to: 4096 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_ADDRA_WIDTH bound to: 12 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_HAS_RSTB bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_RST_PRIORITY_B bound to: CE - type: string 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_RSTRAM_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_INITB_VAL bound to: 0 - type: string 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter C_HAS_ENB bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_HAS_REGCEB bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_USE_BYTE_WEB bound to: 1 - type: integer 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_WEB_WIDTH bound to: 32 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_WRITE_MODE_B bound to: WRITE_FIRST - type: string 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_WRITE_WIDTH_B bound to: 256 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_READ_WIDTH_B bound to: 256 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_WRITE_DEPTH_B bound to: 4096 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_READ_DEPTH_B bound to: 4096 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_ADDRB_WIDTH bound to: 12 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_HAS_MEM_OUTPUT_REGS_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_HAS_MEM_OUTPUT_REGS_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_HAS_MUX_OUTPUT_REGS_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_HAS_MUX_OUTPUT_REGS_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_MUX_PIPELINE_STAGES bound to: 0 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_HAS_SOFTECC_INPUT_REGS_A bound to: 0 - type: integer 
2default:defaulth p
x
� 
p
%s
*synth2X
D	Parameter C_HAS_SOFTECC_OUTPUT_REGS_B bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_USE_SOFTECC bound to: 0 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter C_USE_ECC bound to: 0 - type: integer 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_EN_ECC_PIPE bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_READ_LATENCY_A bound to: 1 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_READ_LATENCY_B bound to: 1 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_HAS_INJECTERR bound to: 0 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SIM_COLLISION_CHECK bound to: ALL - type: string 
2default:defaulth p
x
� 
a
%s
*synth2I
5	Parameter C_COMMON_CLK bound to: 1 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_DISABLE_WARN_BHV_COLL bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_EN_SLEEP_PIN bound to: 0 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter C_USE_URAM bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_EN_RDADDRA_CHG bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_EN_RDADDRB_CHG bound to: 0 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_EN_DEEPSLEEP_PIN bound to: 0 - type: integer 
2default:defaulth p
x
� 
f
%s
*synth2N
:	Parameter C_EN_SHUTDOWN_PIN bound to: 0 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EN_SAFETY_CKT bound to: 0 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter C_DISABLE_WARN_BHV_RANGE bound to: 0 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_COUNT_36K_BRAM bound to: 32 - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_COUNT_18K_BRAM bound to: 0 - type: string 
2default:defaulth p
x
� 
�
%s
*synth2{
g	Parameter C_EST_POWER_SUMMARY bound to: Estimated Power for IP     :     116.13544 mW - type: string 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2&
blk_mem_gen_v8_4_42default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram128/hdl/blk_mem_gen_v8_4_vhsyn_rfs.vhd2default:default2
1953212default:default2
U02default:default2&
blk_mem_gen_v8_4_42default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram128/synth/fpga_bram128.vhd2default:default2
2492default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
fpga_bram1282default:default2
1292default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_emax6_0_0/src/fpga_bram128/synth/fpga_bram128.vhd2default:default2
762default:default8@Z8-256h px� 
`
%s
*synth2H
4	Parameter REG_WIDTH bound to: 342 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter QUEUE_DEPTH bound to: 3 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter QPTR_BITS bound to: 2 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter QNUM_BITS bound to: 2 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 2 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 3 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 5 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 6 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 7 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 8 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
\
%s
*synth2D
0	Parameter UNIT_NO bound to: 9 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
]
%s
*synth2E
1	Parameter UNIT_NO bound to: 10 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
]
%s
*synth2E
1	Parameter UNIT_NO bound to: 11 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
]
%s
*synth2E
1	Parameter UNIT_NO bound to: 12 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
]
%s
*synth2E
1	Parameter UNIT_NO bound to: 13 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
]
%s
*synth2E
1	Parameter UNIT_NO bound to: 14 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
]
%s
*synth2E
1	Parameter UNIT_NO bound to: 15 - type: integer 
2default:defaulth p
x
� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
12022default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
m/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/unit.v2default:default2
11992default:default8@Z8-155h px� 
�
-case statement is not full and has no default155*oasys2�
l/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/f838/src/fsm.v2default:default2
9202default:default8@Z8-155h px� 
`
%s
*synth2H
4	Parameter REG_WIDTH bound to: 256 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter QUEUE_DEPTH bound to: 3 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter QPTR_BITS bound to: 2 - type: integer 
2default:defaulth p
x
� 
^
%s
*synth2F
2	Parameter QNUM_BITS bound to: 2 - type: integer 
2default:defaulth p
x
� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
	axi_s_rid2default:default2&
design_1_emax6_0_02default:default2
emax6_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2452default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
	axi_s_bid2default:default2&
design_1_emax6_0_02default:default2
emax6_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2452default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
emax6_02default:default2&
design_1_emax6_0_02default:default2
352default:default2
332default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2452default:default8@Z8-7023h px� 
�
synthesizing module '%s'638*oasys2/
design_1_proc_sys_reset_0_02default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/synth/design_1_proc_sys_reset_0_0.vhd2default:default2
742default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_NUM_BUS_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_PERP_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_NUM_INTERCONNECT_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_PERP_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
12642default:default2
U02default:default2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/synth/design_1_proc_sys_reset_0_0.vhd2default:default2
1292default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys22
proc_sys_reset__parameterized22default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
13232default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_NUM_BUS_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_PERP_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_NUM_INTERCONNECT_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_PERP_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b1 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
	FDRE_inst2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
13922default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b1 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
FDRE_BSR2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14082default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

FDRE_BSR_N2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14342default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b1 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
FDRE_PER2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14572default:default8@Z8-113h px� 
L
%s
*synth24
 	Parameter INIT bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_C_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_D_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
U
%s
*synth2=
)	Parameter IS_R_INVERTED bound to: 1'b0 
2default:defaulth p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2

FDRE_PER_N2default:default2
FDRE2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
14812default:default8@Z8-113h px� 
�
synthesizing module '%s'638*oasys2'
lpf__parameterized02default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
8162default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SRL162default:default2K
7/opt/xilinx/Vivado/2020.2/scripts/rt/data/unisim_comp.v2default:default2
780182default:default2
	POR_SRL_I2default:default2
SRL162default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
8682default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2'
lpf__parameterized02default:default2
1372default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
8162default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys22
proc_sys_reset__parameterized22default:default2
1372default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
13232default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2/
design_1_proc_sys_reset_0_02default:default2
1382default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/synth/design_1_proc_sys_reset_0_0.vhd2default:default2
742default:default8@Z8-256h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
mb_reset2default:default2/
design_1_proc_sys_reset_0_02default:default2$
proc_sys_reset_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2792default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
bus_struct_reset2default:default2/
design_1_proc_sys_reset_0_02default:default2$
proc_sys_reset_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2792default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
peripheral_reset2default:default2/
design_1_proc_sys_reset_0_02default:default2$
proc_sys_reset_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2792default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2(
interconnect_aresetn2default:default2/
design_1_proc_sys_reset_0_02default:default2$
proc_sys_reset_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2792default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2$
proc_sys_reset_02default:default2/
design_1_proc_sys_reset_0_02default:default2
102default:default2
62default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2792default:default8@Z8-7023h px� 
�
synthesizing module '%s'638*oasys2/
design_1_proc_sys_reset_0_12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_1/synth/design_1_proc_sys_reset_0_1.vhd2default:default2
742default:default8@Z8-638h px� 
d
%s
*synth2L
8	Parameter C_FAMILY bound to: zynquplus - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EXT_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_AUX_RST_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_EXT_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
X
%s
*synth2@
,	Parameter C_AUX_RESET_HIGH bound to: 1'b0 
2default:defaulth p
x
� 
b
%s
*synth2J
6	Parameter C_NUM_BUS_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_NUM_PERP_RST bound to: 1 - type: integer 
2default:defaulth p
x
� 
o
%s
*synth2W
C	Parameter C_NUM_INTERCONNECT_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_NUM_PERP_ARESETN bound to: 1 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd2default:default2
12642default:default2
U02default:default2"
proc_sys_reset2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_1/synth/design_1_proc_sys_reset_0_1.vhd2default:default2
1292default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2/
design_1_proc_sys_reset_0_12default:default2
1392default:default2
12default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_1/synth/design_1_proc_sys_reset_0_1.vhd2default:default2
742default:default8@Z8-256h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
mb_reset2default:default2/
design_1_proc_sys_reset_0_12default:default2$
proc_sys_reset_12default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2862default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
bus_struct_reset2default:default2/
design_1_proc_sys_reset_0_12default:default2$
proc_sys_reset_12default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2862default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2$
peripheral_reset2default:default2/
design_1_proc_sys_reset_0_12default:default2$
proc_sys_reset_12default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2862default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2&
peripheral_aresetn2default:default2/
design_1_proc_sys_reset_0_12default:default2$
proc_sys_reset_12default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2862default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2$
proc_sys_reset_12default:default2/
design_1_proc_sys_reset_0_12default:default2
102default:default2
62default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2862default:default8@Z8-7023h px� 
k
%s
*synth2S
?	Parameter C_MAXIGP0_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_MAXIGP1_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_MAXIGP2_DATA_WIDTH bound to: 32 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SAXIGP0_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SAXIGP1_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SAXIGP2_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SAXIGP3_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SAXIGP4_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SAXIGP5_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_SAXIGP6_DATA_WIDTH bound to: 128 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter C_SD0_INTERNAL_BUS_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
m
%s
*synth2U
A	Parameter C_SD1_INTERNAL_BUS_WIDTH bound to: 4 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_PL_CLK0_BUF bound to: TRUE - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_PL_CLK1_BUF bound to: FALSE - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_PL_CLK2_BUF bound to: FALSE - type: string 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_PL_CLK3_BUF bound to: FALSE - type: string 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_NUM_F2P_0_INTR_INPUTS bound to: 1 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter C_NUM_F2P_1_INTR_INPUTS bound to: 1 - type: integer 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter C_NUM_FABRIC_RESETS bound to: 1 - type: integer 
2default:defaulth p
x
� 
g
%s
*synth2O
;	Parameter C_EMIO_GPIO_WIDTH bound to: 95 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_USE_DIFF_RW_CLK_GP0 bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_USE_DIFF_RW_CLK_GP1 bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_USE_DIFF_RW_CLK_GP2 bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_USE_DIFF_RW_CLK_GP3 bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_USE_DIFF_RW_CLK_GP4 bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_USE_DIFF_RW_CLK_GP5 bound to: 0 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter C_USE_DIFF_RW_CLK_GP6 bound to: 0 - type: integer 
2default:defaulth p
x
� 
k
%s
*synth2S
?	Parameter C_TRACE_PIPELINE_WIDTH bound to: 8 - type: integer 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter C_EN_EMIO_TRACE bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_EN_FIFO_ENET0 bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_EN_FIFO_ENET1 bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_EN_FIFO_ENET2 bound to: 0 - type: string 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_EN_FIFO_ENET3 bound to: 0 - type: string 
2default:defaulth p
x
� 
h
%s
*synth2P
<	Parameter C_TRACE_DATA_WIDTH bound to: 32 - type: integer 
2default:defaulth p
x
� 
e
%s
*synth2M
9	Parameter C_USE_DEBUG_TEST bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_DP_USE_AUDIO bound to: 0 - type: integer 
2default:defaulth p
x
� 
c
%s
*synth2K
7	Parameter C_DP_USE_VIDEO bound to: 0 - type: integer 
2default:defaulth p
x
� 
l
%s
*synth2T
@	Parameter SIM_DEVICE bound to: ULTRASCALE_PLUS - type: string 
2default:defaulth p
x
� 
d
%s
*synth2L
8	Parameter STARTUP_SYNC bound to: FALSE - type: string 
2default:defaulth p
x
� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
42default:default2$
EMIOSDIO0DATAOUT2default:default2
82default:default2
PS82default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
47032default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
42default:default2$
EMIOSDIO0DATAENA2default:default2
82default:default2
PS82default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
47042default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
42default:default2$
EMIOSDIO1DATAOUT2default:default2
82default:default2
PS82default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
47162default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
42default:default2$
EMIOSDIO1DATAENA2default:default2
82default:default2
PS82default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
47172default:default8@Z8-689h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXN0OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXN1OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXN2OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXN3OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXP0OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXP1OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXP2OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_MGTTXP3OUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2*
PSS_ALTO_CORE_PAD_PADO2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2.
PSS_ALTO_CORE_PAD_BOOTMODE2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2)
PSS_ALTO_CORE_PAD_CLK2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2+
PSS_ALTO_CORE_PAD_DONEB2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2+
PSS_ALTO_CORE_PAD_DRAMA2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2.
PSS_ALTO_CORE_PAD_DRAMACTN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_DRAMALERTN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
PSS_ALTO_CORE_PAD_DRAMBA2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
PSS_ALTO_CORE_PAD_DRAMBG2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
PSS_ALTO_CORE_PAD_DRAMCK2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_DRAMCKE2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_DRAMCKN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_DRAMCSN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
PSS_ALTO_CORE_PAD_DRAMDM2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
PSS_ALTO_CORE_PAD_DRAMDQ2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_DRAMDQS2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2.
PSS_ALTO_CORE_PAD_DRAMDQSN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_DRAMODT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
PSS_ALTO_CORE_PAD_DRAMPARITY2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys21
PSS_ALTO_CORE_PAD_DRAMRAMRSTN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2.
PSS_ALTO_CORE_PAD_ERROROUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys21
PSS_ALTO_CORE_PAD_ERRORSTATUS2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2+
PSS_ALTO_CORE_PAD_INITB2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_JTAGTCK2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_JTAGTDI2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_JTAGTDO2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_JTAGTMS2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2)
PSS_ALTO_CORE_PAD_MIO2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2*
PSS_ALTO_CORE_PAD_PORB2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2+
PSS_ALTO_CORE_PAD_PROGB2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys21
PSS_ALTO_CORE_PAD_RCALIBINOUT2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2+
PSS_ALTO_CORE_PAD_SRSTB2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2(
PSS_ALTO_CORE_PAD_ZQ2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXN0IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXN1IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXN2IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXN3IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXP0IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXP1IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXP2IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2/
PSS_ALTO_CORE_PAD_MGTRXP3IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2*
PSS_ALTO_CORE_PAD_PADI2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFN0IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFN1IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFN2IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFN3IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFP0IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFP1IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFP2IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2-
PSS_ALTO_CORE_PAD_REFP3IN2default:default2
PS82default:default2
PS8_i2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
PS8_i2default:default2
PS82default:default2
10152default:default2
9572default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/hdl/zynq_ultra_ps_e_v3_3_3.v2default:default2
38932default:default8@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
emio_enet0_signal_detect2default:default2:
&zynq_ultra_ps_e_v3_3_3_zynq_ultra_ps_e2default:default2
inst2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/synth/design_1_zynq_ultra_ps_e_0_0.v2default:default2
4422default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
emio_enet1_signal_detect2default:default2:
&zynq_ultra_ps_e_v3_3_3_zynq_ultra_ps_e2default:default2
inst2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/synth/design_1_zynq_ultra_ps_e_0_0.v2default:default2
4422default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
emio_enet2_signal_detect2default:default2:
&zynq_ultra_ps_e_v3_3_3_zynq_ultra_ps_e2default:default2
inst2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/synth/design_1_zynq_ultra_ps_e_0_0.v2default:default2
4422default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
emio_enet3_signal_detect2default:default2:
&zynq_ultra_ps_e_v3_3_3_zynq_ultra_ps_e2default:default2
inst2default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/synth/design_1_zynq_ultra_ps_e_0_0.v2default:default2
4422default:default8@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
inst2default:default2:
&zynq_ultra_ps_e_v3_3_3_zynq_ultra_ps_e2default:default2
14912default:default2
14872default:default2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/synth/design_1_zynq_ultra_ps_e_0_0.v2default:default2
4422default:default8@Z8-7023h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2)
emio_enet1_speed_mode2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2'
emio_enet1_gmii_txd2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2)
emio_enet1_gmii_tx_en2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2)
emio_enet1_gmii_tx_er2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2'
emio_enet1_mdio_mdc2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2%
emio_enet1_mdio_o2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2%
emio_enet1_mdio_t2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys20
emio_enet1_tsu_timer_cmp_val2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2,
emio_enet1_dma_bus_width2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
emio_gpio_o2default:default20
design_1_zynq_ultra_ps_e_0_02default:default2%
zynq_ultra_ps_e_02default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7071h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-70712default:default2
1002default:defaultZ17-14h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2%
zynq_ultra_ps_e_02default:default20
design_1_zynq_ultra_ps_e_0_02default:default2
1122default:default2
962default:default2{
e/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/synth/design_1.v2default:default2
2932default:default8@Z8-7023h px� 
�
%s*synth2�
�Finished RTL Elaboration : Time (s): cpu = 00:00:15 ; elapsed = 00:00:24 . Memory (MB): peak = 5852.609 ; gain = 620.766 ; free physical = 100641 ; free virtual = 125283
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:17 ; elapsed = 00:00:27 . Memory (MB): peak = 5852.609 ; gain = 620.766 ; free physical = 100703 ; free virtual = 125345
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:17 ; elapsed = 00:00:27 . Memory (MB): peak = 5852.609 ; gain = 620.766 ; free physical = 100703 ; free virtual = 125345
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:042default:default2
00:00:042default:default2
6719.7112default:default2
0.0002default:default2
995812default:default2
1242232default:defaultZ17-722h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
692default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0.xdc2default:default27
!design_1_i/zynq_ultra_ps_e_0/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/design_1_zynq_ultra_ps_e_0_0.xdc2default:default27
!design_1_i/zynq_ultra_ps_e_0/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_board.xdc2default:default24
design_1_i/proc_sys_reset_0/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_board.xdc2default:default24
design_1_i/proc_sys_reset_0/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0.xdc2default:default24
design_1_i/proc_sys_reset_0/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0.xdc2default:default24
design_1_i/proc_sys_reset_0/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_1/design_1_proc_sys_reset_0_1_board.xdc2default:default24
design_1_i/proc_sys_reset_1/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_1/design_1_proc_sys_reset_0_1_board.xdc2default:default24
design_1_i/proc_sys_reset_1/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_1/design_1_proc_sys_reset_0_1.xdc2default:default24
design_1_i/proc_sys_reset_1/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_1/design_1_proc_sys_reset_0_1.xdc2default:default24
design_1_i/proc_sys_reset_1/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc2default:default2/
design_1_i/clk_wiz_0/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc2default:default2/
design_1_i/clk_wiz_0/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc2default:default2/
design_1_i/clk_wiz_0/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc2default:default2/
design_1_i/clk_wiz_0/inst	2default:default8Z20-847h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc2default:default26
".Xil/design_1_wrapper_propImpl.xdc2default:defaultZ1-236h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/bd_afc3_psr0_0_board.xdc2default:default2=
'design_1_i/axi_smc/inst/clk_map/psr0/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/bd_afc3_psr0_0_board.xdc2default:default2=
'design_1_i/axi_smc/inst/clk_map/psr0/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/bd_afc3_psr0_0.xdc2default:default2=
'design_1_i/axi_smc/inst/clk_map/psr0/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_1/bd_afc3_psr0_0.xdc2default:default2=
'design_1_i/axi_smc/inst/clk_map/psr0/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/bd_afc3_psr_aclk_0_board.xdc2default:default2A
+design_1_i/axi_smc/inst/clk_map/psr_aclk/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/bd_afc3_psr_aclk_0_board.xdc2default:default2A
+design_1_i/axi_smc/inst/clk_map/psr_aclk/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/bd_afc3_psr_aclk_0.xdc2default:default2A
+design_1_i/axi_smc/inst/clk_map/psr_aclk/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_2/bd_afc3_psr_aclk_0.xdc2default:default2A
+design_1_i/axi_smc/inst/clk_map/psr_aclk/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/bd_afc3_psr_aclk1_0_board.xdc2default:default2B
,design_1_i/axi_smc/inst/clk_map/psr_aclk1/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/bd_afc3_psr_aclk1_0_board.xdc2default:default2B
,design_1_i/axi_smc/inst/clk_map/psr_aclk1/U0	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/bd_afc3_psr_aclk1_0.xdc2default:default2B
,design_1_i/axi_smc/inst/clk_map/psr_aclk1/U0	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.gen/sources_1/bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_3/bd_afc3_psr_aclk1_0.xdc2default:default2B
,design_1_i/axi_smc/inst/clk_map/psr_aclk1/U0	2default:default8Z20-847h px� 
8
Deriving generated clocks
2*timingZ38-2h px� 
�
Parsing XDC File [%s]
179*designutils2l
V/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.runs/synth_1/dont_touch.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2l
V/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.runs/synth_1/dont_touch.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2j
V/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.runs/synth_1/dont_touch.xdc2default:default26
".Xil/design_1_wrapper_propImpl.xdc2default:defaultZ1-236h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2V
B/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl2default:default26
".Xil/design_1_wrapper_propImpl.xdc2default:defaultZ1-236h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
No cells matched '%s'.
180*	planAhead2�
�get_cells -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}2default:default2]
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default2
32default:default8@Z12-180h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2[
G/opt/xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl2default:default26
".Xil/design_1_wrapper_propImpl.xdc2default:defaultZ1-236h px� 
l
2%s XPM XDC files have been applied to the design.
665*project2
32default:defaultZ1-1715h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.052default:default2
00:00:00.052default:default2
8802.6372default:default2
0.0002default:default2
983312default:default2
1229732default:defaultZ17-722h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 68 instances were transformed.
  BUFG => BUFGCE: 2 instances
  FDR => FDRE: 60 instances
  IBUF => IBUF (IBUFCTRL, INBUF): 1 instance 
  SRL16 => SRL16E: 5 instances
2default:defaultZ1-111h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:00.722default:default2
00:00:00.722default:default2
8802.6412default:default2
0.0042default:default2
982572default:default2
1229542default:defaultZ17-722h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:01:13 ; elapsed = 00:01:07 . Memory (MB): peak = 8802.641 ; gain = 3570.797 ; free physical = 100007 ; free virtual = 125080
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
P
%s
*synth28
$Loading part: xczu19eg-ffvb1517-2-i
2default:defaulth p
x
� 
B
 Reading net delay rules and data4578*oasysZ8-6742h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:01:13 ; elapsed = 00:01:07 . Memory (MB): peak = 8802.641 ; gain = 3570.797 ; free physical = 100007 ; free virtual = 125080
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:01:13 ; elapsed = 00:01:08 . Memory (MB): peak = 8802.641 ; gain = 3570.797 ; free physical = 99768 ; free virtual = 124849
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2+
gen_pipelined.state_reg2default:defaultZ8-4490h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2+
gen_pipelined.state_reg2default:defaultZ8-4490h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2+
gen_pipelined.state_reg2default:defaultZ8-4490h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2.
gen_AB_reg_slice.state_reg2default:defaultZ8-4490h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys22
gen_axi.gen_write.write_cs_reg2default:default2/
sc_mmu_v1_0_10_decerr_slave2default:defaultZ8-802h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2+
gen_pipelined.state_reg2default:defaultZ8-4490h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2+
gen_pipelined.state_reg2default:defaultZ8-4490h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2+
gen_pipelined.state_reg2default:defaultZ8-4490h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2+
gen_pipelined.state_reg2default:defaultZ8-4490h px� 
�
@FSM extraction disabled for register '%s' through user attribute3641*oasys2.
gen_AB_reg_slice.state_reg2default:defaultZ8-4490h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2
unit2default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized02default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized12default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized22default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized32default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized42default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized52default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized62default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized72default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized82default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2(
unit__parameterized92default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2)
unit__parameterized102default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2)
unit__parameterized112default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2)
unit__parameterized122default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2)
unit__parameterized132default:defaultZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
cmd_reg2default:default2)
unit__parameterized142default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_            P_WRITE_IDLE |                              001 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_            P_WRITE_DATA |                              010 |                               01
2default:defaulth p
x
� 
�
%s
*synth2s
_            P_WRITE_RESP |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys22
gen_axi.gen_write.write_cs_reg2default:default2
one-hot2default:default2/
sc_mmu_v1_0_10_decerr_slave2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2
unit2default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized02default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized12default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized22default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized32default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized42default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized52default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized62default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized72default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized82default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2(
unit__parameterized92default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2)
unit__parameterized102default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2)
unit__parameterized112default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2)
unit__parameterized122default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2)
unit__parameterized132default:defaultZ8-3354h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE0 |                              010 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_                  iSTATE |                              100 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_                 iSTATE1 |                              001 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
cmd_reg2default:default2
one-hot2default:default2)
unit__parameterized142default:defaultZ8-3354h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:01:27 ; elapsed = 00:01:24 . Memory (MB): peak = 8802.641 ; gain = 3570.797 ; free physical = 95369 ; free virtual = 120656
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 68    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   32 Bit       Adders := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   32 Bit       Adders := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   31 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   27 Bit       Adders := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   26 Bit       Adders := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   18 Bit       Adders := 64    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   18 Bit       Adders := 64    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   17 Bit       Adders := 224   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   17 Bit       Adders := 128   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   16 Bit       Adders := 6     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit       Adders := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    9 Bit       Adders := 129   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    9 Bit       Adders := 96    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 150   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    8 Bit       Adders := 544   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    8 Bit       Adders := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    7 Bit       Adders := 12    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    7 Bit       Adders := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    6 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 183   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 36    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    5 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    5 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 193   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    4 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 14    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit       Adders := 128   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit       Adders := 6     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    1 Bit       Adders := 6     
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     64 Bit         XORs := 384   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     45 Bit         XORs := 32    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     44 Bit         XORs := 32    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     42 Bit         XORs := 64    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     39 Bit         XORs := 32    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     36 Bit         XORs := 32    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     33 Bit         XORs := 64    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     32 Bit         XORs := 128   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 64    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     31 Bit         XORs := 32    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     27 Bit         XORs := 128   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      6 Bit         XORs := 14    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 476   
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	             2178 Bit    Registers := 46    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	             1024 Bit    Registers := 32    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              350 Bit    Registers := 16    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              342 Bit    Registers := 69    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              304 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              277 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              256 Bit    Registers := 68    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              224 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              192 Bit    Registers := 64    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              181 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              163 Bit    Registers := 6     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              161 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              152 Bit    Registers := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              148 Bit    Registers := 6     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              147 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              139 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              138 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              128 Bit    Registers := 4     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               64 Bit    Registers := 498   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               47 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               40 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               33 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 119   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               27 Bit    Registers := 32    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               26 Bit    Registers := 96    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               25 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               23 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               20 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               19 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               18 Bit    Registers := 8     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               17 Bit    Registers := 225   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 29    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               14 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 5     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               11 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                9 Bit    Registers := 96    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 116   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                7 Bit    Registers := 7     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                6 Bit    Registers := 202   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 30    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 316   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 97    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 362   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 1584  
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input 2178 Bit        Muxes := 23    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input 1024 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input 1024 Bit        Muxes := 112   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input 1024 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  342 Bit        Muxes := 59    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  304 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  277 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  256 Bit        Muxes := 112   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  256 Bit        Muxes := 505   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input  256 Bit        Muxes := 64    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  192 Bit        Muxes := 320   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input  192 Bit        Muxes := 64    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  192 Bit        Muxes := 64    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  191 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  179 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  169 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  163 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  161 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  152 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  148 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  144 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input  128 Bit        Muxes := 22    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  124 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  114 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input  108 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   64 Bit        Muxes := 1120  
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   64 Bit        Muxes := 864   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   64 Bit        Muxes := 48    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   47 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   40 Bit        Muxes := 9     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   33 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   33 Bit        Muxes := 640   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 428   
2default:defaulth p
x
� 
X
%s
*synth2@
,	  31 Input   32 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input   32 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   31 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   29 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   27 Bit        Muxes := 64    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input   26 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   26 Bit        Muxes := 96    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   24 Bit        Muxes := 160   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   23 Bit        Muxes := 290   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   20 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   18 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   17 Bit        Muxes := 240   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   17 Bit        Muxes := 593   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 461   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   16 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   14 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   12 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   11 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    9 Bit        Muxes := 256   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 1776  
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    8 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    8 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    7 Bit        Muxes := 142   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    7 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 96    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  28 Input    6 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 34    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  32 Input    5 Bit        Muxes := 32    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    5 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    5 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 561   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    4 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    3 Bit        Muxes := 33    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  11 Input    3 Bit        Muxes := 13    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 48    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    3 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   9 Input    3 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    3 Bit        Muxes := 17    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 695   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    2 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    2 Bit        Muxes := 160   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 49    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    2 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 177   
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 168   
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    1 Bit        Muxes := 69    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 46    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  12 Input    1 Bit        Muxes := 17    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 1688  
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 385   
2default:defaulth p
x
� 
X
%s
*synth2@
,	  32 Input    1 Bit        Muxes := 32    
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2p
\Part Resources:
DSPs: 1968 (col length:264)
BRAMs: 1968 (col length: RAMB18 264 RAMB36 132)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
12default:default27
#\gen_w_ch.post_upsize_ratio_reg[1] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default27
#\gen_w_ch.post_upsize_ratio_reg[0] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
12default:default24
 \gen_w_ch.post_pntr_mask_reg[0] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default25
!\gen_w_ch.post_pntr_shift_reg[5] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default25
!\gen_w_ch.post_pntr_shift_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default25
!\gen_w_ch.post_pntr_shift_reg[7] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default25
!\gen_w_ch.post_pntr_shift_reg[0] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default25
!\gen_w_ch.post_pntr_shift_reg[1] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
12default:default25
!\gen_w_ch.post_pntr_shift_reg[2] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default25
!\gen_w_ch.post_pntr_shift_reg[3] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default25
!\gen_w_ch.post_pntr_shift_reg[4] 2default:defaultZ8-3333h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2$
unit1_forstat[1]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2)
unit1_forstat_fold[1]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
cmd[1]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
cmd[0]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[255]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[254]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[253]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[252]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[251]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[250]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[249]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[248]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[247]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[246]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[245]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[244]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[243]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[242]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[241]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[240]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[239]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[238]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[237]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[236]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[235]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[234]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[233]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[232]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[231]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[230]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[229]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[228]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[227]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[226]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[225]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[224]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[223]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[222]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[221]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[220]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[219]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[218]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[217]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[216]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[215]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[214]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[213]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[212]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[211]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[210]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[209]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[208]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[207]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[206]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[205]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[204]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[203]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[202]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[201]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[200]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[199]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[198]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[197]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[196]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[195]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[194]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[193]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[192]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[191]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[190]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[189]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[188]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[187]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[186]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[185]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[184]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[183]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[182]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[181]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[180]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[179]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[178]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[177]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[176]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[175]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[174]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[173]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[172]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[171]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[170]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[169]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[168]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[167]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[166]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[165]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[164]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[163]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[162]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[161]2default:default2
stage12default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

conf0[160]2default:default2
stage12default:defaultZ8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-71292default:default2
1002default:defaultZ17-14h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-71292default:default2
1002default:defaultZ17-14h px� 
b
%s
*synth2J
6DSP Report: Generating DSP s, operation Mode is: A*B.
2default:defaulth p
x
� 
[
%s
*synth2C
/DSP Report: operator s is absorbed into DSP s.
2default:defaulth p
x
� 
b
%s
*synth2J
6DSP Report: Generating DSP s, operation Mode is: A*B.
2default:defaulth p
x
� 
[
%s
*synth2C
/DSP Report: operator s is absorbed into DSP s.
2default:defaulth p
x
� 
b
%s
*synth2J
6DSP Report: Generating DSP s, operation Mode is: A*B.
2default:defaulth p
x
� 
[
%s
*synth2C
/DSP Report: operator s is absorbed into DSP s.
2default:defaulth p
x
� 
b
%s
*synth2J
6DSP Report: Generating DSP s, operation Mode is: A*B.
2default:defaulth p
x
� 
[
%s
*synth2C
/DSP Report: operator s is absorbed into DSP s.
2default:defaulth p
x
� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default23
fpu1l/\fadd_s1_frac_r/q_reg[0] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default22
fpu1l/\fadd_s1_exp_r/q_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default23
fpu1h/\fadd_s1_frac_r/q_reg[0] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default22
fpu1h/\fadd_s1_exp_r/q_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2-
spu2/\sfma_so_r/q_reg[7] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2-
spu2/\sfma_so_r/q_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2-
spu2/\sfma_so_r/q_reg[9] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[10] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[11] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[12] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[13] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[14] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[15] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[23] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[24] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[25] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[26] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[27] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[28] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[29] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[30] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2.
spu2/\sfma_so_r/q_reg[31] 2default:defaultZ8-3333h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-71292default:default2
1002default:defaultZ17-14h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-71292default:default2
1002default:defaultZ17-14h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2/
fsm/\axiif_keep_skp_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2/
fsm/\axiif_keep_skp_reg[9] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default20
fsm/\axiif_keep_skp_reg[10] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default29
%fsm/axring_top_buf/\queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2/
fsm/\axiif_keep_len_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2/
fsm/\axiif_keep_len_reg[9] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default20
fsm/\axiif_keep_len_reg[10] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default20
fsm/\axiif_keep_len_reg[11] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default20
fsm/\axiif_keep_len_reg[12] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default20
fsm/\axiif_keep_len_reg[13] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default20
fsm/\axiif_keep_len_reg[14] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default20
fsm/\axiif_keep_len_reg[15] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2)
fsm/next_linkup_r_reg2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2'
fsm/axiif_mbusy_reg2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2*
fsm/\axiif_skp_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2*
fsm/\axiif_skp_reg[9] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_skp_reg[10] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default29
%fsm/axring_top_buf/\queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_mlen_reg[12] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_mlen_reg[13] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_mlen_reg[14] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_mlen_reg[15] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[0] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[1] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[2] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[3] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[4] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[5] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[6] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[7] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_mlen_reg[9] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_mlen_reg[10] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_mlen_reg[11] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_alen_reg[8] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2+
fsm/\axiif_alen_reg[9] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_alen_reg[10] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_alen_reg[11] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_alen_reg[12] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_alen_reg[13] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_alen_reg[14] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2,
fsm/\axiif_alen_reg[15] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2A
-\EMAX6_UNIT[14].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2A
-\EMAX6_UNIT[12].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2A
-\EMAX6_UNIT[10].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[8].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[6].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[4].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[2].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[0].mux_top_buf/queue_reg[1][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2A
-\EMAX6_UNIT[14].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2A
-\EMAX6_UNIT[12].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2A
-\EMAX6_UNIT[10].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[8].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[6].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[4].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[2].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2@
,\EMAX6_UNIT[0].mux_top_buf/queue_reg[0][22] 2default:defaultZ8-3333h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:02:32 ; elapsed = 00:02:35 . Memory (MB): peak = 8802.641 ; gain = 3570.797 ; free physical = 92078 ; free virtual = 117624
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
M
%s*synth25
!
ROM: Preliminary Mapping	Report
2default:defaulth px� 
i
%s*synth2Q
=+------------+------------+---------------+----------------+
2default:defaulth px� 
j
%s*synth2R
>|Module Name | RTL Object | Depth x Width | Implemented As | 
2default:defaulth px� 
i
%s*synth2Q
=+------------+------------+---------------+----------------+
2default:defaulth px� 
j
%s*synth2R
>|popcount12  | d          | 64x3          | LUT            | 
2default:defaulth px� 
j
%s*synth2R
>|popcount12  | d          | 64x3          | LUT            | 
2default:defaulth px� 
j
%s*synth2R
>+------------+------------+---------------+----------------+

2default:defaulth px� 
j
%s*synth2R
>
Distributed RAM: Preliminary Mapping	Report (see note below)
2default:defaulth px� 
�
%s*synth2�
�+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+----------------+----------------------+----------------+
2default:defaulth px� 
�
%s*synth2�
�|Module Name                                                                                                                                                                                                               | RTL Object                       | Inference      | Size (Depth x Width) | Primitives     | 
2default:defaulth px� 
�
%s*synth2�
�+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+----------------+----------------------+----------------+
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/\inst/s00_nodes/s00_w_node/inst /inst_mi_handleri_1/\gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 18              | RAM32M16 x 2	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/\inst/s00_nodes/s00_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/\inst/s00_nodes/s00_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_ar_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_aw_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_b_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 25              | RAM32M16 x 2	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 148             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 147             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/\inst/s01_nodes/s01_w_node/inst /inst_mi_handleri_1/\gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 18              | RAM32M16 x 2	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/\inst/s01_nodes/s01_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/\inst/s01_nodes/s01_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_ar_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_aw_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_b_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 25              | RAM32M16 x 2	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 148             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 147             | RAM32M16 x 11	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_ar_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                          | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 181             | RAM32M16 x 13	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_aw_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                          | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 181             | RAM32M16 x 13	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_b_node/inst /\inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 19              | RAM32M16 x 2	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_b_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 7               | RAM32M16 x 1	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_r_node/inst /\inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 19              | RAM32M16 x 2	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 139             | RAM32M16 x 10	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 138             | RAM32M16 x 10	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_si_handler/gen_si_handler.gen_request_fifos.gen_req_fifo[0].inst_req_fifo/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 4 x 1                | RAM16X1D x 1	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_si_handler/gen_si_handler.gen_request_fifos.gen_req_fifo[1].inst_req_fifo/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 4 x 1                | RAM16X1D x 1	  | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 161             | RAM32M16 x 12	 | 
2default:defaulth px� 
�
%s*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 161             | RAM32M16 x 12	 | 
2default:defaulth px� 
�
%s*synth2�
�+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+----------------+----------------------+----------------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
2default:defaulth px� 
^
%s*synth2F
2
DSP: Preliminary Mapping	Report (see note below)
2default:defaulth px� 
�
%s*synth2�
|+------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
}|Module Name | DSP Mapping | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px� 
�
%s*synth2�
|+------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
}|exe1        | A*B         | 11     | 9      | -      | -      | 20     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
}|exe1        | A*B         | 11     | 9      | -      | -      | 20     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
}|exe1        | A*B         | 11     | 9      | -      | -      | 20     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
}|exe1        | A*B         | 11     | 9      | -      | -      | 20     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
}+------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
2Moved timing constraint from pin '%s' to pin '%s'
4028*oasys25
!design_1_i/clk_wiz_0/inst/clk_in12default:default2J
6zynq_ultra_ps_e_0/inst/buffer_pl_clk_0.PL_CLK_0_BUFG/O2default:defaultZ8-5578h px� 
�
SMoved %s constraints on hierarchical pins to their respective driving/loading pins
4235*oasys2
12default:defaultZ8-5819h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:02:49 ; elapsed = 00:03:01 . Memory (MB): peak = 8802.641 ; gain = 3570.797 ; free physical = 90113 ; free virtual = 115877
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Timing Optimization : Time (s): cpu = 00:03:28 ; elapsed = 00:03:41 . Memory (MB): peak = 8802.641 ; gain = 3570.797 ; free physical = 89721 ; free virtual = 115496
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
S
%s
*synth2;
'
Distributed RAM: Final Mapping	Report
2default:defaulth p
x
� 
�
%s
*synth2�
�+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+----------------+----------------------+----------------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|Module Name                                                                                                                                                                                                               | RTL Object                       | Inference      | Size (Depth x Width) | Primitives     | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+----------------+----------------------+----------------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/\inst/s00_nodes/s00_w_node/inst /inst_mi_handleri_1/\gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 18              | RAM32M16 x 2	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/\inst/s00_nodes/s00_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/\inst/s00_nodes/s00_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_ar_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_aw_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_b_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 25              | RAM32M16 x 2	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 148             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s00_nodesi_0/\s00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 147             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/\inst/s01_nodes/s01_w_node/inst /inst_mi_handleri_1/\gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 18              | RAM32M16 x 2	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/\inst/s01_nodes/s01_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/\inst/s01_nodes/s01_w_node/inst /inst_mi_handleri_1/\gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 152             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_ar_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_aw_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                               | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 163             | RAM32M16 x 12	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_b_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 25              | RAM32M16 x 2	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 148             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/s01_nodesi_1/\s01_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                                | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 147             | RAM32M16 x 11	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_ar_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                          | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 181             | RAM32M16 x 13	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_aw_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                          | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 181             | RAM32M16 x 13	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_b_node/inst /\inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 19              | RAM32M16 x 2	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_b_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 7               | RAM32M16 x 1	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_r_node/inst /\inst_mi_handler/gen_normal_area.gen_fifo_req.inst_fifo_req/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                     | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 19              | RAM32M16 x 2	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 139             | RAM32M16 x 10	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_r_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 138             | RAM32M16 x 10	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_si_handler/gen_si_handler.gen_request_fifos.gen_req_fifo[0].inst_req_fifo/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 4 x 1                | RAM16X1D x 1	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_si_handler/gen_si_handler.gen_request_fifos.gen_req_fifo[1].inst_req_fifo/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 4 x 1                | RAM16X1D x 1	  | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[0].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 161             | RAM32M16 x 12	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|design_1_i/axi_smc/insti_2/\m00_nodes/m00_w_node/inst /\inst_mi_handler/gen_normal_area.inst_fifo_node_payld/gen_xpm_memory_fifo.inst_fifo/gen_mem_rep[1].inst_xpm_memory /xpm_memory_base_inst                           | gen_wr_a.gen_word_narrow.mem_reg | User Attribute | 32 x 161             | RAM32M16 x 12	 | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------------------+----------------+----------------------+----------------+

2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Technology Mapping : Time (s): cpu = 00:04:13 ; elapsed = 00:04:29 . Memory (MB): peak = 8856.434 ; gain = 3624.590 ; free physical = 84663 ; free virtual = 110499
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[0]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[31]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[30]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[29]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[28]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[27]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[26]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[25]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[24]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[23]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[22]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[21]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[20]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[19]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[18]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[17]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[16]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[15]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[14]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[13]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[12]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[11]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[10]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[0]_inferred2default:default2
in0[0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[7]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[6]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[5]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[4]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[3]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[2]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2.
trace_ctl_pipe[1]_inferred2default:default2
in02default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[31]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[30]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[29]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[28]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[27]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[26]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[25]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[24]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[23]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[22]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[21]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[20]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[19]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[18]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[17]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[16]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[15]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[14]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[13]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[12]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[11]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[10]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[4]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[3]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[2]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[1]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[7]_inferred2default:default2
in0[0]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[31]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[30]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[29]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[28]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[27]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[26]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[25]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[24]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[23]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[22]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[21]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[20]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[19]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[18]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[17]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[16]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[15]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[14]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[13]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[12]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[11]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[10]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[9]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[8]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[7]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[6]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[5]2default:defaultZ8-3295h px� 
�
'tying undriven pin %s:%s to constant 0
3295*oasys2/
trace_data_pipe[6]_inferred2default:default2
in0[4]2default:defaultZ8-3295h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-32952default:default2
1002default:defaultZ17-14h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished IO Insertion : Time (s): cpu = 00:04:39 ; elapsed = 00:04:57 . Memory (MB): peak = 9406.906 ; gain = 4175.062 ; free physical = 82914 ; free virtual = 109147
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:04:40 ; elapsed = 00:04:58 . Memory (MB): peak = 9406.906 ; gain = 4175.062 ; free physical = 82869 ; free virtual = 109103
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:04:57 ; elapsed = 00:05:15 . Memory (MB): peak = 9406.906 ; gain = 4175.062 ; free physical = 82252 ; free virtual = 108458
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:04:59 ; elapsed = 00:05:18 . Memory (MB): peak = 9406.906 ; gain = 4175.062 ; free physical = 82241 ; free virtual = 108468
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:05:00 ; elapsed = 00:05:19 . Memory (MB): peak = 9406.906 ; gain = 4175.062 ; free physical = 82241 ; free virtual = 108469
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:05:01 ; elapsed = 00:05:20 . Memory (MB): peak = 9406.906 ; gain = 4175.062 ; free physical = 82239 ; free virtual = 108466
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 
Dynamic Shift Register Report:
2default:defaulth p
x
� 
�
%s
*synth2w
c+------------+---------------+--------+------------+--------+---------+--------+--------+--------+
2default:defaulth p
x
� 
�
%s
*synth2x
d|Module Name | RTL Name      | Length | Data Width | SRL16E | SRLC32E | Mux F7 | Mux F8 | Mux F9 | 
2default:defaulth p
x
� 
�
%s
*synth2w
c+------------+---------------+--------+------------+--------+---------+--------+--------+--------+
2default:defaulth p
x
� 
�
%s
*synth2x
d|dsrl        | shift_reg_reg | 16     | 1          | 1      | 0       | 0      | 0      | 0      | 
2default:defaulth p
x
� 
�
%s
*synth2x
d|dsrl__1     | shift_reg_reg | 32     | 1          | 0      | 1       | 0      | 0      | 0      | 
2default:defaulth p
x
� 
�
%s
*synth2x
d+------------+---------------+--------+------------+--------+---------+--------+--------+--------+

2default:defaulth p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
N
%s*synth26
"+------+----------------+-------+
2default:defaulth px� 
N
%s*synth26
"|      |Cell            |Count  |
2default:defaulth px� 
N
%s*synth26
"+------+----------------+-------+
2default:defaulth px� 
N
%s*synth26
"|1     |BUFG            |      2|
2default:defaulth px� 
N
%s*synth26
"|2     |BUFG_PS         |      1|
2default:defaulth px� 
N
%s*synth26
"|3     |CARRY8          |   4170|
2default:defaulth px� 
N
%s*synth26
"|4     |DSP_ALU         |     64|
2default:defaulth px� 
N
%s*synth26
"|5     |DSP_A_B_DATA    |     64|
2default:defaulth px� 
N
%s*synth26
"|6     |DSP_C_DATA      |     64|
2default:defaulth px� 
N
%s*synth26
"|7     |DSP_MULTIPLIER  |     64|
2default:defaulth px� 
N
%s*synth26
"|8     |DSP_M_DATA      |     64|
2default:defaulth px� 
N
%s*synth26
"|9     |DSP_OUTPUT      |     64|
2default:defaulth px� 
N
%s*synth26
"|10    |DSP_PREADD      |     64|
2default:defaulth px� 
N
%s*synth26
"|11    |DSP_PREADD_DATA |     64|
2default:defaulth px� 
N
%s*synth26
"|12    |LUT1            |    878|
2default:defaulth px� 
N
%s*synth26
"|13    |LUT2            |  31153|
2default:defaulth px� 
N
%s*synth26
"|14    |LUT3            |  45835|
2default:defaulth px� 
N
%s*synth26
"|15    |LUT4            | 117369|
2default:defaulth px� 
N
%s*synth26
"|16    |LUT5            |  77297|
2default:defaulth px� 
N
%s*synth26
"|17    |LUT6            | 163821|
2default:defaulth px� 
N
%s*synth26
"|18    |MMCME4_ADV      |      1|
2default:defaulth px� 
N
%s*synth26
"|19    |MUXF7           |   2178|
2default:defaulth px� 
N
%s*synth26
"|20    |MUXF8           |    480|
2default:defaulth px� 
N
%s*synth26
"|21    |PS8             |      1|
2default:defaulth px� 
N
%s*synth26
"|22    |RAM16X1D        |      2|
2default:defaulth px� 
N
%s*synth26
"|23    |RAM32M16        |    172|
2default:defaulth px� 
N
%s*synth26
"|24    |RAMB36E2        |    544|
2default:defaulth px� 
N
%s*synth26
"|25    |SRL16           |      5|
2default:defaulth px� 
N
%s*synth26
"|26    |SRL16E          |    246|
2default:defaulth px� 
N
%s*synth26
"|27    |SRLC32E         |    548|
2default:defaulth px� 
N
%s*synth26
"|28    |FDCE            | 125960|
2default:defaulth px� 
N
%s*synth26
"|29    |FDPE            |   4336|
2default:defaulth px� 
N
%s*synth26
"|30    |FDR             |     28|
2default:defaulth px� 
N
%s*synth26
"|31    |FDRE            |  11825|
2default:defaulth px� 
N
%s*synth26
"|32    |FDSE            |    262|
2default:defaulth px� 
N
%s*synth26
"|33    |IBUF            |      1|
2default:defaulth px� 
N
%s*synth26
"+------+----------------+-------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:05:02 ; elapsed = 00:05:20 . Memory (MB): peak = 9406.906 ; gain = 4175.062 ; free physical = 82237 ; free virtual = 108465
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
t
%s
*synth2\
HSynthesis finished with 0 errors, 0 critical warnings and 565 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:04:10 ; elapsed = 00:04:45 . Memory (MB): peak = 9410.812 ; gain = 1228.938 ; free physical = 92622 ; free virtual = 118851
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:05:04 ; elapsed = 00:05:22 . Memory (MB): peak = 9410.812 ; gain = 4178.969 ; free physical = 92691 ; free virtual = 118849
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:032default:default2
00:00:032default:default2
9577.7892default:default2
0.0002default:default2
919942default:default2
1181582default:defaultZ17-722h px� 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
71032default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
12default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
NRemoving redundant IBUF since it is not being driven by a top-level port. %s 
32*opt29
%design_1_i/clk_wiz_0/inst/clkin1_ibuf2default:defaultZ31-32h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
rThe CLKFBOUT to CLKFBIN net for instance %s with COMPENSATION=INTERNAL is optimized away to aid design routability238*opt2j
)design_1_i/clk_wiz_0/inst/mmcme4_adv_inst	)design_1_i/clk_wiz_0/inst/mmcme4_adv_inst2default:default8Z31-326h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.032default:default2
00:00:00.022default:default2
	10530.7302default:default2
0.0002default:default2
909202default:default2
1170912default:defaultZ17-722h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 273 instances were transformed.
  BUFG => BUFGCE: 2 instances
  DSP48E2 => DSP48E2 (DSP_ALU, DSP_A_B_DATA, DSP_C_DATA, DSP_MULTIPLIER, DSP_M_DATA, DSP_OUTPUT, DSP_PREADD, DSP_PREADD_DATA): 64 instances
  FDR => FDRE: 28 instances
  RAM16X1D => RAM32X1D (RAMD32(x2)): 2 instances
  RAM32M16 => RAM32M16 (RAMD32(x14), RAMS32(x2)): 172 instances
  SRL16 => SRL16E: 5 instances
2default:defaultZ1-111h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
4552default:default2
3502default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:05:572default:default2
00:06:212default:default2
	10530.7302default:default2
6011.5552default:default2
929732default:default2
1191432default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2p
\/home/nakashim/proj-arm64/fpga/ZU19EG-step4000/ZU19EG_16st.runs/synth_1/design_1_wrapper.dcp2default:defaultZ17-1381h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:512default:default2
00:00:382default:default2
	10921.3752default:default2
390.6452default:default2
953782default:default2
1216242default:defaultZ17-722h px� 
�
%s4*runtcl2�
vExecuting : report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Mar 30 09:44:09 20232default:defaultZ17-206h px� 


End Record