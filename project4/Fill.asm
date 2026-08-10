// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// 以下mycomment
// ファイル：Mult.asm
// RAM[2]にRAM[0]×RAM[1]を計算する
// ALUに積の演算は実装されていないので、RAM[0]をRAM[1]回足し合わせることで実装してみる

// 疑似コードは以下。
//     i = 0
//     sum = 0
// LOOP:
//     if (i = R1) goto STOP
//     sum = sum + R0
//     i = i + 1
//     goto LOOP
// STOP:
//     R2 = sum

// 以下アセンブリプログラムコード。



