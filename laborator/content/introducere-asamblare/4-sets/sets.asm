%include "printf32.asm"

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139
    mov ebx, 169
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime


    ; TODO1: reuniunea a doua multimi
    mov edx, eax ; fac o copie la eax
    and edx, ebx ; reuniunea
    PRINTF32 `%u\n\x0`, edx ; afiseaza prima multime

    ; TODO2: adaugarea unui element in multime
    mov edx 64 ; exemplu de numar ce se va adauga in multime
    or eax, edx ; se adauga in multime
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    
    ; TODO3: intersectia a doua multimi
    xchg eax, ebx
    PRINTF32 `%u %u\n\x0`, eax, ebx ; afiseaza prima multime

    ; TODO4: complementul unei multimi
    xor edx, edx
    neg edx 
    xor edx, eax
    PRINTF32 `%u\n\x0`, edx ; afiseaza complementul primei multime

    ; TODO5: eliminarea unui element
    mov edx, 1 ; exemplu de scos din eax
    xor edx, eax ; s-a eliminat numarul din multime
    PRINTF32 `%u\n\x0`, edx ; afiseaza complementul primei multime

    ; TODO6: diferenta de multimi EAX-EBX
    mov edx ebx
    neg edx     ;neg pe ebx-ul meu
    and edx eax ; fac un si logic
    PRINTF32 `%u\n\x0`, edx ; afiseaza complementul primei multime


    xor eax, eax
    ret
