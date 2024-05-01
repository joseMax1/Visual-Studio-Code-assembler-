.model small
.stack 64
.data
;declaramos las variables
    TXT1     db 'Suma de 2 digitos:$'
    mensaje1 db 13,10,'Ingrese el primero numero$'
    num1     db 0
    mensaje2 db 13,10,'Ingrese el segundo numero:$'
    num2     db 0
    TXT2     db 13,10, 'El numero resultante es: $'
    suma     db 0
.code

    ; metedo principal
operacion proc far
              mov ax,@data
              mov ds,ax

    ; # vamos a imprimir el texto 1
              lea dx, TXT1
              mov ah, 9h
              int 21h
    ; mostar pregunta 1 / lectura de datos
              lea dx, mensaje1
              mov ah, 9h
              int 21h

              mov ah, 01          ;lee
              int 21h
              sub al,30h          ; convertir de caracter numerico a valor numerico

              mov num1,al         ; guardar valor (movemos el #1 valor a la variable #1)
    

    ;mostar pregunta#2/lectura de datos

              lea dx, mensaje2
              mov ah, 9h
              int 21h

              mov ah, 01
              int 21h
              sub al,30h
              mov num2,al

    ; mostar texto2
              lea dx, TXT2
              mov ah, 9h
              int 21h
    ;operaciones

              mov al,num1
              add al,num2
              add al,30h
              mov suma,al


    ;ejecutar y mostar suma resultante

              mov ah,02
              mov dl,suma
              int 21h


              mov ah,4ch          ; finalizar programa
              int 21h
.exit


    
operacion endp
end operacion