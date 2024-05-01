.model small
.stack 
.data 
     nombre db 'nombre:$'
     nombre2 db 13,10,'Maximiliano Jose De Leon Cera$'
     numeroID db 13,10,'numero:$'
     numeroID2 db 13,10, '1003237429$'
.code

main proc
    mov ax,@data
    mov ds,ax

; # vamos a imprimir el texto 1
    lea dx, nombre
    mov ah, 09
    int 21h

    lea dx, nombre2
    mov ah, 09
    int 21h
; #  vamos a imprimir el texto 2 


 lea dx, numeroID
    mov ah, 09
    int 21h

    lea dx, numeroID2
    mov ah, 09
    int 21h


    mov ax, 4C00h
    int 21h
    
main endp

end main