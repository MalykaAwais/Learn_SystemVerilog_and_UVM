class env;
  generator g0;
  Driver d0;
  monitor m0;
  scoreboard s0;
  mailbox gen_drv_box;
  mailbox monitor_scb_box;
  event  driver_work_is_done;
  event RUN_THE_MONITOR;
  virtual adder_interface adder_if;
//  virtual clock_interface clock_if;
  function new();
    g0 = new;
    d0 = new;
    m0 = new;
    s0 = new;
    gen_drv_box = new;
    monitor_scb_box = new;

  endfunction
  task run();   // Virtual task used here because of heirarchy of classes and their functions
// As driver and monitor interact with the same interface
// so connect them by assigning both to same interface
    d0.adder_if = adder_if;
    m0.adder_if = adder_if;

    g0.gen_drv_box = gen_drv_box;
    d0.gen_drv_box = gen_drv_box;

    m0.monitor_scb_box = monitor_scb_box;
    s0.monitor_scb_box = monitor_scb_box;

    g0.driver_work_is_done = driver_work_is_done;
    m0.driver_work_is_done = driver_work_is_done;
  
   // d0.RUN_THE_MONITOR = RUN_THE_MONITOR;
   // m0.RUN_THE_MONITOR = RUN_THE_MONITOR;
    
    fork
      
      g0.run();
      d0.run();
      m0.run();
      s0.run();
    
    join_any
  
  endtask

endclass

