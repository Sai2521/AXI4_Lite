Introduction to AXI4-Lite (Advanced Extensible Interface)
Advanced eXtensible Interface 4 (AXI4) is a family of buses defined as part of the fourth generation of the ARM Advanced Microcontroler Bus Architectrue (AMBA) standard. AXI was first introduced with the third generation of AMBA, as AXI3, in 1996.

The AMBA specification defines 3 AXI4 protocols:

AXI4: A high performance memory mapped data and address interface. Capable of Burst access to memory mapped devices.
<br>
AXI4-Lite: A subset of AXI, lacking burst access capability. Has a simpler interface than the full AXI4 interface.
<br>
AXI4-Stream: A fast unidirectional protocol for transfering data from master to slave.
///////////////////////////////////////////////////////////////////////
<br>
AXI4-Lite Interface Signals
The AXI4-Lite interface consists of five channels: Read Address, Read Data, Write Address, Write Data, and Write Response. An AXI4 read transaction using the Read Address and Data channels is shown in figure 
<br>
1. Similarly an AXI4 write transaction using the Write Address, Data, and Response channels is shown in figure 
<br>
2. Note that these figures depict burst transfers, which AXI4-Lite is incapable of.

https://www.realdigital.org/img/cede9613613d73fe3cf53fde7c215b73.png
https://www.realdigital.org/img/01b29efbcdc24d7feadbbb7c33cab5c5.png

////////////////////////////////////////////////////////////////////////
AXI4-Lite Read Transaction
Below, the sequence for an AXI4-Lite read is shown:

A description of the events in figure 3 follows:

1.The Master puts an address on the Read Address channel as well as asserting ARVALID,indicating the address is valid, and RREADY, indicating the master is ready to receive data from the slave.<br>
2.The Slave asserts ARREADY, indicating that it is ready to receive the address on the bus.<br>
3.Since both ARVALID and ARREADY are asserted, on the next rising clock edge the handshake occurs, after this the master and slave deassert ARVALID and the ARREADY, respectively. (At this point, the slave has received the requested address).<br>
4.The Slave puts the requested data on the Read Data channel and asserts RVALID, indicating the data in the channel is valid. The slave can also put a response on RRESP, though this does not occur here.<br>
>Since both RREADY and RVALID are asserted, the next rising clock edge completes the transaction. RREADY and RVALID can now be deasserted.

https://www.realdigital.org/img/c1fe3809e14e48fafe99944ac3b6c04c.png

////////////////////////////////////////////////////////////////////////

AXI4-Lite Write Transaction
Below, the sequence for an AXI4-Lite write is shown:

A description of the events in figure 4 follows:

1.The Master puts an address on the Write Address channel and data on the Write data channel. At the same time it asserts AWVALID and WVALID indicating the address and data on the respective channels is valid. BREADY is also asserted by the Master, indicating it is ready to receive a response.<br>
2.The Slave asserts AWREADY and WREADY on the Write Address and Write Data channels, respectively.<br>
3.Since Valid and Ready signals are present on both the Write Address and Write Data channels, the handshakes on those channels occur and the associated Valid and Ready signals can be deasserted. (After both handshakes occur, the slave has the write address and data)<br>
4.The Slave asserts BVALID, indicating there is a valid reponse on the Write response channel. (in this case the response is 2’b00, that being ‘OKAY’).<br>
5.The next rising clock edge completes the transaction, with both the Ready and Valid signals on the write response channel high.

https://www.realdigital.org/img/3da7b71713be69a857fceea56ab2aeff.png


Note: The Handshakes on the Write Address and Write Data channel do not neccessarily occur simultaneously (as they do in the shown transaction). However, the AXI4 specification states that both must occur before the slave can send a write reponse. Both Write Address and Write Data handshakes can occur independently or simultaneously and no order is enforced, only that both must occur to complete the transaction.