# 🛰️ Linux x86_64 Network Syscall Samples

Minimal ASM samples for training SOC, malware analysts, redteamers, and CTF beginners.  
No libc, no padding — pure raw syscalls for clarity and detection research.

## 📦 Included Samples

### 🔹 `connect.asm`
Create a TCP socket and connect to a remote host.  
Demonstrates:
- `socket` (41)
- `connect` (42)
- `exit` (60)

---

### 🔹 `send.asm`
Connect to a server and send a small buffer (`"hello\n"`).  
Demonstrates:
- `socket`
- `connect`
- `sendto` (44)
- `exit`

---

### 🔹 `recv.asm`
Connect then receive data into a buffer.  
Useful for minimal C2 / testing network I/O.  
Demonstrates:
- `socket`
- `connect`
- `recvfrom` (45)
- `exit`

---

### 🔹 `reverse_shell.asm`
Minimal reverse shell (connect → dup2 → execve).  
Compact example used for analysis & detection signatures.  
Demonstrates:
- `socket`
- `connect`
- `dup2` (33)
- `execve` (59)

---

### 🔹 `bind_listen_accept.asm`
Create a bind shell server: bind → listen → accept.  
Foundation for understanding server-side network behavior.  
Demonstrates:
- `socket`
- `bind` (49)
- `listen` (50)
- `accept` (43)
- `sendto` / `recvfrom`
- `exit`

---

## 🛠️ Build

```bash
nasm -f elf64 sample.asm -o sample.o
ld sample.o -o sample
./sample
