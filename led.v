
module led (
    input rst_n,
    input clk,
    output reg [1:0] led
);

localparam MAX_CNT_PER = 25'd25000_000;

reg [24:0] cnt;

reg A;

always@(posedge clk or negedge rst_n) begin
    if(!rst_n)    
        cnt <= 25'd0;
    else if(cnt < MAX_CNT_PER - 25'd1)
        cnt <= cnt + 25'd1;
    else
        cnt <= 25'd0;
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n)    
        led <= 2'b01;
    else if(cnt = MAX_CNT_PER - 25'd1)
        led <= {led[0],led[1]};
    else
        led <= led;
end


endmodule
