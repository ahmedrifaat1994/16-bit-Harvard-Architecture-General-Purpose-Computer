// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//set variable r and t to -32
@32
D=-A
@r
M=D

@32
D=-A
@t
M=D

//counter for rows
@n
M=0

@m
M=0

//set variable c and v to 0
@c
M=0

@v
M=0

(LOOP)
//get the value of the keyboard register, 0 not pressed, >0 pressed
@KBD
D=M

//if key pressed got to fill
@FILL
D;JGT

//if key not pressed got to clear
@CLEAR
D;JEQ

//row*32 + col/16
//********************FILL*********************
(FILL)
@32
D=A
@r
M=M+D
D=M
@c
D=D+M
@SCREEN
A=A+D
M=-1

//if c == 31 reset
@32
D=A
@c
D=D-M
@CONT
D;JEQ

//if n == 255 reset
@255
D=A
@n
D=D-M
@FILLRESET
D;JEQ

//increment
@n
M=M+1

@LOOP
0;JMP
//row*32 + col/16
//***********************CLEAR******************
(CLEAR)
@32
D=A
@t
M=M+D
D=M
@v
D=D+M
@SCREEN
A=A+D
M=0


//if v == 31 reset
@32
D=A
@v
D=D-M
@CONT
D;JEQ

//if m == 255 reset
@255
D=A
@m
D=D-M
@CLEARRESET
D;JEQ

//increment
@m
M=M+1

@LOOP
0;JMP

//**********************FILLRESET*******************
(FILLRESET)
//reset fill values
@n
M=0
@32
D=-A
@r
M=D
@c
M=M+1

//reset clear values
@m
M=0
@32
D=-A
@t
M=D


@LOOP
0;JMP

//**********************CLEARRESET*******************
(CLEARRESET)
//reset clear values
@m
M=0
@32
D=-A
@t
M=D
@v
M=M+1

//reset fill values
@n
M=0
@32
D=-A
@r
M=D


@LOOP
0;JMP

//**********************CONT*******************
(CONT)
//reset fill values
@n
M=0
@32
D=-A
@r
M=D
@c
M=0

//reset clear values
@m
M=0
@32
D=-A
@t
M=D
@v
M=0
@LOOP
0;JMP