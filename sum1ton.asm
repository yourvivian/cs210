// Loop: if i-R0 > 0, stop the loop

// Set i to 0 and the current sum to 0
@i
M=0
@R1
M=0

(LOOP)
@i
M=M+1
D=M

@R0
D=D-M // D=i-R0

@END
D;JGT // End loop if i-R0 > 0

// Update the current sum
@i
D=M
@R1
M=D+M

// Jump back to the loop
@LOOP
0;JMP

(END)
@END
0;JMP