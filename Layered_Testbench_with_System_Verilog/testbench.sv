// Code your testbench here
// or browse Examples
`include "Adder_Interface.sv"
//`include "clock_interface.sv"
`include "class_packet.sv"
`include "class_generator.sv"
`include "class_driver.sv"
`include "class_monitor.sv"
`include "class_scoreboard.sv"
`include "class_environment.sv"
`include "class_test.sv"

module test_bench();
  
  bit tb_clk;

//clock_interface  m_clk_if  ();
  adder_interface m_adder_if (tb_clk);
  Adder_Design uut (m_adder_if);
  
  test t0;
  initial tb_clk = 0;
  always #10 tb_clk = ~tb_clk;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    t0 = new;
    t0.e0.adder_if = m_adder_if;

    t0.run();

// Once the main stimulus is over, wait for some time
// until all transactions are finished and then end
// simulation. Note that $finish is required because
// there are components that are running forever in
// the background like clk, monitor, driver, etc
	$finish;

end
endmodule
