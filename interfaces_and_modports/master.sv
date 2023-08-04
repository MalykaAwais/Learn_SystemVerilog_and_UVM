// This module accepts an interface with modport ?master?
// Master sends transactions in a pipelined format

// CLK  1 2 3 4 5 6

// ADDR A0 Al A2 A3 A0 Al

// DATA    D0 D1 D2 D3 D4


module master ( ms_if.master mif);
always @ (posedge mif.clk) begin

// If reset is applied, set addr and data to defaul
if (! mif.rstn) begin

mif.addr <= 0;

mif.data <= 0;

//1 Else increment addr, and assign data accordingly
end else begin
// Send new addr and data only if slave is ready
if (mif.sready) begin
mif.addr <= mif.addr + 1;
mif.data <= (mif.addr * 4);

// Else maintain current addr and data
end else begin
mif.addr <= mif.addr;
mif.data <= mif.data;
end
end
end
endmodule

