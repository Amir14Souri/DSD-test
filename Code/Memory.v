module Memory (
    input clk, write_enable, read_enable,
    input [8:0] address,
    input [31:0] data_in,
    output reg [31:0] data_out);

    reg [31:0] memory [511:0];

    always @(posedge clk) begin
        if (write_enable)
            memory[address] <= data_in;
        
        if (read_enable)
            data_out <= memory[address];
    end
endmodule