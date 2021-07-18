// 生成されるべきasmファイル。vmファイルからこのasmファイルを生成できれば良い

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP // R[0](R[0]には258が入っている)
AM=M-1 // R[0]に入っている値を、258から257にデクリメント。更に、A <- 257
D=M // D <- R[257](=17)
A=A-1 // A <- 256 (R[256]を見に行くため)
D=M-D // D <- R[256]-R[257] 
@EQ_TRUE_1
D;JEQ // If D=0 goto EQ_TRUE_1
// Falseの場合の処理
@0
D=A
@SP
A=M-1 // A <- 256 (R[0](=257) - 1)
M=D // R[256] <- 0
@EQ_FALSE_1
0;JMP // goto EQ_FALSE_1
// Trueの場合の処理
(EQ_TRUE_1)
@1
D=A
@0
D=A-D // D <- -1 (これ以外に方法ある？？)
@SP
A=M-1 // A <- 256 (R[0](=257) - 1)
M=D // R[256] <- -1
(EQ_FALSE_1)

// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_2
D;JEQ
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_2
0;JMP
// Trueの場合の処理
(EQ_TRUE_2)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_2)

// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_3
D;JEQ
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_3
0;JMP
// Trueの場合の処理
(EQ_TRUE_3)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_3)

// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_4
D;JLT // D<0 なら True
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_4
0;JMP
// Trueの場合の処理
(EQ_TRUE_4)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_4)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_5
D;JLT // D<0 なら True
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_5
0;JMP
// Trueの場合の処理
(EQ_TRUE_5)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_5)

// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_6
D;JLT // D<0 なら True
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_6
0;JMP
// Trueの場合の処理
(EQ_TRUE_6)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_6)

// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_7
D;JGT // D>0 なら True
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_7
0;JMP
// Trueの場合の処理
(EQ_TRUE_7)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_7)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_8
D;JGT // D>0 なら True
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_8
0;JMP
// Trueの場合の処理
(EQ_TRUE_8)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_8)

// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@EQ_TRUE_9
D;JGT // D>0 なら True
// Falseの場合の処理
@0
D=A
@SP
A=M-1
M=D
@EQ_FALSE_9
0;JMP
// Trueの場合の処理
(EQ_TRUE_9)
@1
D=A
@0
D=A-D
@SP
A=M-1
M=D
(EQ_FALSE_9)

// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
AM=M-1
D=M
A=A-1
D=M+D // add
@SP
A=M-1
M=D

// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
AM=M-1
D=M
A=A-1
D=M-D // sub
@SP
A=M-1
M=D

// neg
@SP // 仮に R[0]=257 とする。この場合 R[256]を-1倍したい
A=M-1 // A <- 256
D=M // D <- R[256]
@0
D=A-D // D <- -D
@SP
A=M-1
M=D // R[256] <- D

// and
@SP
AM=M-1
D=M
A=A-1
D=M&D // and
@SP
A=M-1
M=D

// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
AM=M-1
D=M
A=A-1
D=M|D // or
@SP
A=M-1
M=D

// not
@SP // 仮に R[0]=257 とする。この場合 R[256]をビット反転したい
A=M-1 // A <- 256
D=M // D <- R[256]
D=!D
@SP
A=M-1
M=D // R[256] <- D
