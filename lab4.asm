.model small
.data
  buf1 db 100
  l db ?
  str db 100 dup (?)
  rstr db 100 dup (?)
  
  m1 db 10,13,' Enter STR1 $'
  m2 db 10,13,' Its Palindrome $'
  m3 db 10,13,' Its not a Palindrome $'
  
.code 
  mov ax, @data
  mov ds, ax
  mov es, ax
  
  mov ax, 0600h
  mov bx, 0edh
  mov cx, 0000h
  mov dx, 184fh
  int 10h
  
  lea dx, m1
  mov ah, 09h
  int 21h
  
  lea dx, buf1
  mov ah, 0ah
  int 21h
  mov cl, l
  mov ch, 00h
  lea si, str
  add si, cx
  dec si
  lea di, rstr
l1 : mov al, [si]
  mov [di], al
  dec si
  inc di
  loop l1
  lea si,str
  lea di, rstr
  CLD
  mov cl, l
  mov ch, 00h
  repe cmpsb
  JZ palin
  
  lea dx, m3
  JMP exit
palin : lea dx, m2
exit: mov ah, 09h
  int 21h
  mov ah, 4ch
  int 21h
end
    
  
