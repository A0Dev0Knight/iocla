%include "../utils/printf32.asm"

section .data
    num dd 3

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, [num]     ; Use ecx as counter for computing the sum.
    xor ebx, ebx       ; Use ebx to store the sum. Start from 0.

add_to_sum:
    ; prepar inmultirea
    xor eax, eax
    xor edx, edx
    ; fac inmultirea
    mov eax, ecx
    mul ecx
    ; adun la suma
    add ebx, eax
    loop add_to_sum    ; Decrement ecx. If not zero, add it to sum.

    mov ecx, [num]
    PRINTF32 `Sum(%u): %u\n\x0`, ecx, ebx

    leave
    ret
