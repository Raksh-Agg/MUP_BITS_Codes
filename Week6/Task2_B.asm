.model tiny 
.data
    ; 3 files
    f1name db 'name.txt', 0
    handle1 dw ?
    f2name db 'id.txt', 0
    handle2 dw ?
    f3name db 'splice.txt', 0
    handle3 dw ?

    part1 db 7 dup('$')
    len1 db 7 ; Length of your name
    part2 db 13 dup('$')
    len2 db 13 ; Length of ID string

.code
.startup
  
    ; Opening file to Read 
    mov ah, 3dh
    mov al, 00h
    lea dx, f1name
    int 21h
    mov handle1, ax

    ; Reading file
    mov ah, 3fh
    mov bx, handle1
    mov cl, len1
    mov ch, 00h
    lea dx, part1
    int 21h

    ; Closing File
    mov ah, 3eh
    int 21h

    ; Opening file to Read 
    mov ah, 3dh
    mov al, 00h
    lea dx, f2name
    int 21h
    mov handle2, ax

    ; Reading file
    mov ah, 3fh
    mov bx, handle2
    mov cl, len2
    mov ch, 00h
    lea dx, part2
    int 21h

    ; Creating file for ID
    lea dx, f3name
    mov ah, 3ch
    mov cl, 1h
    int 21h
    mov handle3, ax

    ; Opening file to write 
    mov ah, 3dh
    mov al, 01h
    lea dx, f3name
    int 21h
    mov handle3, ax

    ; Moving ID string to file 
    mov ah, 40h
    mov bx, handle3
    mov cl, len2
    mov ch, 00h
    lea dx, part2
    int 21h

    ; Moving string to file 
    mov ah, 40h
    mov bx, handle3
    mov cl, len1
    mov ch, 00h
    lea dx, part1
    int 21h

    ; Closing File
    mov ah, 3eh
    int 21h

.exit
end
