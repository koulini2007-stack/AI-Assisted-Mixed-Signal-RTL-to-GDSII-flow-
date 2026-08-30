# Week 5 – Design of a Double-Height 2:1 Analog MUX

## Overview

Week 5 focuses on designing a new transistor-level double-height 2:1 analog multiplexer (MUX) using the SKY130 technology.

The objective is to replace the existing placeholder `AMUX2_3V` macro with a fresh analog MUX implementation. The design is first verified at the schematic and circuit-simulation level before proceeding to physical layout and digital physical-design integration.

The work performed so far includes transistor-level schematic design using Xschem, generation of the simulation netlist, and functional verification using ngspice with SKY130 transistor models.

---

## Week 5 Task

The assigned task is to:

- Design a new double-height 2:1 analog MUX.
- Replace the existing placeholder `AMUX2_3V`.
- Create and verify the transistor-level schematic using SKY130 models.
- Simulate both select states using ngspice.
- Generate a fresh Magic layout with the required dimensions and connectivity.
- Perform Magic DRC until zero violations.
- Extract the layout and perform Netgen LVS.
- Perform post-layout ngspice simulation with parasitic extraction.
- Compare pre-layout and post-layout functionality, delay, rise/fall time, and area.
- Generate reusable macro views such as LEF, GDS, SPICE, Verilog black-box, Liberty, and DEF where applicable.
- Integrate the final macro into the OpenLane physical-design flow.
- Verify placement, routing, DRC, and LVS.

The current Week 5 progress has reached the **Xschem schematic and ngspice simulation stage**.

---

## Objective

The main objective is to develop and verify a transistor-level 2:1 analog multiplexer using the SKY130 technology before proceeding to physical layout and RTL-to-GDSII integration.

Specific objectives are:

- Understand the transistor-level implementation of an analog MUX.
- Use SKY130 device models for circuit simulation.
- Create the schematic using Xschem.
- Verify both MUX select states.
- Generate simulation waveforms using ngspice.
- Establish correct functionality before starting physical layout.

---

## Design Concept

The circuit is a 2:1 analog multiplexer.

It has two analog inputs:

- `I0`
- `I1`

and a select input:

- `select`

The selected signal appears at:

- `out`

Conceptually:

```text
             I0 ───────┐
                       │
                       ├────── out
                       │
             I1 ───────┘
                       ▲
                       │
                    select

## Tools Used

| Tool / Technology | Purpose |
|---|---|
| **Xschem** | Creating the transistor-level schematic of the 2:1 analog MUX |
| **ngspice** | Simulating and verifying the transistor-level MUX |
| **SKY130 PDK** | Providing the MOS transistor models and technology files |
| **SKY130 SPICE Models** | Modeling transistor behavior during ngspice simulation |
| **Linux / Ubuntu** | Development and simulation environment |
| **Git** | Version control and tracking project changes |
| **GitHub** | Project documentation, file storage, and progress tracking |
| **AI Assistant** | Design guidance, circuit analysis, simulation debugging, and documentation |
