`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2022 12:42:37 PM
// Design Name: 
// Module Name: led_driver_fsm
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
module led_driver_fsm(
        input wire clk, //5mhs
        input wire rst, 
        input wire start,
        input wire [3:0][15:0][23:0] led_cube,
        //PMOD
        output logic data_out,
        output logic pwm_red_out,
        output logic pwm_green_out,
        output logic pwm_blue_out, 
        output logic data_clk, 
        output logic [1:0] z_level,  
        output logic data_clr,
        output logic sr_wr   
    );
    parameter LED_NUM_PER_FLOOR = 16;
    parameter MAX_CYCELS_PER_PLANE = 20833;
    
    logic write_start, write_done;
    logic [15:0] write_data;
    write shift_register_write(
        .clk(clk), .rst(write_start), .start(write_start), .done_out(write_done),
        .data_in(write_data),        
        //output to pmod 
        .data_out(data_out), .data_clk(data_clk), .sr_wr(sr_wr), .data_clr(data_clr)
    );
         
    logic pwm_start, pwm_done;
    logic [23:0] pixel;
    
    pwm shift_register_pwm(
        .clk(clk), .rst(pwm_start), .start(pwm_start), .done_out(pwm_done),
        .pixel(pixel), 
        .pwm_red_out(pwm_red_out), .pwm_green_out(pwm_green_out), .pwm_blue_out(pwm_blue_out)
    );
    
    logic [3:0] index;
    logic [31:0] count;
    typedef enum {idle, write, pwm} states;
    states state;
    always_comb begin
        case(index)
            4'd0 : write_data =  16'b0000_0000_0000_0001;
            4'd1 : write_data =  16'b0000_0000_0000_0010;
            4'd2 : write_data =  16'b0000_0000_0000_0100;
            4'd3 : write_data =  16'b0000_0000_0000_1000;
            4'd4 : write_data =  16'b0000_0000_0001_0000;
            4'd5 : write_data =  16'b0000_0000_0010_0000;
            4'd6 : write_data =  16'b0000_0000_0100_0000;
            4'd7 : write_data =  16'b0000_0000_1000_0000;
            4'd8 : write_data =  16'b0000_0001_0000_0000;
            4'd9 : write_data =  16'b0000_0010_0000_0000;
            4'd10 : write_data = 16'b0000_0100_0000_0000;
            4'd11 : write_data = 16'b0000_1000_0000_0000;
            4'd12 : write_data = 16'b0001_0000_0000_0000;
            4'd13 : write_data = 16'b0010_0000_0000_0000;
            4'd14 : write_data = 16'b0100_0000_0000_0000;
            4'd15 : write_data = 16'b1000_0000_0000_0000;
        endcase
        pixel = led_cube[z_level][index];
    end 
    
    always_ff @(posedge clk) begin
        if(rst || start) begin
            index <= 0;
            z_level <= 0;
            write_start <= 1;
            count <= 0;
            state <= write; 
        end else begin 
            if(count == MAX_CYCELS_PER_PLANE - 1) begin 
                count <= 0;
                z_level <= z_level + 1;
            end else begin 
                count <= count + 1;
            end 
            if(state == write) begin
                write_start <= 0;
                if(write_done) begin
                    pwm_start <= 1;
                    state <= pwm;
                end 
            end else if (state == pwm) begin 
                pwm_start <= 0;
                if(pwm_done) begin
                    write_start <= 1;
                    state <= write;
                    index <= index + 1; 
                end
            end 
        end 
    end    
endmodule
`default_nettype wire