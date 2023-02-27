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
    mov bl, 'a'
    mov ch, ' '
    mov bh, 20h
    int 21h
    mov cl, int1
    lea si, inpString
X1: cmp [si], bl
    JAE X2
    cmp [si], ch
    JE X2
    ADD [si], bh
X2: inc si
    dec cl
    JNZ X1
    mov bl, '$'
    mov [si], bl
    lea dx, inpString
    mov ah,09h
    int 21h
.exit
end
