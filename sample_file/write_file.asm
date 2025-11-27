section .data
        buf_write       db "Hello world !!!", 0
        len_buf_write   equ $ - buf_write

        filename        db "text.txt",0
section .text
        global _start
_start:
; OPEN
        mov rax, 2
        lea rdi, [filename]
        mov rsi, 0x241
        mov rdx, 0644
        syscall
        xchg r12, rax                   ; save fd
; WRITE
        mov rax, 1
        mov rdi, r12
        lea rsi, [buf_write]
        mov rdx, len_buf_write-1
        syscall
; CLOSE
        mov rax, 3
        mov rdi, r12
        syscall
; EXIT
        mov rax, 60
        xor rdi, rdi
        syscall
