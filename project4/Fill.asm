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
// キーボードのいずれかのキーが押されているときは画面を黒塗り、そうでない時は白塗りする。
// キーボードのキーが押されているかどうかは、RAM[KBD] == 0かどうかで判定できそう。
// 全ピクセルを塗らないといけないので、RAMアドレスをSCREENからSCREEN+8192までループで回して操作する。
// RAM[SCREEN]をベースアドレスとして、そこから8192個のレジスタを-1 or 0に設定する配列処理(図4-7参照)を考える。
// そこにRAM[KBD]による条件分岐が入るイメージ。

// 疑似コードは以下
//     max = 8192
// BRANCH:
//     n = 0
//     if (*KBD = 0) goto WHITE
//     if (*KBD != 0) goto BLACK
// BLACK:
//     if (n = max - 1) goto BRANCH
//     *(SCREEN + n) = -1
//     n = n + 1
//     goto BLACK
// WHITE:
//     if (n = max - 1) goto BRANCH
//     *(SCREEN + n) = 0
//     n = n + 1
//     goto WHITE

// 以下アセンブリプログラムコード。

    
    // max = 8192
    @8192
    D=A
    @max
    M=D
(BRANCH)
    // n = 0
    @n
    M=0
    // if (*KBD = 0) goto WHITE
    @KBD
    D=M
    @WHITE
    D;JEQ
    // if (*KBD != 0) goto BLACK
    @BLACK
    D;JNE
(WHITE)
    // if (n = max - 1) goto BRANCH
    @max
    D=M
    @n
    D=D-M
    D=D-1
    @BRANCH
    D;JEQ
    // *(SCREEN + n) = 0
    @SCREEN
    D=A
    @n
    A=D+M
    M=0
    // n = n + 1
    @n
    M=M+1
    // goto WHITE
    @WHITE
    0;JMP
(BLACK)
    // if (n = max - 1) goto BRANCH
    @max
    D=M
    @n
    D=D-M
    D=D-1
    @BRANCH
    D;JEQ
    // *(SCREEN + n) = -1
    @SCREEN
    D=A
    @n
    A=D+M
    M=-1
    // n = n + 1
    @n
    M=M+1
    // goto BLACK
    @BLACK
    0;JMP


    
    
     