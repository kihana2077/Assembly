assume ds:data,cs:code
data segment 
dd 100001
dw 100t
dw 0
data ends

code segment 
start:
    mov ax,data 
    mov ds,ax
    mov ax,ds:[0]
    mov dx,ds:[2]
    div word ptr ds:[4]
    mov ds:[6],ax 
    mov ah,4ch 
    int 21h
code ends 
end start
