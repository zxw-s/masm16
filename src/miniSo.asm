;完整标准框架（两种写法：简化段、完整段）
;方式1：简化段定义（常用，简单）
;环境：DOSBox + MASM5.0 / MASM6.11，16位实模式 DOS 程序。

; MASM 简化段格式 .model .stack .data .code
.model small   ; 内存模型 small：CS=代码段，DS=数据段，代码段1个，数据段1个，64KB
.stack 100h    ; 设置栈大小 256字节

; 数据段：定义变量、字符串
.data
    msg db 'Hello MASM$'    ; DOS int 21h 09h输出字符串，以$作为结束标记

;代码段
.code
start:          ; 程序入口标签，名字自定义，一般叫start
    ; 必写：初始化DS数据段寄存器，给DS赋值（small模型必须手动赋值ds）,@data代表简化段的数据段
    mov ax, @data
    mov ds, ax          ; DS 指向我们的数据段

    ; 业务代码
    ;DOS 21h 09h号功能：输出字符串，ds:dx指向字符串，$结尾
    lea dx, msg
    mov ah, 09h
    int 21h

    ; DOS 4Ch功能调用，DOS程序标准退出，返回操作系统
    mov ah, 4Ch
    int 21h

end start   ; end后面指定入口标签start，告诉MASM程序入口