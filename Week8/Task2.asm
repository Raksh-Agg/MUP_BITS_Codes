.model tiny
.data
	row db 0 ; Row for Cursor
	col db 0 ; Column for Cursor
	curr dw 1 ; Stores current Fibonacci number
	past dw 0 ; Stores last Fibonacci number
	cnt dw 8 ; No.of rows to be printed
.code
.startup
    ; Setting video mode
	mov ah, 00h
	mov al, 03h
	int 10h


	mov cx, cnt
	write1 :
	push cx

    ; Logic for calculating Fibonacci number after each iteration
	mov ax, curr
	mov bx, past
	add bx, ax
	mov curr, bx
	mov past, ax
	
    ; Setting cursor
	mov ah, 02h
	mov dh, row
	mov dl, col
	mov bh, 00
	int 10h
	
    ; Giving character to be printed info
	mov ah, 09h
	mov al, 'A' ; Initializing al to 'A'
	dec al
	mov cx, past ; Giving cx value of last fibonacci number, character to be printed that many times
	add al, cl ; Incrementing to get the character accroding to Fibonacci number
	mov bh, 00 ; Formatting text display type
	mov bl, 00001111b
	int 10h
	
    
	pop cx
	mov col, 0 ; Setting cursor after each iteration
	inc row
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