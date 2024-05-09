%include "../utils/printf32.asm"

%define ARRAY_SIZE 10

section .data
    big_numbers_array dd 20000001, 3000000, 3000000, 23456789, 56789123, 123456789, 987654321, 56473829, 87564836, 777777777
    low_bits dd 0
    high_bits dd 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    xor ebx, ebx
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor ebx, ebx

add_dword_array_element:
    xor edx, edx
    mov ebx, dword [big_numbers_array + 4 * ecx - 4]
    mov ebx, dword [big_numbers_array + 4 * ecx - 4]
    mul ebx ; Compute array element square.
    add [low_bits], ebx ; Add lowest 32 bits of squared element to final result.
    adc [high_bits], edx ; Add higher 32 bits of squared element with carry to final result.
    loop add_dword_array_element ; Decrement ecx, if not zero, go to next element.

    PRINTF32 `Array sum is %lld\n\x0`, [low_bits], [high_bits]

    leave
    ret
