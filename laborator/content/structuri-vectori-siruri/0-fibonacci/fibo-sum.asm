%include "printf32.asm"

section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    sum_print_format db "Sum first %d fibonacci numbers is %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    xor eax, eax     ;store the sum in eax
    
    ; printf 1 ;asta pt 0
    ; printf 1 ;asta pt 1
    mov ebx, 0
    mov eax, 1

    mov ecx, 2
    cmp N, 2
    jz outus
fibus:
    ; conditia de iesire
    cmp ecx, N
    jz outus
    ; use loop instruction
    ; il pun pe eax in stiva
    push eax
    ; adun la eax ce e inainte
    add eax, ebx
    pop ebx
    inc ecx
    jmp fibus

outus:
    push eax
    push dword [N]
    push sum_print_format
    call printf
    add esp, 12

    xor eax, eax
    leave
    ret
