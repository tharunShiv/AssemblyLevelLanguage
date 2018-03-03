;ALP to point cursor to a specifies row and column
.model small

.data
  r db ?
  c db ?
  m1 db 10, 13, 'Enter row $'
  m2 db 10, 13, 'Enter column $'
  
.code
  mov ax, @data
  mov ds, ax
  