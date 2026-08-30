# AI generated OpenLane configuration
# Mixed-signal RTL-to-GDSII flow
# Design: SPI controlled AMUX2_3V


# Design name

set ::env(DESIGN_NAME) design_mux



# RTL source files

set ::env(VERILOG_FILES) "\
$::env(DESIGN_DIR)/src/design_mux.v \
$::env(DESIGN_DIR)/src/raven_spi.v \
$::env(DESIGN_DIR)/src/spi_slave.v"



# Analog hard macro blackbox

set ::env(VERILOG_FILES_BLACKBOX) "\
$::env(DESIGN_DIR)/src/AMUX2_3V.v"



# Clock information

set ::env(CLOCK_PORT) "SCK"

set ::env(CLOCK_PERIOD) "10"



# Extra macro LEF

set ::env(EXTRA_LEFS) "\
$::env(DESIGN_DIR)/src/lef/AMUX2_3V.lef"



# Extra macro GDS

set ::env(EXTRA_GDS_FILES) "\
$::env(DESIGN_DIR)/src/gds/AMUX2_3V.gds"

set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro.cfg

# Extra timing library for macro

set ::env(EXTRA_LIBS) "\
$::env(DESIGN_DIR)/src/lib/AMUX2_3V.lib"



# Floorplan settings

#set ::env(FP_CORE_UTIL) 20
set ::env(FP_SIZING) "absolute"
set ::env(PL_TARGET_DENSITY) 0.35
set ::env(DIE_AREA) "0 0 200 200"
set ::env(FP_PDN_VPITCH) 30
set ::env(FP_PDN_HPITCH) 30
set ::env(FP_PDN_MACRO_HOOKS) "analog_mux VPWR VGND VPWR VGND"
# Placement settings

set ::env(PL_RANDOM_GLB_PLACEMENT) 0

# Routing

set ::env(RT_MAX_LAYER) "met5"
