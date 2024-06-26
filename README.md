<p align="center">
  <img src="https://s8.uupload.ir/files/processor_tg3o.gif" />
</p>

# Processor

This is the implementation of a very simple processor using verilog. Different parts of the processor are described in detail.

## Description

This processor has 3 modules:

1. A Register File containing 4 arrays of 512 bits
2. An Arithmetic Logic Unit that is capable of Addition and Multiplication
3. A Memory with depth 512 and width 32 bits

This processor should perform these instructions:

1. Loading from Memory to a Register
2. Storing to Memory from a Register
3. Addition in ALU
4. Multiplication in ALU

## Implementation Details

1. Register File:

+ Inputs: clk - reset - write_enable - address1 - address2 - data_in
+ Output: data_out1 - data_out2
---
+ Load: if *write_enable* is active, *data_in* is saved to register pointed by *address1*
+ Store: values of registers pointed by *address1* and *address2* goes through *data_out1* and *data-out2* (there are two outputs, because ALU gets two inputs at a time)

![RegisterFile Module](https://s8.uupload.ir/files/register_file_l5hu.png)

2. Memory:

+ Inputs: clk - write_enable - read_enable - address - data_in
+ Output: data_out
---
+ Write: if *write_enable* is active, *data_in* is saved to memory address *address*
+ Read: if *read_enable* is active, value of memory address *address* goes through *data_out*

![Memory Module](https://s8.uupload.ir/files/memory_r5pm.png)

3. ALU:

+ Inputs: operand1 - operand2 - operation
+ Outputs: result
---
+ ALU does the operation on *operand1* and *operand2* and puts the answer in *result*
+ *operation* is **0** for Addition and it is **1** for Multiplication

![ALU Module](https://s8.uupload.ir/files/alu_qjy6.png)

4. Processor:

+ Inputs: clk - reset - reg_write_enable - mem_write_enable - mem_read_enable - reg_address1 - reg_address2 - alu_op - mem_address - mem_data_in
+ Outputs: mem_data_out
---
+ The Processor creates instances of Register File, ALU and Memory ann connects them together.

![Processor Module](https://s8.uupload.ir/files/processor_4qk.png)

5. TestBench:

+ Here is the TestBench that includes some operations and instructions:

![TestBench Module](https://s8.uupload.ir/files/tb_vdqz.png)

## How to Run

To run the application firt you need to download and install **iverilog** (short for Icarus Verilog) from this [this link](https://bleyer.org/icarus/).

Then you can compile the project by running this command:

```
iverilog -o out TB.v Processor.v Memory.v ALU.v RegisterFile.v
```

In the last step, run and see the results of monitoring by running this command:

```
vvp out
```

## Author

+ [Amirhossein Souri](https://github.com/Amir14Souri)
