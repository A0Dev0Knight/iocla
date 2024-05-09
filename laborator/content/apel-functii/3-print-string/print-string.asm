%include "../utils/printf32.asm"

section .data
    mystring db "This is my string", 0
    hello db "Hello, World!", 0

section .text

extern puts
extern printf
global main
main:
    push ebp
    mov ebp, esp

    PRINTF32 `[PRINTF32]: %s\n[PUTS]: \x0`, mystring


    ; TODO: call puts on string
    push hello
    call puts
    add esp, 4
    
    leave
    ret
