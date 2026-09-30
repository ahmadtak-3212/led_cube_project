`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2022 01:37:15 PM
// Design Name: 
// Module Name: pwm
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
module pwm(
        input wire clk, // 5mhz
        input wire rst,
        input wire start,
        input wire [23:0] pixel,
        output logic done_out,
        output logic pwm_red_out,
        output logic pwm_green_out,
        output logic pwm_blue_out
    );
    parameter max_cycles = 1302 - 12;
    
    typedef enum {idle, pwm, done} states;
    states state;
    logic [15:0] count;
    logic [7:0] pwm_count;
    always_ff @(posedge clk) begin
        if(rst || start) begin
            count <= 0;
            pwm_count <= 0;
            pwm_red_out <= 0;
            pwm_green_out <= 0;
            pwm_blue_out <= 0;
            done_out <= 0;
            state <= pwm;
        end else begin
            if(state == pwm) begin 
                pwm_count <= pwm_count + 1;
                if(count >= max_cycles) begin
                    done_out <= 1;
                    pwm_red_out <= 0;
                    pwm_green_out <= 0;
                    pwm_blue_out <= 0;
                    state <= done; 
                end else begin 
                    count <= count + 1; 
                end 
                if(pwm_count < pixel[7:0]) begin
                    pwm_red_out <= 0; //Active Low 0 here
                end else begin
                    pwm_red_out <= 1;
                end                
                if(pwm_count < pixel[15:8]) begin
                    pwm_green_out <= 0; //Active Low 0 here
                end else begin
                    pwm_green_out <= 1;
                end    
                if(pwm_count < pixel[23:16]) begin
                    pwm_blue_out <= 0; //Active Low 0 here
                end else begin
                    pwm_blue_out <= 1;
                end  
            end else if(state == done) begin
                done_out <= 0;
            end 
        end
    end    
endmodule
`default_nettype wire