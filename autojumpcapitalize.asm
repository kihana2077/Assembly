assume cs:code,ds:data,ss:stack
data segment
db 'word',0
db 'unix',0
db 'wind',0
db 'good',0
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
    mov cx,4
s:  
    push cx
    call capitalize
    pop cx
    inc si
    loop s
    mov ax,4c00h
    int 21h

capitalize:
    mov cl,[si]
    mov ch,0
    jcxz ok
    and byte ptr [si],11011111b
    inc si
    jmp short capitalize
    ok:
        ret
code ends
end start
