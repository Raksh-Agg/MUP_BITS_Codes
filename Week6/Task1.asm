.model tiny 
.data
    str1 db 'Enter Your Name : $'
    max1 db 32
    act1 db ?
    inp1 db 32 dup('$')
    fname db 'testing.txt',0
    handle dw ?
.code
.startup

    ; OutPutting first string asking for name
    lea dx, str1
    mov ah, 09h
    int 21h

    ; Taking String from STDIN
    lea dx, max1
    mov ah, 0ah
    int 21h

    ; Creating file 
    lea dx, fname
    mov ah, 3ch
    mov cl, 1h
    int 21h
    mov handle, ax

    ; Opening file to write 
    mov ah, 3dh
    mov al, 01h
    lea dx, fname
    int 21h
    mov handle, ax

    ; Moving string to file 
    mov ah, 40h
    mov bx, handle
    mov cl, act1
    mov ch, 00h
    lea dx, inp1
    int 21h

    ; Closing File
    mov ah, 3eh
    int 21h


.exit
end
