// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.


(INIT)   
    @8192      // Total number of screen words (32 rows × 256 columns / 16 pixels per word)
    D=A
    @i         // Store in index variable i
    M=D

(LOOP)   
    @i
    M=M-1      // Decrease index
    D=M
    @INIT
    D;JLT      // If i < 0, reset index

    @KBD
    D=M        // Read keyboard input
    @WHITE
    D;JEQ      // If no key is pressed, go to WHITE
    @BLACK
    0;JMP      // Otherwise, go to BLACK

(BLACK)   
    @SCREEN
    D=A
    @i
    A=D+M      // Compute screen address
    M=-1       // Set all 16 pixels to black (1111111111111111)
    @LOOP
    0;JMP      // Repeat

(WHITE)
    @SCREEN
    D=A
    @i
    A=D+M      // Compute screen address
    M=0        // Set all 16 pixels to white (0000000000000000)
    @LOOP
    0;JMP      // Repeat

