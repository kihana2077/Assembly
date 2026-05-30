assume cs:code,ss:stack

stack segment
db 16 dup(0)
stack ends

code segment
start:
    mov ax,stack
    mov ss,ax
    mov sp,16       
    mov ax,1
    push ax
    mov ax,3
    push ax
    call multi
    mov ax,4c00h
    int 21h

multi:
    push bp
    mov bp,sp
    mov ax,[bp+4]
    sub ax,[bp+6]
    mov bp,ax
    mul bp
    mul bp
    pop bp
    ret 4
code ends
end start


