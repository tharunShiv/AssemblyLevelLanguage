.model small
.data
	A db 5d,6d,7d,8d,2d
	len dw $-A
	e db 100 dup (?)
	ode db 100 dup (?)
.code
	mov ax,@data
	mov ds,ax
	mov cx,len
	lea si,A
	lea di,ode
	lea bp,e
l1:
	mov al,[si]
	mov ah,00h
	mov bl,02h
	div bl
	cmp ah,00h
	JZ el
	mov al,[si]
	mov [di],al
	inc di
	JMP exit
el:
	mov al,[si]
	mov ds:[bp],al
	inc bp
exit:
	inc si
	loop l1
	mov ah,4ch
	int 21h
end