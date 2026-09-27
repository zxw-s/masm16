;MASM16位 最小可运行骨干框架
;16位DOS EXE程序，完整SEGMENT段格式（考试大题优先写这个）， 包含：数据段、栈段、代码段、ASSUME、DS初始化、程序退出、END入口标记

DATA SEGMENT
    ; 数据段：定义变量、字符串
DATA ENDS

STACK SEGMENT STACK
    ; 栈段，开辟栈空间，256个字    
    dw 100H DUP(?)
STACK ENDS

CODE SEGMENT
    ; ASSUME：告诉汇编器，段寄存器对应哪一个逻辑段
    ; ASSUME仅仅是汇编器的提示，**不会修改CPU寄存器**！
    ASSUME CS:CODE, DS:DATA, SS:STACK

; 程序入口标签，名字自定义，一般叫start
START:
    ; 初始化DS数据段寄存器
    mov ax,DATA
    mov ds,ax

    ; 在这里写功能代码

    ; DOS 4Ch功能调用，DOS中断退出程序
    mov ah,4CH
    int 21H
CODE ENDS
END START    ; end后面指定入口标签start，告诉MASM程序入口