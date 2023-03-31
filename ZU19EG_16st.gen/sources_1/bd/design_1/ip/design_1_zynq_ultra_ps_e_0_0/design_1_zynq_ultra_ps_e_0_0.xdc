##############################PS XDC#########################################
############################################################################
##
##  Xilinx, Inc. 2006            www.xilinx.com
############################################################################
##  File name :       psu_constraints.xdc
##
##  Details :     Constraints file
##                    FPGA family:       zynq
##                    FPGA:              PROD-2
##                    Device Size:       xczu19eg
##                    Package:           ffvb1517
##                    Speedgrade:        -2
##
##
############################################################################
############################################################################
############################################################################
# Clock constraints                                                        #
############################################################################
create_clock -name clk_pl_0 -period "20" [get_pins "PS8_i/PLCLK[0]"]
create_clock -name mdio1_mdc_clock -period "480.004" [get_pins "PS8_i/EMIOENET1MDIOMDC"]



set_property DONT_TOUCH true [get_cells "PS8_i"]
