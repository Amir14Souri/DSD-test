module TB;

    reg clk, reset, reg_write_enable, mem_write_enable, mem_read_enable;
    reg [1:0] reg_address1, reg_address2, alu_op;
    reg [8:0] mem_address;
    reg [31:0] mem_data_in;
    wire [31:0] mem_data_out;
    wire [1023:0] alu_result;

    Processor processor (clk, reset, reg_write_enable, mem_write_enable, mem_read_enable, reg_address1, reg_address2,
    alu_op, mem_address, mem_data_in, mem_data_out);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 0; reg_write_enable = 0; mem_write_enable = 0; mem_read_enable = 0;

        #10;
        mem_write_enable = 1;
        mem_address = 9'b000000001;
        mem_data_in = 32'h0000000a;
        #10;
        mem_address = 9'b000000101;
        mem_data_in = 32'h00000005;
        #10;
        mem_address = 9'b000001010;
        mem_data_in = 32'h00000014;
        #10;
        mem_write_enable = 0;

        #10;
        mem_read_enable = 1;
        mem_address = 9'b000000001;
        #10;
        reg_write_enable = 1;
        reg_address1 = 2'b00;
        #10;
        mem_address = 9'b000000101;
        #10;
        reg_address1 = 2'b01;
        #10;
        mem_address = 9'b000001010;
        #10;
        reg_address1 = 2'b10;
        #10;
        reg_write_enable = 0;
        mem_read_enable = 0;

        // Addition
        #10;
        reg_address1 = 2'b00;
        reg_address2 = 2'b01;
        alu_op = 2'b00;
        #10;

        reg_write_enable = 1;
        reg_address1 = 2'b11;
        #10;
        reg_write_enable = 0;

        // Multiplication
        #10;
        reg_address1 = 2'b10;
        reg_address2 = 2'b11;
        alu_op = 2'b01;
        #10;

        reg_write_enable = 1;
        reg_address1 = 2'b11;
        #10;
        reg_write_enable = 0;

        #10 $finish;
    end

    initial begin
        $monitor("Time: %0d, reg_addr1: %b, reg_addr2: %b, mem_addr: %h, mem_data_in: %h, mem_data_out: %h, alu_op: %b",
                 $time, reg_address1, reg_address2, mem_address, mem_data_in, mem_data_out, alu_op);
    end
endmodule
