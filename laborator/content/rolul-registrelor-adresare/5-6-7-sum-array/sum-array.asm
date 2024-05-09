%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    byte_array db 8, 19, 12, 3, 6, 200, 128, 19, 78, 102
    word_array dw 1893, 9773, 892, 891, 3921, 8929, 7299, 720, 2590, 28891
    dword_array dd 1392849, 12544, 879923, 8799279, 7202277, 971872, 28789292, 17897892, 12988, 8799201
    big_numbers_array dd 20000001, 3000000, 3000000, 23456789, 56789123, 123456789, 987654321, 56473829, 87564836, 777777777
section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor ebx, ebx            ; Use ebx to store the sum.
    xor edx, edx            ; Store current value in dl; zero entire edx.

add_byte_array_element:
    mov dl, byte [byte_array + ecx - 1]
    add ebx, edx
    loop add_byte_array_element ; Decrement ecx, if not zero, add another element.

    PRINTF32 `Array sum is %u\n\x0`, ebx


    ; TODO: Compute sum for elements in word_array and dword_array.
    xor ebx, ebx            ;golesc ebx ca sa retin suma
    xor edx, edx            ; Store current value in dx; zero entire edx.
    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.

add_word_array_element:
    mov dx, word [word_array + 2*ecx - 2]
    add ebx, edx
    loop add_word_array_element

    PRINTF32 `Array of words sum is %d\n\x0`, ebx
 

    xor ebx, ebx            ;golesc ebx ca sa retin suma
    xor edx, edx            ; Store current value in dx; zero entire edx.
    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.

add_dword_array_element:
    mov edx, dword [dword_array + 4*ecx - 4]
    add ebx, edx
    loop add_dword_array_element

    PRINTF32 `Array of dwords sum is %d\n\x0`, ebx
 
    leave
    ret
