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

        sub rsp, 16
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
loop_recv:
; RECV
        mov rax, 45
        mov rdi, r12
        lea rsi, [buf_recv]
        mov rdx, 512
        syscall

        test rax, rax
        jl loop_recv
; WRITE
        mov rax, 1
        mov rdi, 1
        lea rsi, [buf_recv]
        mov rdx, 512
        syscall
; CLOSE
        mov rax, 3
        xchg rdi, r12
        syscall
; EXIT
        mov rax, 60
        xor rdi, rdi
        syscall
