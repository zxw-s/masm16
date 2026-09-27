;MASM16位 简化段最小骨架（.model small）
;代码短，考试如果没有强制要求完整SEGMENT可以用

.model small
.stack 100h
.data
    ;数据放这里
.code
start:
    mov ax,@data
    mov ds,ax

    ;功能代码

    mov ah,4Ch
    int 21h
end start