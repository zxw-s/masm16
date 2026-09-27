;MASM：键盘输入 + 屏幕回显示例（完整段格式）
;功能：读取键盘输入一串字符，按下回车结束，把输入的内容再输出到屏幕，最后退出DOS。
;文件名：`input_echo.asm`
; 使用 DOS 21H 中断：0AH号功能，缓冲区输入字符串。

DATA SEGMENT
    ; 0AH功能输入缓冲区格式：
    ; 第1字节：缓冲区最大可输入字符数
    ; 第2字节：实际读到的字符数（由系统回填）
    ; 后面字节：存放输入字符
    buf db  50, ?, 50 dup(?)   ; 最多输入49个字符

    prompt db 0Dh,0Ah,'Please input your string: $'
    outmsg db 0Dh,0Ah,'You typed: $'
DATA ENDS

STACK SEGMENT STACK
    dw 100h dup(?)
STACK ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA,SS:STACK

START:
    ; 初始化DS
    mov ax,DATA
    mov ds,ax

    ; 1.输出提示字符串
    lea dx,prompt
    mov ah,09h
    int 21h

    ; 2.DOS 0AH号功能：键盘字符串输入
    ; DS:DX指向输入缓冲区
    lea dx,buf
    mov ah,0Ah
    int 21h

    ; 3.输出回显提示
    lea dx,outmsg
    mov ah,09h
    int 21h

    ; 修改输入字符串末尾，加上$，方便用09h输出
    xor bx,bx
    mov bl,buf+1        ; bl = 实际输入字符个数
    mov buf[bx+2],'$'   ; 在字符末尾写入$结束符

    ; 4.打印用户输入的字符串
    lea dx,buf+2        ; 真正字符从buf+2开始
    mov ah,09h
    int 21h

    ; 程序退出
    mov ah,4Ch
    int 21h
CODE ENDS
END START