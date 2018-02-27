.model small

.data
  m1 db 10,13,'enter a 8bit number $'
  n1 db ?
  m2 db 10,13,'The number is prime$'
  m3 db 10,13,'The number is not prime$'
  
.code 
   mov ax,@data
   mov ds,ax

   lea dx,m1
   mov ah,09h
   int 21h
   
   mov ah,01h
   int 21h
   sub al,30h
   mov bl,al
   mov ah,01h
   int 21h
   sub al,30h
   mov ah,bl
   aad
   mov cl,al
   mov bh,00h 
   mov bl,01h
   mov n1,al 
   
l2: mov al,n1 
    mov ah,00h
	div bl 
	cmp ah,00h
	JNE l1
	inc bh
	
l1: inc bl 
    loop l2 
	cmp bh,02h 
	JE prime 
	mov ah,09h 
	lea dx, m3 
	int 21h 
	JMP exit
	 
prime : mov ah,09h 
        lea dx,m2 
        int 21h 
exit: mov ah,4ch
      int 21h
end	  
   
  
    