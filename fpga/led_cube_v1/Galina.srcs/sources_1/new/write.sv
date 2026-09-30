`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2022 12:45:16 PM
// Design Name: 
// Module Name: write
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none
module write(
    input wire clk, //5mhz 
    input wire start, 
    input wire rst, 
    input wire [0:15] data_in, 
    output logic done_out,
    output logic data_out, //SER
    output logic data_clk, //SRCKK
    output logic data_clr, //SRRST
    output logic sr_wr //SRCLK / Latch sync
    );
    reg [3:0] index;
    typedef enum {idle, init, write, done} states;
    states state; 
    assign data_clk = (state == write) ? !clk: 0;
    assign data_out = (state == write) ? data_in[index] : 0;
    always_ff @(posedge clk) begin 
        if(rst || start) begin 
            index <= 0;
            data_clr <= 0;
            sr_wr <= 0;
            done_out <= 0;
            state <= init;
        end else begin
            if(state == init) begin
                data_clr <= 1;
                state <= write;
            end else if (state == write) begin
                if(index == 15) begin 
                    sr_wr <= 1;
                    done_out <= 1;
                    state <= done;
                end else begin 
                    index <= index + 1;
                end
            end else if (state == done) begin 
                sr_wr <= 0;
                done_out <= 0;
            end 
        end 
    end 
endmodule
`default_nettype wire