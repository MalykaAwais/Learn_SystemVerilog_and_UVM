module top_level (ms_if tif);
// Pass the "master" modport to master
master m0 (tif.master);

// Pass the "slave" modport to slave
slave s0 (tif.slave);
endmodule

