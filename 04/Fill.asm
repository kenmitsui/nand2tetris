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

(LOOP)
@KBD
D=M

@CLICKED
D;JGT

@R0
M=0 //  R0に0をセット、つまり16ビットすべて白く描画
@FILL
0;JMP

(CLICKED)
@R0
M=-1 // R0に-1(111...111)をセット、つまり16ビットすべて黒く描画

(FILL)
@SCREEN
D=A // D <- 16384
@R1
M=D // R1 <- 16384

(LOOP_FILL)
@R0
D=M // 描画の色
@R1
A=M // A <- 16384などの、R1に格納していた描画対象のRAMアドレス
M=D // 16384などの描画対象に描画

@R1
MD=M+1 // RAMアドレスをインクリメント(16384 -> 16385 など)
@SCREEN
D=D-A // スクリーンの左上(16384)を0としたときのアドレス
@8191 // 512/16*256-1。左上を0としたとき、8191が右下のワードのアドレスになる
D=D-A // これが負か0の間は続ける
@LOOP_FILL
D;JLE

@LOOP
0;JMP