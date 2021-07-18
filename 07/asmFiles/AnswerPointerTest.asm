// push constant 3030
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 0
@SP
AM=M-1
D=M // D <- 3030
@THIS
M=D // R[3] <- 3030

// push constant 3040
@3040
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 1
@SP
AM=M-1
D=M // D <- 3040
@THAT
M=D // R[4] <- 3040

// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop this 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop that 6
@THAT
D=M
@6
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push pointer 0
@THIS
D=M // D <- 3030
@SP
A=M // A <- 256
M=D // R[256] <- 3030
@SP
M=M+1

// push pointer 1
@THAT
D=M // D <- 3040
@SP
A=M // A <- 257
M=D // R[257] <- 3040
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

// push this 2
@THIS
D=M
@2
D=D+A
A=D
D=M
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

// push that 6
@THAT
D=M
@6
D=D+A
A=D
D=M
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
