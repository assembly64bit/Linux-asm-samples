# Linux-asm-samples for ( Education And Research )
Minimal Linux syscall samples for SOC training, RE beginners, CTF players, and low‑level developers.
Pure syscalls — no libc.

---

## Purpose
This repository provides clean, minimalistic x86_64 Linux assembly samples using raw syscalls.
Suitable for:
- SOC detection labs
- malware analysis training
- red‑team research
- CTF and syscall learning
- developers studying Linux ABI

All samples are **safe** and use only basic syscalls (open, read, write, socket, connect, bind, etc.).

---

## Included Samples
### File I/O
- read_file.asm
- write_file.asm

### Networking
- connect.asm
- send.asm
- recv.asm
- reverse_shell.asm
- bind_listen_accept.asm

---

## Build
NASM + LD:

nasm -f elf64 sample.asm -o sample.o
ld sample.o -o sample
./sample

---

## Testing Guide

### Test connect / send / recv / reverse shell
Terminal A:
nc -lvp 4444

Terminal B:
./sample

### Test bind_listen_accept
Terminal A:
./bind_listen_accept

Terminal B:
nc 127.0.0.1 4444

---

## Disclaimer
All samples are for educational and research purposes only.
This repository does not provide or promote malware.
Everything here demonstrates syscall behavior in a controlled environment.
