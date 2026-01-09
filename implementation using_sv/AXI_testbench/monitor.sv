class monitor;
    
  virtual axi_if vif; 
  transaction tr,trd;
  mailbox #(transaction) mbxms;
  mailbox #(transaction) mbxdm;
 
 
  function new( mailbox #(transaction) mbxms , mailbox #(transaction) mbxdm);
    this.mbxms = mbxms;
    this.mbxdm = mbxdm;
  endfunction
  
  
  task run();
    
    tr = new();
    
    forever 
      begin 
        
      @(posedge vif.clk);
        mbxdm.get(trd);
        
        if(trd.op == 1)
          begin
            
            tr.op     = trd.op;
            tr.awaddr = trd.awaddr;
            tr.wdata  = trd.wdata;
            @(posedge vif.bvalid);
            tr.wresp  = vif.wresp;
            @(negedge vif.bvalid);
            $display("[MON] : OP : %0b awaddr : %0d wdata : %0d wresp:%0d",tr.op, tr.awaddr, tr.wdata, tr.wresp);
            mbxms.put(tr); 
          end
        else 
          begin
            tr.op = trd.op;
            tr.araddr = trd.araddr;
            @(posedge vif.rvalid);
            tr.rdata = vif.rdata;
            tr.rresp = vif.rresp;
            @(negedge vif.rvalid);
            $display("[MON] : OP : %0b araddr : %0d rdata : %0d rresp:%0d",tr.op, tr.araddr, tr.rdata, tr.rresp);
            mbxms.put(tr); 
          end
    
      end 
  endtask
 
  
  
endclass