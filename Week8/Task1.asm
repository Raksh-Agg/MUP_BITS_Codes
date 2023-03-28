.model tiny
.data
    inp1 db '(Give your name with Space)'
    cnt db (Name Length, including spaces)
    row db ?
    col db ?
.code
.startup
    ; Setting video mode
    mov ah,00h
    mov al,03h
    int 10h

    ; Loading address of input string 
    lea si,inp1
    dec si ; Pushing SI pointer to end of name
    mov ch , 00h
    mov cl, cnt
    add si, cx 
    mov row, 0
    mov col, 0


    write1: 
    push cx ; Saving count value on stack

    ; Setting cursor position
    mov ah,02h
    mov dh,row
    mov dl,col
    mov bh,00 ; Page number
    int 10h

    ; Write a single character
    mov ah,09h
    mov al,[si] ; Character at location of SI
    mov bh,00
    mov bl, 00001111b ; Mode for non blinking, black background, opaque, white text
    mov cx,01 ; Only one character to print
    int 10h
    pop cx

    dec si ; pointer moving backward
    inc col ; cursor moivng forward
    inc row ; cursor moivng forward
    dec cl
    jnz write1

    ; Blocking function, "%" key is used to exit
    end1:
    mov ah,07h
    int 21h
    cmp al,'%'
    jnz end1

    ; Terminating program
    term:
    mov ah,4ch
    int 21h

.exit
end
