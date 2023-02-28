.model tiny
.data
    maxval db 32
    int1 db ?
    inpString db 32 dup(?)
    hehe db '$'
.code
.startup
    lea dx, maxval
    mov ah, 0ah
    int 21h
    mov cl, int1
    mov ch, 32
    mov al, '$'
    lea si, inpString
X1:
    sub [si], ch
    inc si
    dec int1
    JNZ X1
    mov [si], al
    lea dx, inpString
    mov ah, 09h
    int 21h
.exit
end
