%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6                      ; N = valoarea registrului ecx
    mov eax, 1
    mov ebx, 1
    cmp eax, ebx
    jz print                        ; TODO1: eax > ebx? - done
    ret

print:
    cmp ecx, 0
    je endHello
    PRINTF32 `%s %d\n\x0`, myString , ecx
                                    ; TODO2.2: afisati "Hello, World!" de N ori - done
                                    ; TODO2.1: afisati "Goodbye, World!" - done
   
    dec ecx
    jmp print
    ret

endHello:
    PRINTF32 `Goodbye, World!\n \x0`
    ret