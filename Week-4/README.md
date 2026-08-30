# AI-Assisted-Mixed-Signal-RTL-to-GDSII-flow-

## Overview

This repository documents the implementation of an AI-assisted mixed-signal RTL-to-GDSII design flow for a 2:1 Analog Multiplexer (AMUX2_3V) using the SKY130 Process Design Kit (PDK) and the OpenLane ASIC design flow.

The project was carried out as part of the **AI-Assisted Mixed Signal Physical Design Internship**. Instead of manually copying the reference repository, all required design files, configuration files, and supporting scripts were generated using AI-assisted prompts. The generated files were verified by executing the complete RTL-to-GDSII flow using OpenLane, followed by debugging, verification, and result analysis.

---

## Project Objective

The primary objective of this project is to demonstrate an AI-assisted methodology for recreating a complete mixed-signal RTL-to-GDSII design flow.

The project includes:

- Understanding the reference mixed-signal repository.
- Generating RTL, LEF, Liberty, and configuration files using AI prompts.
- Integrating a digital SPI controller with an analog 2:1 multiplexer hard macro.
- Executing the complete OpenLane physical design flow.
- Performing verification using OpenROAD, Magic, KLayout, and Netgen.
- Debugging errors encountered during the design flow.
- Documenting AI prompts, generated files, debugging process, and final observations.

---

## Reference Repository

Reference Repository:

https://github.com/praharshapm/vsdmixedsignalflow

---

## Technology Stack

| Component | Description |
|-----------|-------------|
| Technology Node | SKY130 |
| ASIC Flow | OpenLane |
| Physical Design Engine | OpenROAD |
| Layout Tool | Magic |
| Layout Viewer | KLayout |
| LVS Tool | Netgen |
| Hardware Description Language | Verilog |
| AI Assistant | ChatGPT / AI Coding Assistant and Claude|

---

## Project Structure

```text
AI-Assisted-Mixed-Signal-RTL-to-GDSII-Flow
│
├── README.md
├── src/
├── lef/
├── lib/
├── gds/
├── openlane/
├── prompts/
├── docs/
└── results/
```

---

## Design Flow

```
AI-Assisted Prompt Generation
            │
            ▼
RTL Generation
            │
            ▼
Analog Macro Preparation
(LEF / LIB / GDS)
            │
            ▼
OpenLane Configuration
            │
            ▼
Logic Synthesis
            │
            ▼
Floorplanning
            │
            ▼
Placement
            │
            ▼
Clock Tree Synthesis
            │
            ▼
Routing
            │
            ▼
GDSII Generation
            │
            ▼
LVS Verification
```

---

## AI-Generated Design Files

| File | Description |
|------|-------------|
| design_mux.v | Top-level mixed-signal integration module |
| raven_spi.v | Digital SPI controller wrapper |
| spi_slave.v | SPI slave interface |
| AMUX2_3V.v | Analog hard macro Verilog black-box |
| AMUX2_3V.lef | LEF abstract view of analog macro |
| AMUX2_3V.lib | Liberty timing model |
| config.tcl | OpenLane configuration |
| macro.cfg | Macro placement configuration |

---

## Physical Design Flow

The generated RTL design was processed using the OpenLane RTL-to-GDSII flow.

The following stages were successfully executed:

- RTL Linting
- Logic Synthesis
- Static Timing Analysis (STA)
- Floorplanning
- Power Distribution Network (PDN) Generation
- IO Placement
- Global Placement
- Detailed Placement
- Clock Tree Synthesis (CTS)
- Global Routing
- Detailed Routing
- GDSII Generation
- Layout Versus Schematic (LVS)

---
## Note on Floorplan, Placement, and Routing Screenshots

The floorplan, placement, and routing screenshots in this project appear visually similar due to the compact size of the mixed-signal design. The design consists of a small digital SPI controller integrated with a single analog hard macro (`AMUX2_3V`), resulting in minimal changes between the implementation stages.

Although the layouts look similar, each screenshot was captured from a different OpenLane/OpenROAD stage:

| Stage | Database Used |
|--------|---------------|
| Floorplan | `results/floorplan/design_mux.odb` |
| Placement | `results/placement/design_mux.odb` |
| Routing | `results/routing/design_mux.odb` |

The routing stage additionally includes completed signal routing and power distribution, while the floorplan and placement stages primarily show the die boundary, macro placement, and standard-cell placement. Due to the small design footprint, these visual differences are subtle.

## Results

The AI-generated design successfully completed the complete OpenLane physical design flow up to final LVS verification.

### Successfully Completed

- RTL Generation
- LEF Generation
- Liberty Generation
- OpenLane Configuration
- Logic Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis
- Routing
- Final GDSII Generation
- LVS Execution

### Final LVS Summary

- Device Count Matched
- Net Count Difference = 2
- Final LVS completed with minor net mismatch due to analog hard macro abstraction.

---

## Debugging Summary

During the implementation several issues were encountered and resolved using AI-assisted debugging.

| Issue | Resolution |
|-------|------------|
| Liberty threshold errors | Added required threshold definitions |
| PDN pitch error | Updated PDN pitch configuration |
| Macro placement configuration | Created macro placement file |
| OpenLane configuration issues | Updated configuration variables |
| LVS net mismatch | Verified device count and documented final observations |

---

## Repository Contents

### src/

Contains all AI-generated Verilog RTL files.

### lef/

Contains the LEF abstraction of the analog hard macro.

### lib/

Contains the Liberty timing model.

### gds/

Contains the analog hard macro GDSII layout.

### openlane/

Contains OpenLane configuration files.

### prompts/

Contains all AI prompts used during file generation and debugging.

### outpus/

Contains screenshots

---

## Screenshots

The repository includes screenshots of:

- RTL Generation
- OpenLane Flow Execution
- Placement
- Routing
- Final GDSII Layout
---

## Key Learning Outcomes

- Understanding mixed-signal ASIC design flow.
- AI-assisted RTL generation.
- Hard macro integration.
- OpenLane RTL-to-GDSII implementation.
- Physical design using SKY130.
- LEF and Liberty generation.
- Physical verification using LVS.
- AI-assisted debugging methodology.

---

## Conclusion

This project demonstrates the successful implementation of an AI-assisted mixed-signal RTL-to-GDSII design flow using the SKY130 PDK and OpenLane. AI-generated RTL, LEF, Liberty, and configuration files were validated through physical design and verification tools. The complete workflow, including design generation, debugging, physical implementation, and verification, illustrates the practical application of AI-assisted methodologies in modern VLSI physical design.
