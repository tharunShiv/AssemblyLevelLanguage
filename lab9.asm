; To display date at the center of the screen
.model small
print macro 
  mov dl, '\'
  mov ah, 02h
  int 21h
endm

.data
  year dw ?
  month db ?
  date db ?
  
.code
  mov ax, @data
  mov ds, ax
  
  mov ax, 0600h ;To make the screen go blank with colors
  mov bh, 0edh
  mov cx, 0000h
  mov dx, 184fh
  int 10h
  
  mov ah, 02h
  mov bh, 00h
  mov dl, 39d
  mov dh, 12d
  int 10h
  
  mov ah, 2ah
  int 21h
  
  mov year, cx 
  mov month, dh
  mov date, dl
  
  mov al, date 
  mov ah, 00h 
  call display
  print 
  
  mov al, month 
  mov ah, 00h 
  call display
  print
   
  mov ax, year
  call display 
  mov ah, 4ch
  int 21h 
  
  display proc near 
    mov cx, 00h
    mov bx, 10d
    	
l1 : mov dx, 00h
   div bx 
   push dx
   inc cx
   cmp ax, 00h 
   JNZ l1 
   
l2 : pop dx
  add dl, 30h
  mov ah, 02h
  int 21h 
  loop l2 
  RET 
  display endp
end