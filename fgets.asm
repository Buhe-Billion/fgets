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

BUFFER: RESB 20
BUFFLEN EQU $-BUFFER


;------------------------------------------------------------------------------------------------------------------
