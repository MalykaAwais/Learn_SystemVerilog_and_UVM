class monitor;
  //event RUN_THE_MONITOR;
  mailbox monitor_scb_box;
  virtual adder_interface adder_if;
  event driver_work_is_done;
  
  task run();
    forever begin
      Packet item = new();
      //@(RUN_THE_MONITOR);
      begin
        //$display("MONITOR CLASS: Going to receive values from Interface");
        //$display("PRINTING VALUES BEFORE POSEDGE - result in dut not calculated yet\n");
        //$display("In MONITOR --- adder_if.rstn = %d, adder_if.a = %d, adder_if.sum = %d", adder_if.rstn, adder_if.a, adder_if.sum );
        @(posedge adder_if.tb_clk);
        #1;
        item.rstn = adder_if.rstn;
        item.a = adder_if.a;
        item.b = adder_if.b;
        item.sum = adder_if.sum;
        item.carry = adder_if.carry;
        $display("MONITOR CLASS: After receiving values from interface");
        item.print("MONITOR CLASS");
        $display("MONITOR CLASS: Enclosing item in Mailbox and sending to scoreboard");
        monitor_scb_box.put(item);
        -> driver_work_is_done;
      end
    end
  endtask
endclass

