// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// R2 = R0 * R1 = R0 + R0 + ... + R0 (R1 times)
    // R2 = 0
    @R2
    M=0

// Loop. Stop loop when R1 == 0
(LOOP)
    @R1
    D=M // Load R1 to D
    @END
    D;JEQ // If R1 == 0, go to END

    // D = R0
    @R0
    D=M // Load R0 to D

    // R2 = R2 + R0
    @R2
    M=D+M

    // Decrement R1
    @R1
    M=M-1

    // Repeat the loop
    @LOOP
    D;JGT

// Halt
(END)
    @END
    0;JMP