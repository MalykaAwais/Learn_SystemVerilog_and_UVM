//Takes packet from monitor class and compares result with DUT generated answer
class scoreboard;

  mailbox monitor_scb_box;
  task run();
    forever 
      begin
        Packet item_for_comparison = new();
        Packet actual_item; 

	    monitor_scb_box.get(actual_item);
        $display("SCOREBOARD CLASS");
        actual_item.print("SCOREBOARD CLASS");
	    item_for_comparison.copy(actual_item);
        if(!item_for_comparison.rstn) begin
          item_for_comparison.carry = 0;
          item_for_comparison.sum = 0;
        end
        else
	      {item_for_comparison.carry, item_for_comparison. sum} = item_for_comparison.a + item_for_comparison.b;

        if(item_for_comparison.carry != actual_item.carry)
          $display("[%t] SCOREBOARD Error, mismatch between carry values, item for comparison = %d, actual item = %d", $time, item_for_comparison.carry,actual_item.carry);
        else 
        
        $display("[%t] SCOREBOARD Pass, No mismatch between carry values found, item for comparison = %d, actual item = %d", $time, item_for_comparison.carry,actual_item.carry);

        if(item_for_comparison.sum != actual_item.sum)
	      $display("[%t] SCOREBOARD Error, mismatch between sum values, item for comparison = %d, actual item = %d", $time, item_for_comparison.sum,actual_item.sum);
	    else 
        
          $display("[%t] SCOREBOARD Pass, No mismatch between sum values found, item for comparison = %d, actual item = %d", $time, item_for_comparison.sum,actual_item.sum);
        end
  endtask
endclass

