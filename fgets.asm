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

MOV RDI,BUFFER              ;Address of BUFFER into RDI
MOV RSI,BUFFLEN             ;Put # of chars to enter into RDI
MOV RDX,[stdin]             ;Put value of stdin into RDX, notice that we use the addy of stdin
CALL fgets                  ;Call libc fn

;Display the entered chars:

MOV RDI,MSG                 ;Base string addy goes into RDI
MOV RSI,BUFFER              ;Data entry buffer's addy into RSI
MOV RAX,0                   ; We have 0 vector registers
CALL printf                 ; Call libc fn

POP RBP                           ;Epilog
RET                               ;Auf Wiedersehen
