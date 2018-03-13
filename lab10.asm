;ALP to point cursor to a specified row and column
.model small
.data
	row db ?
	col db ?
	m1 db 10,13,'Enter row: $'
	m2 db 10,13,'Enter column: $'
.code
	mov ax,@data
	mov ds,ax
	mov ax,0600h
	mov bh,07h
	mov cx,0000h
	mov dx,184fh
	int 10h
	lea dx,m1
	mov ah,09h
	int 21h
	call read
	mov row,al
	lea dx,m2
	mov ah,09h
	int 21h
	call read
	mov col,al
	mov ah,02h
	mov bh,00h
	mov dh,row
	mov dl,col
	int 10h
	mov ah,01h
	int 21h
	mov ah,4ch
	int 21h
read proc near
	mov ah,01h
	int 21h
	sub al,30h
	mov bl,al
	mov ah,01h
	int 21h
	sub al,30h
	mov ah,bl
	aad
	ret
read endp
end
  