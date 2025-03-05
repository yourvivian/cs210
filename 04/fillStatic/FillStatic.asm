// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/FillStatic.asm

// Blackens the screen, i.e. writes "black" in every pixel. 
// Key presses are ignored.
// This is an intermediate step added by Prof. Davis.

// Put your code here.

// Initialize screen memory address (RAM[16384] is the start of the screen)
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/FillStatic.asm

// Blackens the entire screen by writing -1 (black) in every screen word.

// Initialize screen start address
@16384   // Load start of screen memory
D=A      
@R0
M=D      // Store in R0 (acts as an index)

@24576   // Load end of screen memory (exclusive)
D=A
@R1
M=D      // Store in R1 (end boundary)

(FILL_SCREEN)
@R0
D=M      // Load current screen address
@R1
D=D-M    // Compare with end address
@END
D;JGE    // If R0 >= R1, stop

@R0
A=M      // Set A to current screen pixel address
M=-1     // Fill with black (all bits 1)

@R0
M=M+1    // Move to next screen word

@FILL_SCREEN
0;JMP    // Repeat

(END)
@END
0;JMP    // Infinite loop (halt)