module RegisterFile (
    input clk, reset, write_enable,
    input [1:0] address1, address2,
    input [511:0] data_in,
    output reg [511:0] data_out1, data_out2);

    reg [511:0] registers [3:0];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            registers[0] <= 512'b0;
            registers[1] <= 512'b0;
            registers[2] <= 512'b0;
            registers[3] <= 512'b0;
        end else if (write_enable)
            registers[address1] <= data_in;
    end

    always @(*) begin
        data_out1 = registers[address1];
        data_out2 = registers[address2];
    end
endmodule