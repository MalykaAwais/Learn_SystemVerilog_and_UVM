// Purpose of Generator Class: 1) How many transaction packets will be produced
//                             2) Fill the packets with values
//                             3) Put/enclose the item or packet in the mailbox

class generator;
  int loop = 10;
  mailbox gen_drv_box;
  event driver_work_is_done;
  task run();
    for(int i = 0; i<loop; i++)
      begin 
    // First produce class handle and then instance of Packet
        Packet item = new();
        item.randomize(); // Fill with random values
        $display("----PACKET GENERATION: ITERATION #%0d----", i+1);
        $display("GENERATOR CLASS: New ITEM is generated and filled with Random values");
        item.print("GENERATOR CLASS");
        gen_drv_box.put(item);
        $display("GENERATOR CLASS: Generator has enclosed the item in mailbox");
        @(driver_work_is_done);   // This event waits for the packet to be received by the driver. Until then no new packet is generated
        end
  endtask
endclass

