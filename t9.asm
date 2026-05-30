assume cs:codesg,ds:datasg,ss:stacksg

datasg segment
db 'welcome to masm!'
db 02h,24h,71h
datasg ends

stacksg segment
    dw 8 dup(0)
stacksg ends

codesg segment
start:
    mov ax,datasg
    mov ds,ax
    mov ax,stacksg
    mov ss,ax
    mov sp,16

    mov ax,0b800h
    mov es,ax;赋予显存地址

    mov bx,07c0h;控制打印居中
    mov cx,3;设置打印行数
    mov di,16;设置颜色指针
s_line:
    push cx;压栈保护
    push bx;压栈保护
    mov si,0;设定行起始偏移量
    mov cx,16;设定循环轮数
s_char:
    mov al,ds:[si];将字符数据存入低位
    mov ah,ds:[di];将颜色数据存入高位
    mov es:[bx],ax;将字符颜色数据写入显存
    add bx,0002h;bx自增
    inc si;字符串指针移位
    loop s_char;轮询16次

    pop bx
    add bx,00f0h;跳转到下一行
    inc di;颜色指针移位
    pop cx
    loop s_line

    mov ax,0100h
    int 21

    mov ax,4c00h
    int 21h
codesg ends
end start




