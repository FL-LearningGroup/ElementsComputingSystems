// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// File name: projects/04/Fill.asm
//******************************
//    **Writer: LucasYao
//    **Date: 2020/07/08
//    **Changed History:
//        1. init
//*******************************/

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
@KBD
D=M
@FILL
D;JGT

(CLEAR)
@offset
D=M
@SCREEN
A=D+A
M=0

@INC_OFFSET
0;JMP

(FILL)
@offset
D=M
@SCREEN
A=D+A
M=-1

(INC_OFFSET)
@offset
MD=M+1
@8192
D=D-A

@LOOP
D;JNE

(RESET_OFFSET)
@offset
M=0
@LOOP
0;JMP