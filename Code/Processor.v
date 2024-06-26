module Processor (
    input clk, reset, reg_write_enable, mem_write_enable, mem_read_enable,
    input [1:0] reg_address1, reg_address2, alu_op,
    input [8:0] mem_address,
    input [31:0] mem_data_in,
    output [31:0] mem_data_out);

    wire [511:0] reg_data_out1;
    wire [511:0] reg_data_out2;
    wire [511:0] alu_result;
    reg [511:0] reg_data_in;

    RegisterFile register_file (clk, reset, reg_write_enable, reg_address1, reg_address2, reg_data_in, reg_data_out1, reg_data_out2);

    ALU alu (reg_data_out1, reg_data_out2, alu_op, alu_result[1023:0]);

    Memory memory (clk, mem_write_enable, mem_read_enable, mem_address, mem_data_in, mem_data_out);

    always @(alu_result)
        reg_data_in = alu_result[511:0];

    always @(mem_data_out)
        reg_data_in = mem_data_out[31:0];

endmodule