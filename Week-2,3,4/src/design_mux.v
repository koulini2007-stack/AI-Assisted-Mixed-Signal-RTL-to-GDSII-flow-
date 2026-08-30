module design_mux(

    output out,

    input select,
    input RST,
    input SCK,
    input SDI,
    input CSB,
    input trap,
    input mask_rev_in

);

//--------------------------------------------------------------------------
// Internal Connections
//--------------------------------------------------------------------------

wire I0;
wire I1;

//--------------------------------------------------------------------------
// Digital SPI Controller
//--------------------------------------------------------------------------

raven_spi digital_control(

    .RST(RST),
    .SCK(SCK),
    .SDI(SDI),
    .CSB(CSB),

    .trap(trap),
    .mask_rev_in(mask_rev_in),

    .SDO(I0),
    .reset(I1)

);

//--------------------------------------------------------------------------
// Analog 2:1 Multiplexer Hard Macro
//--------------------------------------------------------------------------

AMUX2_3V analog_mux(

    .I0(I0),
    .I1(I1),

    .select(select),

    .out(out),
    .VPWR(VPWR),
    .VGND(VGND)

);

endmodule
