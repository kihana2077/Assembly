assume ds:data,cs:code
data segment
db 'welcome to masm!'
db 16 dup(0)
data ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax
    mov si,0
    mov di,16
    mov cx,16
    cld
s:
    movsb
    loop s 

    mov ax,4c00h
    int 21h

    code ends
    end start
