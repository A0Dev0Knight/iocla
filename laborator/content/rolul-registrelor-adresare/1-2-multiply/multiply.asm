%include "../utils/printf32.asm"

; https://en.wikibooks.org/wiki/X86_Assembly/Arithmetic

section .data
    num1 db 43
    num2 db 39
    num1_w dw 1349
    num2_w dw 9949
    num1_d dd 134932
    num2_d dd 994912

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; Multiplication for db
    mov al, byte [num1]
    mov bl, byte [num2]
    mul bl

    ; Print result in hexa
    PRINTF32 `Rezultatul este: 0x%hx\n\x0`, eax


   ; TODO: Implement multiplication for dw and dd data types.
    xor eax, eax
    xor edx, edx
    mov ax, word [num1_w]
    mov bx, word [num2_w]
    mul bx

    ; Print result in hexa
    shl edx, 16
    or eax, edx
    PRINTF32 `Rezultatul este: %d\n\x0`, eax


    mov eax, dword [num1_d]
    mov ebx, dword [num2_d]
    mul ebx

    ; Print result in hexa
    PRINTF32 `Rezultatul este: eax\t %d\n\x0`, eax
    PRINTF32 `Rezultatul este: edx\t %d\n\x0`, edx

    leave
    ret
