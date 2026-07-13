# AI Prompt Documentation

This document contains all AI prompts used to generate and debug the mixed-signal RTL-to-GDSII implementation using OpenLane and the SKY130 Process Design Kit.

---

# Prompt 1 – Analog Hard Macro Verilog Black Box

## Objective

Generate a synthesizable Verilog black-box module for the analog hard macro.

### Prompt

Generate a Verilog black-box module for an analog hard macro named **AMUX2_3V** compatible with the SKY130 technology and OpenLane RTL-to-GDSII flow.

Requirements:

- Module name: AMUX2_3V
- Treat the module as an analog hard macro.
- Do not include any behavioral logic.
- The module should only declare ports.
- Inputs:
  - I0
  - I1
  - select
- Output:
  - out
- The generated module should be synthesizable and compatible with OpenLane.
- Only generate the Verilog module.

Generated File:

AMUX2_3V.v

---

# Prompt 2 – SPI Slave RTL Generation

## Objective

Generate the SPI Slave RTL.

### Prompt

Generate a synthesizable Verilog module named **spi_slave** compatible with OpenLane.

Requirements:

- Module name: spi_slave
- Inputs:
  - RST
  - SCK
  - SDI
  - CSB
- Output:
  - data_out
- Use positive edge triggered SPI communication.
- Include reset functionality.
- Use synthesizable Verilog only.
- Avoid simulation-only constructs.
- Generate clean ASIC-compatible RTL.

Generated File:

spi_slave.v

---

# Prompt 3 – SPI Controller Wrapper

## Objective

Generate the digital SPI controller.

### Prompt

Generate a synthesizable Verilog module named **raven_spi** for a mixed-signal ASIC design.

Requirements:

Inputs:

- RST
- SCK
- SDI
- CSB
- trap
- mask_rev_in

Outputs:

- SDO
- reset

The module should instantiate the SPI Slave module internally and connect its outputs to generate the digital control signals required for the analog multiplexer.

Generate synthesizable RTL compatible with OpenLane.

Generated File:

raven_spi.v

---

# Prompt 4 – Mixed-Signal Top-Level Module

## Objective

Generate the top-level mixed-signal integration module.

### Prompt

Generate a Verilog top-level module named design_mux for a mixed-signal ASIC design.

The design should integrate a digital SPI controller with an analog multiplexer hard macro.

Requirements:

1. The top-level module name should be:
design_mux

2. Top-level ports:

Outputs:
- out

Inputs:
- select
- RST
- SCK
- SDI
- CSB
- trap
- mask_rev_in

3. Instantiate a digital module named raven_spi inside design_mux.

The raven_spi module has ports:

Inputs:
- RST
- SCK
- SDI
- CSB
- trap
- mask_rev_in

Outputs:
- SDO
- reset

4. Create internal wires:
- I0
- I1

Connect:
raven_spi.SDO -> I0
raven_spi.reset -> I1

5. Instantiate an analog hard macro named AMUX2_3V.

AMUX2_3V ports:

Inputs:
- I0
- I1
- select

Output:
- out

Connections:
- I0 should come from raven_spi SDO output.
- I1 should come from raven_spi reset output.
- select should come from the top-level input.
- out should connect to the top-level output.

6. Generate clean synthesizable Verilog compatible with ASIC RTL-to-GDSII flow using OpenLane.

7. Do not include behavioral code for the analog macro.

8. Only create the top-level integration module.

Generated File:

design_mux.v

---

# Prompt 5 – LEF Generation

## Objective

Generate the LEF abstract view for the analog hard macro.

### Prompt

Generate a LEF abstract view for an existing analog hard macro.

Macro name:

AMUX2_3V

Ports:

I0 input

I1 input

select input

out output

Requirements:

The macro should be treated as a hard macro:

CLASS BLOCK

Include:

- MACRO definition
- FOREIGN statement
- SIZE
- PIN definitions
- Metal routing layers

Do not create standard-cell SITE information.

Use realistic LEF syntax compatible with OpenROAD/OpenLane.

Mention that pin coordinates must match the actual GDS/Magic layout.

Generated File:

AMUX2_3V.lef

---

# Prompt 6 – Liberty Timing Model

## Objective

Generate the Liberty timing model.

### Prompt

Generate a Liberty timing model (.lib) for an analog hard macro used in an ASIC OpenLane flow.

Macro name:

AMUX2_3V

Technology:

SKY130

Purpose:

2:1 analog multiplexer hard macro

Ports:

Inputs:

I0

I1

select

Output:

out

Requirements:

Create a valid Liberty syntax file compatible with OpenSTA/OpenLane.

Include:

- library definition
- operating conditions
- voltage and temperature information
- default timing units
- cell definition for AMUX2_3V
- area information

Define pins:

I0:
direction input

I1:
direction input

select:
direction input

out:
direction output

For output pin add timing arcs:

- I0 -> out
- I1 -> out
- select -> out

Include:

- related_pin
- timing_type
- cell_rise
- cell_fall
- rise_transition
- fall_transition

Use simple placeholder timing values.

Do not include Verilog syntax.

Generate only Liberty (.lib) content.

Generated File:

AMUX2_3V.lib

---

# Prompt 7 – OpenLane Configuration

## Objective

Generate the OpenLane configuration.

### Prompt

Generate an OpenLane config.tcl file for the latest OpenLane version.

Design name:

design_mux

Technology:

SKY130

RTL files:

- design_mux.v
- raven_spi.v
- spi_slave.v

Analog macro:

AMUX2_3V

AMUX2_3V should be treated as a hard macro.

Include:

- VERILOG_FILES
- VERILOG_FILES_BLACKBOX
- EXTRA_LEFS
- EXTRA_GDS_FILES
- EXTRA_LIBS

Use:

$::env(DESIGN_DIR)

Clock port:

SCK

Set reasonable values for:

- CLOCK_PERIOD
- FP_CORE_UTIL
- PL_TARGET_DENSITY

Avoid deprecated OpenLane variables.

Generated File:

config.tcl

---

# Prompt 8 – AI-Assisted Debugging

## Objective

Use AI assistance to debug issues encountered during the OpenLane implementation flow.

### Prompt 8.1

Analyze the OpenSTA error indicating missing threshold definitions in the Liberty timing model and modify the .lib file to make it compatible with OpenSTA.

---

### Prompt 8.2

Analyze the PDN generation error indicating that the power grid pitch is too small and recommend modifications to the OpenLane configuration.

---

### Prompt 8.3

Analyze the macro placement error generated during OpenLane floorplanning and generate a valid macro.cfg file for the analog hard macro.

---

### Prompt 8.4

Analyze the final LVS report showing a net mismatch between the generated layout and schematic. Explain the likely causes and recommend debugging steps.

---

## Summary

AI assistance was used throughout the project to:

- Generate RTL modules
- Generate LEF and Liberty files
- Generate OpenLane configuration
- Debug synthesis issues
- Resolve OpenSTA timing errors
- Resolve PDN generation errors
- Fix macro placement configuration
- Analyze LVS verification results
