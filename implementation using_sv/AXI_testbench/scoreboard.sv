class scoreboard;
  
  transaction tr,trd;
  event sconext;
 
  
  mailbox #(transaction) mbxms;
 
 
  
  bit [31:0] temp;
  bit [31:0] data[128] = '{default:0};
 
  
 
  
  function new( mailbox #(transaction) mbxms);
    this.mbxms = mbxms;
  endfunction
  
  
  task run();
    
    forever 
      begin  
        
      mbxms.get(tr);
      
        if(tr.op == 1)
              begin
                $display("[SCO] : OP : %0b awaddr : %0d wdata : %0d wresp : %0d",tr.op, tr.awaddr, tr.wdata, tr.wresp);
                if(tr.wresp == 3)
                $display("[SCO] : DEC ERROR");  
                else begin
                data[tr.awaddr] = tr.wdata;
                $display("[SCO] : DATA STORED ADDR :%0d and DATA :%0d", tr.awaddr, tr.wdata);
                end
              end
            else
              begin
                $display("[SCO] : OP : %0b araddr : %0d rdata : %0d rresp : %0d",tr.op, tr.araddr, tr.rdata, tr.rresp);
                temp = data[tr.araddr];
                if(tr.rresp == 3)
                  $display("[SCO] : DEC ERROR");
                else if (tr.rresp == 0 && tr.rdata == temp)
                  $display("[SCO] : DATA MATCHED");
                else
                  $display("[SCO] : DATA MISMATCHED");
              end
        $display("----------------------------------------------------");
        ->sconext;
    end
  endtask
  
  
endclass