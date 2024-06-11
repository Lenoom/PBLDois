module FlipFlopT(
    input preset,
    input reset,
    input T,
    input Clock,
    output reg Q
);

    always @(posedge Clock) begin
        if (reset) begin
            Q <= 0;
        end
        else if(!reset && preset) begin
            Q <= 1;
        end
        else begin
            if (T) begin
                Q <= ~Q;
            end
        end
    end

endmodule