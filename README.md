AXI4 Lite
Five channels make up the AXI4-Lite interface: Write Address, Write Data, Write Response, Write Address, and Write Address.

The key features of AXI4 lite are:

Each transaction burst length is 1.
 data bus width is 32 bits or 64 bits and all transactions are the same width as the data bus. 
All accesses are non – modifiable and non- bufferable hence AxCACHE is 0000.
Exclusive accesses are not supported


////////////////////////////////////////////////////////////////////
AXI4-Lite Read Transaction
Below, the sequence for an AXI4-Lite read is shown:

In addition to putting an address on the Read Address channel, the Master also asserts that the address is valid (ARVALID) and that it is prepared to accept data from the slave (READY).
To indicate that it is prepared to accept the address on the bus, the Slave claims ARREADY.
Since both ARVALID and ARREADY are asserted, the handshake takes place on the subsequent rising clock edge. Subsequently, the slave and master deassert ARREADY and ARVALID, respectively. (At this juncture, the desired address has reached the slave).
The required data is sent to the Read Data channel by the Slave, who then asserts RVALID to show that the data in the channel is legitimate. It is also possible for the slave to respond on RRESP, but this does not happen in this case.
The transaction is finished on the subsequent rising clock edge since both RREADY and RVALID are asserted. At this point, RREADY and RVALID can be released.
///////////////////////////////////////////////////////////////////////
AXI4-Lite Write Transaction
Below, the sequence for an AXI4-Lite write is shown:

A description of the events in figure 4 follows:

The Write Address channel receives addresses from the Master, whereas the Write Data channel receives data. It also states that the address and data on the corresponding channels are legitimate by asserting AWVALID and WVALID. The Master also states that it is BREADY, meaning that it is prepared to hear back.
On the Write Address and Write Data channels, the Slave asserts AWREADY and WREADY, respectively.
The Write Address and Write Data channels both have Valid and Ready signals, thus when those signals are de-asserted, the handshakes on those channels take place. (The slave has the write address and data after both handshakes.)
A valid response is present on the Write response channel, as indicated by the Slave’s assertion of BVALID. (In this instance, the answer is 2’b00, which stands for “OKAY”).
When the subsequent rising clock edge occurs, the transaction is finished and the Ready and Valid signals are both high on the write response channel.
////////////////////////////////////////////////////////////////

Comparison: AXI-Full vs AXI-Lite
Specifications

AXI Infrastructure has AXI Full and AXI Lite protocols implemented in VHDL and fully compatible with AMBA Specifications.
AXI Full and AXI Lite Interconnect are implemented in Shared access mode (Area Optimized).
Configurable Multiple no of master devices and slave devices, depending on resources available on FPGA.
AXI Full and AXI Lite interconnects also Support Read-only and Write-only Master devices and Slave devices resulting in reduced resource utilization.
The code is written in generic VHDL so that it can be ported to a variety of FPGAs.
Support for multiple clock domains.
User logic can be connected to AXI Masters and AXI Slaves with a simple interface.
Supports different interface data widths 8,16,32,64..512. And Address widths 8,16,32.