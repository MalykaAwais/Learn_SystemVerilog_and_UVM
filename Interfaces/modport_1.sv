interface myBus (input clk);
logic [7:0] data;
logic enable;

// From TestBench perspective, ?data? is inp
modport TB (input data, clk, output enable);

// From DUT perspective, ?data? is output an
modport DUT (output data, input enable, clk);
endinterface

