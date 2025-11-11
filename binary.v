// Implement binary state machine

module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] binaryState
);

    wire [2:0] State;
    wire [2:0] Next;
    
    dff D2(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );
        
    dff D1(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );
        
    dff D0(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );
    
    assign z = (~State[2]& State[1] & ~State[0]) + (State[2] & ~State[1] & ~State[0]);
    assign Next[2] = (State[2] & w) | (State[1] & State[0] & w);
    assign Next[1] = (State[1] & ~State[0]) | (~State[1] & State[0]) 
                   | (~State[2] & ~State[0] & w);
    assign Next[0] = (~State[1] & ~State[0] & ~w) | (~State[2] & ~State[0] & w)
                   | (~State[2] & ~State[1] & w) | (State[1] & State[0] & ~w);
    
    assign binaryState = State;
    
endmodule