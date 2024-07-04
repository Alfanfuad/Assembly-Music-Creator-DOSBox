.model small

.stack 200h

.data

    HELLO db 'Hello, World!', '$'

.code

.startup

    mov DX, offset HELLO

    mov AH, 09h

    int 21h

.exit

END