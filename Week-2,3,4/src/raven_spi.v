// AI generated SPI controller
// Compatible with OpenLane RTL-to-GDSII flow

module raven_spi(

    input RST,
    input SCK,
    input SDI,
    input CSB,
    input trap,
    input mask_rev_in,

    output SDO,
    output reset

);


wire spi_data;


// SPI slave instance

spi_slave spi_inst(

    .RST(RST),
    .SCK(SCK),
    .SDI(SDI),
    .CSB(CSB),

    .data_out(spi_data)

);


// Output connections

assign SDO = spi_data;


// Reset generation logic

assign reset = RST | trap | mask_rev_in;


endmodule
