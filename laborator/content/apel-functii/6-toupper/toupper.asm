section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "aBcdefghij", 0

section .text

extern printf
global main

toupper:
    push ebp
    mov ebp, esp

    xor ecx, ecx
    mov ebx, [ebp + 8] ; sirul meu

    ; TODO
while:
    mov al, [ebx + ecx]

    cmp al, 0
    je quit ; quit if at the end

    cmp al, 0x61
    jl skip ; daca e mai jos de a quit
    cmp al, 0x7a
    ja skip ; daca e mai mare de z quit

    sub al, 0x20
    mov byte [ebx + ecx], al
skip:
    inc ecx
    jmp while

quit:
    leave
    ret

main:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
