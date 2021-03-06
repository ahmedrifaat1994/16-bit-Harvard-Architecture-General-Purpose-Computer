// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//reset R0, R1, R2
@R2
M=0

//check if any of R0 and R1 equal 0
@R0
D=M
@END
D;JEQ

@R1
D=M
@END
D;JEQ

(LOOP)
//get value of R0
@R0 
D=M

//sum R2 to R0 and save it in R2
@R2 
M=M+D

//subtract 1 from R1
@R1 
M=M-1
D=M

//if R1 == 0 jump to end, thi means the multiplication is done
@END
D;JEQ

//if R1 > 0 repeat the process
@R1
D=M
@LOOP
D;JGT

(END)
@END
0;JMP