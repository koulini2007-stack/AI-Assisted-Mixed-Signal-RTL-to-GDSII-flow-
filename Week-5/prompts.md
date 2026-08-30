# AI-Assisted Prompts – Week 5 Task 4

This document contains the AI prompts used for Week 5 Task 4: Design and integrate a new double-height 2:1 analog MUX to replace the existing AMUX2_3V placeholder.

## Phase 1 – Understanding the Existing Repository

### Prompt 1
Analyze the existing project repository and identify the required files, existing AMUX2_3V views, source files, generated files, and recommended directory structure.

## Phase 2 – Transistor-Level Circuit

### Prompt 2
Analyze the AMUX2_3V circuit architecture and determine the transistor-level implementation required for a 2:1 analog MUX.

## Phase 3 – SKY130 Model Verification

### Prompt 3
Determine and verify the exact SKY130A transistor models required for the NMOS and PMOS devices used in the MUX.

## Phase 4 – Xschem Schematic

### Prompt 4
Create the complete transistor-level design plan for the AMUX2_3V MUX using Xschem and SKY130A devices.

### Prompt 5
Generate the complete Xschem schematic for the transistor-level 2:1 analog MUX.

## Phase 5 – Pre-Layout Simulation

### Prompt 6
Create an ngspice testbench to verify both select states of the MUX.

### Prompt 7
Verify the simulation waveforms for:

- I0
- I1
- select
- select_b
- out

and confirm:

select = 0 → out follows I0

select = 1 → out follows I1

## Current Status

The work completed so far includes:

- Understanding the Week 5 task
- Studying the existing MUX
- Designing the transistor-level MUX
- Selecting SKY130 devices
- Creating the Xschem schematic
- Generating the simulation netlist
- Running ngspice simulation
- Verifying both select states
- Obtaining simulation waveforms

## Remaining Planned Phases

The following phases will be completed in subsequent stages:

- Existing MUX performance comparison
- AI-assisted Magic layout generation
- Iterative layout correction
- Magic DRC
- Layout extraction
- Netgen LVS
- Post-layout ngspice simulation
- Pre-layout/post-layout comparison
- Macro view generation
- OpenLane integration
- Complete PNR
- Final DRC and LVS
- Final results and comparison
