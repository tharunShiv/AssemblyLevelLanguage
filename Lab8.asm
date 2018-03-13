.model small
.data
	n dw 05h
	r dw 02h
	res dw ?
.code
	mov ax,@data
	mov ds,ax
	call ncr
	mov ah,4ch
	int 21h
ncr proc near
	cmp r,00h
	JNZ l1
	add res,01h
	ret
l1:mov ax,n
	cmp r,ax
	JNZ l2
	add res,01h
	ret
l2:
	cmp r,01h
	JNZ l3
	add res,ax
	ret
l3:
	dec ax
	cmp r,ax
	JNZ l4
	add res,ax
	inc res
	ret
l4:
	dec n
	push n
	push r
	call ncr
	pop r
	pop n
	dec r
	push n
	push r
	call ncr
	pop r
	pop n
	ret
ncr endp
end