class generator;
  
  transaction tr;
  mailbox #(transaction) mbxgd;
  
  event done; ///gen completed sending requested no. of transaction
  event sconext; ///scoreboard complete its work
 
   int count = 0;
  
  function new( mailbox #(transaction) mbxgd);
    this.mbxgd = mbxgd;   
    tr =new();
  endfunction
  
    task run();
    for(int i=0; i < count; i++) 
    begin
      assert(tr.randomize) else $error("Randomization Failed");
      $display("[GEN] : OP : %0b awaddr : %0d wdata : %0d araddr : %0d",tr.op, tr.awaddr, tr.wdata, tr.araddr);
      mbxgd.put(tr);
      @(sconext);
    end
    ->done;
  endtask
  
   
endclass