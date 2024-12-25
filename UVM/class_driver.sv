class Driver;

  virtual adder_interface adder_if;
//  virtual clock_interface clock_if;

  mailbox gen_drv_box;
  //event RUN_THE_MONITOR;
  
  task run();
    forever 
      begin
        Packet item;
        gen_drv_box.get(item);
        $display("DRIVER CLASS: PACKET Received from the Generator");
// Values coming from mailbox from generator class are now copied in item, before that it was NULL.
        item.print("DRIVER CLASS");
       @(posedge adder_if.tb_clk);
    
// WE HAVE TO FEED VALUES TO THE Adder DUT AT exactly posedge
        //$display("Again PRINT ITEM VALUES after posedge");
        //item.print("DRIVER CLASS");
        adder_if.rstn = item.rstn;
	    adder_if.a = item.a;
	    adder_if.b = item.b;
        adder_if.sum = item.sum;
        adder_if.carry = item.carry;
    
    // HERE IF WE USE NON BLOCKING STATEMENTS, the interface values will show x and then will update values after 1 clock cycle. But if we use blocking statements here. It will update in the same clock cycle.
        $display("DRIVER CLASS: PACKET Sent to Interface");
        //-> RUN_THE_MONITOR;
	    
        end
  endtask
endclass






