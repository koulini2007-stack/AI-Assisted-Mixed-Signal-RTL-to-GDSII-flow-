// AI generated SPI slave module
// Compatible with ASIC RTL-to-GDSII OpenLane flow


module spi_slave(

    input RST,
    input SCK,
    input SDI,
    input CSB,
    output reg data_out
);
reg shift_reg;
// SPI shifting logic
always @(posedge SCK or posedge RST)
begin
    if(RST)
    begin
        shift_reg <= 1'b0;
        data_out <= 1'b0;
    end
    else if(!CSB)
    begin
        shift_reg <= SDI;
        data_out <= shift_reg;
    end
end
endmodule
