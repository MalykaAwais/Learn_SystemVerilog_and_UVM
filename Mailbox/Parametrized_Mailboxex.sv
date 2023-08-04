// To avoid data type mismatching between our components
// we will make our own data type

typedef mailbox #(string) Mail_box;

class component1;
  Mail_box mbx;

  task send();
    for (int i = 0; i < 3; i++) begin 
      string s = $sformatf("name_%d", i);
      #1 $display("[%t] Component1: Put %s", $time, s);
      mbx.put(s);
    end
  endtask
endclass

class component2;
  Mail_box mbxx;

  task receive();
    forever begin
      string s;
      mbxx.get(s);
      $display("[%t] Component2: Got %s ", $time, s);
    end
  endtask
endclass

// connect both at top level

module mbox();
  // Declare a global mailbox and create both components
  Mail_box m_mbx = new();
  component1 m_comp1 = new();
  component2 m_comp2 = new();

  initial begin
    // Assign both mailbox handles to components' global mailbox
    m_comp1.mbx = m_mbx;
    m_comp2.mbxx = m_mbx;

    // Start both components, where component1 keeps sending
    // and component2 keeps receiving
    fork
      m_comp1.send();
      m_comp2.receive();
    join
  end
endmodule

