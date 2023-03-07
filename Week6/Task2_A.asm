.model tiny 
.data
    msg1 db '*******$' ; Your Name
    len1 db 7 ; Your Name Length
    msg2 db'2021**PS****P$' ; Your ID NUmber
    len2 db 13

    ; 2 files
    f1name db 'name.txt', 0
    handle1 dw ?
    f2name db 'id.txt', 0
    handle2 dw ?

.code
.startup

    ; Creating file for Name
    lea dx, f1name
    mov ah, 3ch
    mov cl, 1h
    int 21h
    mov handle1, ax

    ; Opening file to write 
    mov ah, 3dh
    mov al, 01h
    lea dx, f1name
    int 21h
    mov handle1, ax

    ; Moving string to file 
    mov ah, 40h
    mov bx, handle1
    mov cl, len1
    mov ch, 00
    lea dx, msg1
    int 21h

    ; Closing File
    mov ah, 3eh
    int 21h

    ; Creating file for ID
    lea dx, f2name
    mov ah, 3ch
    mov cl, 1h
    int 21h
    mov handle2, ax

    ; Opening file to write 
    mov ah, 3dh
    mov al, 01h
    lea dx, f2name
    int 21h
    mov handle2, ax

    ; Moving string to file 
    mov ah, 40h
    mov bx, handle2
    mov cl, len2
    mov ch, 00
    lea dx, msg2
    int 21h

    ; Closing File
    mov ah, 3eh
    int 21h

.exit
end
