%include "../utils/printf32.asm"

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX
    xor edx, edx ; contorul meu
powerLoop:
    cmp edx, 33
    jz exit
    
    mov ecx, eax ; pun ce e in eax in ecx mereu
    and ecx, ebx ; fac and logic intre o putere a lui 2 si numarul meu
    
    cmp ecx, 0 ; daca e zero nu printez
    jz skip
    PRINTF32 `puterea %d\n\x0`, ecx ; printez puterea lui 2
skip:
    shl ebx, 1 ; shiftez bitul la stanga cu o unitate pt urmatoarea putere a numarului
    inc edx
    jmp powerLoop
exit:
    leave
    ret
