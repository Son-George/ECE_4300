Stage 1 Fetch
IN the first stage we recieve the 32-bit address from either memory or our next memory instruction, then we send that to instruction memory that turns it into an instruction and we save that instruction in the latch to be send to the decoder in the next clock cycle.

Stage 2 Decoder
The decoder get the instruction memory the fetch latch and gets the Wrrite back instruction, ALUOp, ALUSrc, and the RegDst from the decoder control. Then it trieves the 2 read data base on the instruction memory into the decoder latch.

Stage 3 Execute
The execute increases the next instruction in memory based on the sign extend from the decoder. Also in the execute we also conduct our operation of ALU base on the sign-extended output from the decoder. and send the ruslt to the execute branch. 

Stage 4 Memory
In the memory stage, we get the Address and the data that may or may not be written.  and senf yo the WB latch.

Stage 5 Write back
In the write back we get the signal of either fetching the next instruction in memory or move the next instruction found in the execute stage. Then we send themux value of the write data registr and we either write it into the register.
