%include "../utils/printf32.asm"

%define ARRAY_SIZE 10

section .data
    dword_array dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp
    xor ebx, ebx

    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor edx, edx

add_dword_array_element:
    push ebx
    mov ebx, dword [dword_array + 4 * ecx - 4]
    mov edx, dword [dword_array + 4 * ecx - 4]
    mul edx
    mov edx, ebx
    pop ebx
    add ebx, edx
    loop add_dword_array_element

    PRINTF32 `Array sum is %u\n\x0`, ebx

    leave
    ret
