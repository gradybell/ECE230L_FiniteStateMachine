// Implement one-hot state machine
module onehot(
input w,
input clk,
input reset,
output z, StateA, StateB, StateC, StateD, StateE

);

 wire Anext, Bnext, Cnext, Dnext, Enext;
 wire Astate, Bstate, Cstate, Dstate, Estate;
 
 assign StateA = Astate;
 assign StateB = Bstate;
 assign StateC = Cstate;
 assign StateD = Dstate;
 assign StateE = Estate;
 
 dff Adff(
    .Default(1'b1),
    .D(Anext),
    .clk(clk),
    .reset(reset),
    .Q(Astate)
 );
 
  dff Bdff(
    .Default(1'b0),
    .D(Bnext),
    .clk(clk),
    .reset(reset),
    .Q(Bstate)
 );
 
   dff Cdff(
    .Default(1'b0),
    .D(Cnext),
    .clk(clk),
    .reset(reset),
    .Q(Cstate)
 );
 
   dff Ddff(
    .Default(1'b0),
    .D(Dnext),
    .clk(clk),
    .reset(reset),
    .Q(Dstate)
 );
 
   dff Edff(
    .Default(1'b0),
    .D(Enext),
    .clk(clk),
    .reset(reset),
    .Q(Estate)
 );

assign z = Cstate | Estate;

assign Anext = 0;
assign Bnext = (Dstate & ~w) | (Estate & ~w) | (Astate & ~w);
assign Cnext = (Bstate & ~w) | (Cstate & ~w);
assign Dnext = (Astate & w) | (Bstate & w) | (Cstate & w);
assign Enext = (Dstate & w) | (Estate & w);
   

endmodule