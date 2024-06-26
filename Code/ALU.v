module ALU (
    input [511:0] operand1, operand2,
    input [1:0] operation,
    output reg [1023:0] result);

    // operation:
    // 00: addition | 01: multiplication

    always @(*) begin
        case (operation)
            2'b00: result = operand1 + operand2;
            2'b01: result = operand1 * operand2;
            default: result = 1024'b0;
        endcase
    end
endmodule