# Week 5 – OpenLane Integration and Analog Macro Implementation

## Overview

Week 5 focused on continuing the RTL-to-GDSII implementation of the mixed-signal design using the OpenLane flow.

The main objective was to integrate the `AMUX2_3V` analog hard macro into the digital design flow and prepare the required physical design files and OpenLane configuration for implementation.

The work involved understanding the OpenLane directory structure, configuring the analog macro as a hard macro, preparing the required LEF and Liberty files, and debugging issues encountered during the physical design flow.

---

## Objectives

- Understand the OpenLane RTL-to-GDSII flow.
- Integrate the `AMUX2_3V` analog hard macro into the design.
- Use a Verilog black-box representation for the analog macro.
- Provide LEF information for physical implementation.
- Provide a Liberty timing abstraction for the analog macro.
- Configure OpenLane for macro integration.
- Understand floorplanning, placement, routing, and power distribution.
- Debug OpenLane configuration and physical-design issues.
- Inspect the generated layout and implementation results.

---

## Tools Used

- OpenLane
- OpenROAD
- Yosys
- Magic
- KLayout
- SKY130 PDK
- Docker
- Git/GitHub
- AI-assisted debugging

---

## Design Under Consideration

### AMUX2_3V

`AMUX2_3V` is treated as an analog hard macro in the digital physical-design flow.

The macro contains the following interface:

| Port | Type | Description |
|------|------|-------------|
| I0 | Input | First input |
| I1 | Input | Second input |
| select | Input | Selection control |
| out | Output | Macro output |

The analog behavior is not implemented using RTL logic. Instead, the macro is represented using a black-box Verilog model and physical/timing abstractions required by the OpenLane flow.

---

## Files Prepared

The following files were prepared for integration:

- Verilog black-box model
- LEF file
- Liberty timing model
- OpenLane configuration
- Macro configuration
- RTL source files
- Generated implementation outputs

---

## OpenLane Flow

The implementation follows the general flow:

```text
RTL
 |
 v
Synthesis
 |
 v
Floorplanning
 |
 v
Macro Integration
 |
 v
Placement
 |
 v
Clock Tree Synthesis
 |
 v
Routing
 |
 v
Power Distribution Network
 |
 v
GDSII
 |
 v
DRC / Layout Verification
