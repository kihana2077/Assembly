;实现一个128位数的进位加法
assume ds:data,cs:code,ss:stack

data segment
dw 0a452h,0a8f5h,78e6h,0a8eh,8b7ah,54f6h,0f04h,671eh
dw 0e71eh,0ef04h,54f6h,8b7ah,0a8eh,78e6h,58f5h,0452h
data ends

stack segment
db 16 dup(0)
stack ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,16
    mov si,0
    mov di,16
    mov cx,8
    call add128
    mov ax,4c00h
    int 21h
    
add128:
    ;压栈保护寄存器
    push si
    push di
s:
    sub ax,ax
    mov ax,[si]
    adc ax,[di]
    mov [si],ax
    inc si
    inc si
    inc di
    inc di
    loop s 
    pop di
    pop si
    ret

code ends
end start