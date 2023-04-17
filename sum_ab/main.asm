; Reads an input in format "<int> <int>" 
; Prints the sum of these numbers
bits 64

section .bss
    input:          resb 256     ; 256 bytes reserved for input
    max_input_size: equ $- input

section .data
    message: db "%s", 10, 0

section .text
global main
extern printf

main:
    ; from https://filippo.io/linux-syscall-table/
    mov     rax, 0  ; sys_read
    lea     rbx, [rel input]
    mov     rsi, rbx
    mov     rdx, max_input_size
    mov     rbx, 0  ; stdin
    syscall

    ; split and calculate
    ; TODO

    ; print result
    lea     rax, [rel message]  ; loading message relative address to rax
    lea     rbx, [rel input]

    push    rbp         ; create stack frame
    mov     rdi, rax
    mov     rsi, rbx
    mov     rax, 0
    call    printf wrt ..plt

    pop     rbp

    mov     rax, 0  ; exit code 0
    ret
