.model small

.data 
s1 db 'college$'
l db ($-s1)
s2 db ?
.code
mov ax,@data
mov ds,ax
mov es,ax 
lea si,s1
lea di,s2 
mov cl,l 
cld
rep movsb 

mov ah,4ch
int 21h
end