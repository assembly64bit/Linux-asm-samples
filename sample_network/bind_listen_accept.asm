; NEED A CLIENT TO TEST
; USE nc 127.0.0.1 4444 to test
section .bss
        buf_recv        resb 512
section .data
        send_msg        db "Hello World !!!", 10,0
        len_send_msg    equ $ - send_msg

        send_msg_1        db "Done !!!", 10,0
        len_send_msg_1    equ $ - send_msg_1

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
        mov qword [rsp+16], 16
; BIND
        mov rax, 49
        mov rdi, r12
        lea rsi, [rsp]
        mov rdx, 16
        syscall
; LISTEN
        mov rax, 50
        mov rdi, r12
        mov rsi, 1
        syscall
; ACCEPT
        mov rax, 43
        mov rdi, r12
        lea rsi, [rsp]
        lea rdx, [rsp+16]
        syscall

        xchg r13, rax                   ; save fd
; SEND MSG
        mov rax, 44
        mov rdi, r13
        lea rsi, [send_msg]
        mov rdx, len_send_msg
        syscall
; RECV
loop_recv:
        mov rax, 45
        mov rdi, r13
        lea rsi, [buf_recv]
        mov rdx, 512
        syscall

        test rax, rax
        jl loop_recv

; SEND MSG
        mov rax, 44
        mov rdi, r13
        lea rsi, [send_msg_1]
        mov rdx, len_send_msg_1
        syscall

; CLOSE
        mov rax, 3
        xchg rdi, r12
        syscall
; EXIT
        mov rax, 60
        xor rdi, rdi
        syscall
