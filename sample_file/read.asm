section .bss
    buf_read    resb 2048
section .data
    filename  db "/etc/passwd",0

section .text
    global _start
_start:
; OPEN FILE
    mov rax, 2
    lea rdi, [filename]
    xor rsi, rsi
    mov rdx, 0644
    syscall
    mov r12, rax
; READ FILE
    xchg rdi, rax
    mov rax, 0
    lea rsi, [buf_read]
    mov rdx, 2048
    syscall
; WRITE SCREEN
    mov rax, 1
    mov rdi, 1
    lea rsi, [buf_read]
    mov rdx, 2048
    syscall
; CLOSE
    mov rax, 3
    mov rdi, r12
    syscall
; EXIT
    mov rax, 60
    xor rdi, rdi
    syscall
