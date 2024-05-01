.model small
.stack 64
.data
    TXT1     db 'Operación de división de 2 dígitos:$'
    mensaje1 db 13,10,'Ingrese el primer número: $'
    num1     db 0
    mensaje2 db 13,10,'Ingrese el segundo número: $'
    num2     db 0
    TXT3     db 13,10, 'El resultado de la división es: $'
    resultado_division db 0
.code

operacion proc far
    mov ax, @data
    mov ds, ax

    ; Imprimir texto de la operación
    lea dx, TXT1
    mov ah, 9h
    int 21h

    ; Preguntar y leer primer número
    lea dx, mensaje1
    mov ah, 9h
    int 21h

    mov ah, 01
    int 21h
    sub al, 30h
    mov num1, al

    ; Preguntar y leer segundo número
    lea dx, mensaje2
    mov ah, 9h
    int 21h

    mov ah, 01
    int 21h
    sub al, 30h
    mov num2, al

    ; Dividir los dos números
    mov al, num1
    cbw                     ; Convertir a palabra (signo extendido)
    mov bl, num2
    xor ah, ah              ; Limpiar registro AH para la división
   4 bl                  ; AL = AL / BL, AH = AL % BL

    add al, 30h             ; Convertir resultado de división a ASCII
    mov resultado_division, al

    ; Imprimir texto del resultado de la división
    lea dx, TXT3
    mov ah, 9h
    int 21h

    ; Mostrar resultado de la división
    mov ah, 02
    mov dl, resultado_division
    int 21h

    ; Finalizar programa
    mov ah, 4ch
    int 21h
operacion endp
end operacion

