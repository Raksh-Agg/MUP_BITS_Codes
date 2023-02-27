.model tiny
.data
    str1 db "The character entered is a$"
    str2 db "The character entered is not a$"
.code
.startup
    mov ah, 08h
    int 21h
    cmp al, 'a'
    JE Yes
    cmp al, 'A'
    JE Yes
    JNE No
Yes:
    lea dx, str1
    mov ah, 09h
    int 21h
No: 
    lea dx, str2
    mov ah, 09h
    int 21h
.exit
end
