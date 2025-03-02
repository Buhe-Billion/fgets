;DESCRIPTION                : Demonstrates calls made into libc, using NASM to fgets().
;                           :
;Architecture               : X86-64
;CPU                        : Intel® Core™2 Duo CPU T6570 @ 2.10GHz × 2
;NASM                       : 2.14.02
;GCC                        : gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
;
;
;------------------------------------------------------------------------------------------------------------------

SECTION .data

MSG: DB "You just entered: %s."


;------------------------------------------------------------------------------------------------------------------

SECTION .bss

BUFFER: RESB 16
BUFFLEN EQU $-BUFFER


;------------------------------------------------------------------------------------------------------------------

SECTION .text

EXTERN printf, stdin, fgets
GLOBAL main

main:
PUSH RBP                      ;Prolog
MOV RBP,RSP

MOV RDI,BUFFER
MOV RSI,BUFFLEN
MOV RDX,[stdin]
CALL fgets

;Display the entered chars:

MOV RDI,MSG
MOV RSI,BUFFER
MOV RAX,0
CALL printf

POP RBP                           ;Epilog
RET                               ;Auf Wiedersehen
