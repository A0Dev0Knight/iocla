%include "../utils/printf32.asm"

%define NUM_FIBO 10

section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    sub esp, NUM_FIBO * 4

    mov ecx, NUM_FIBO

    mov dword [esp], 0 ; primul element
    mov dword [esp + 4], 1 ; al doilea elment
    mov dword [esp + 8], 1 ; al doilea elment
    mov dword [esp + 12], 2 ; al doilea elment
    mov dword [esp + 16], 3 ; al doilea elment
    mov dword [esp + 20], 5 ; al doilea elment
    mov dword [esp + 24], 8 ; al doilea elment
    mov dword [esp + 28], 13 ; al doilea elment
    mov dword [esp + 32], 21 ; al doilea elment
    mov dword [esp + 36], 34 ; al doilea elment

print:
    mov eax, dword [esp + (ecx - 1) * 4]
    PRINTF32 `%d \x0`, eax
    dec ecx
    cmp ecx, 0
    ja print

    PRINTF32 `\n\x0`
    mov esp, ebp
    xor eax, eax
    ret
