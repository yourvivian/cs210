//Implementing: R2 = SUM of the R7 elements beginning at location R8
//Using R2 for sum, and R0 for i (loop index)
//R2=0
@R2
M=0
//R0=0
@R0
M=0
//Beginning of loop
(LOOP)
//Exit loop if R0 == R7
@R7
D=M
@R0
D=D-M
@ENDLOOP
D;JEQ
//Calculate address of next element to add (@R8+i)
@R0
D=M
@R8
A=D+A
//Load value and accumulate into R2
D=M
@R2
M=D+M
//Increment i
@R0
M=M+1
//Jump to beginning of loop
@LOOP
0;JMP
//Infinite loop at the end of the program
(ENDLOOP)
0;JMP
