.model tiny 
.data
    str1 db 'Enter Your Name : $'
    ; Storing String Name
    max1 db 32
    act1 db ?
    inp1 db 32 dup('$')
    
    str2 db 'Enter Your ID : $'
    ; Storing String ID
    max2 db 32
    act2 db ?
    inp2 db 32 dup('$')

    ; 2 files
    f1name db 'name.txt', 0
    handle1 dw ?
    f2name db 'id.txt', 0
    handle2 dw ?

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

    ; OutPutting second string asking for ID
    lea dx, str2
    mov ah, 09h
    int 21h

    ; Taking String from STDIN
    lea dx, max2
    mov ah, 0ah
    int 21h

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
    mov cl, act1
    mov ch, 00
    lea dx, inp1
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
    mov cl, act2
    mov ch, 00
    lea dx, inp2
    int 21h

    ; Closing File
    mov ah, 3eh
    int 21h

.exit
end
