;完整标准框架（两种写法：简化段、完整段）
;方式2：完整段定义，理解完整程序结构（传统完整SEGMENT格式，考试常考）
; 功能：在屏幕输出一行字符串 `Hello MASM Assembly!`，然后程序正常退出。

DATA SEGMENT
    ; 数据段：存放初始化好的数据、字符串
    msg  db  'Hello MASM Assembly!',0Dh,0Ah,'$'
    ; 0Dh=回车，0Ah=换行，$ 是DOS 09H输出功能的结束标记
DATA ENDS

STACK SEGMENT STACK
    ; 栈段，开辟栈空间，256个字，STACK属性交给链接器处理SS:SP
    dw  100H  DUP(?)
STACK ENDS

CODE SEGMENT
    ; ASSUME：告诉汇编器，段寄存器对应哪一个逻辑段。仅汇编器映射，不会修改CPU寄存器！！
    ASSUME CS:CODE, DS:DATA, SS:STACK

START:
    ; ========= 1.初始化数据段寄存器DS，必须手动赋值 =========
    mov  ax, DATA
    mov  ds, ax

    ; ========= 2.DOS 21H中断 09H功能：输出$结尾字符串 =========
    ; 入口要求：DS:DX = 字符串首地址，AH=09H
    ; 用户代码区域
    lea  dx, msg      ; 取msg的偏移地址送入dx
    mov  ah, 09H
    int  21H

    ; =========3.程序退出返回DOS系统 4CH功能 =========
    mov  ah, 4CH
    int  21H

CODE ENDS
END START   ; 文件最后一行！END + 入口标签START，指定程序执行起点