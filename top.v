module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    onehot onehot_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[0]),
        .StateA(led[2]),
        .StateB(led[3]),
        .StateC(led[4]),
        .StateD(led[5]),
        .StateE(led[6])        
    );
    
    binary binary_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[1]),
        .binaryState(led[9:7])
    );

endmodule