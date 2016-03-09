// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@R2   // initialize the product to 0
M=0

@count    // initialize the counter to 0
M=0

(LOOP)    // adds the first operand to itself repeatedly to simulate multiplication
    @count
    D=M     // fetch the current count

    @R1
    D=M-D

    @END
    D;JLE    // jump if counter has reached maximum

    @R0
    D=M     // fetch the first operand

    @R2
    M=M+D    // add first operand to itself

    @count
    M=M+1    // increment the counter

    @LOOP
    0;JMP    // continue the loop

(END)
    @END
    0;JMP