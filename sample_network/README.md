# 🛰️ Linux x86_64 Network Syscall Samples

Minimal Linux ASM samples for training SOC, malware analysts, redteamers, and CTF beginners.  
Pure raw syscalls — no libc, no wrappers — focusing on syscall behavior & structure packing.

---

## 📦 Included Samples

### 🔹 `connect.asm`
Create a TCP socket and connect to a remote host.

**Syscalls:**
- `socket` (41)
- `connect` (42)
- `exit` (60)

---

### 🔹 `send.asm`
Connect to a remote server and send `"hello\n"`.

**Syscalls:**
- `socket`
- `connect`
- `sendto` (44)

---

### 🔹 `recv.asm`
Connect then receive data into a buffer.

**Syscalls:**
- `socket`
- `connect`
- `recvfrom` (45)

---

### 🔹 `reverse_shell.asm`
Minimal reverse shell (connect → dup2 → execve).

**Syscalls:**
- `socket`
- `connect`
- `dup2` (33)
- `execve` (59)

---

### 🔹 `bind_listen_accept.asm`
Bind → listen → accept → serve a simple connection.

**Syscalls:**
- `socket`
- `bind` (49)
- `listen` (50)
- `accept` (43)

---

## 🛠️ Build

```bash
nasm -f elf64 sample.asm -o sample.o
ld sample.o -o sample
./sample
```

---

## 🧪 Testing Guide

### 🔥 1. Test `connect`, `send`, `recv`, `reverse_shell`

**Terminal A** — run listener:
```bash
nc -lvp 4444
```

In code, set:
- IP = `127.0.0.1`
- PORT = `4444`

Run sample:
```bash
./sample
```

**Expected results:**
- `connect.asm` → Terminal A reports incoming connection
- `send.asm` → Terminal A receives "hello"
- `recv.asm` → Sample receives data typed from Terminal A
- `reverse_shell` → Terminal A receives shell access

---

### 🔥 2. Test `bind_listen_accept`

Run sample first:
```bash
./bind_listen_accept
```

**Terminal B** — connect to it:
```bash
nc 127.0.0.1 4444
```

If sample sends/receives data → Terminal B will see it immediately.

---

## 📚 Purpose

These samples aim to be:

- **Minimal-by-design** → only raw syscalls (Most samples are 30–80 lines)
- **Readable** → explicit register usage
- **Educational** → focused on Linux networking syscalls
- **Practical** → great for SOC labs, detection R&D, malware analysis, CTF training

**Avoided completely:**
- libc
- dynamic linking
- wrappers

→ Output is pure, clean syscall behavior.

---

## 🧩 Notes

- Follows Linux x86_64 ABI
- All structs (`sockaddr_in`, etc.) are manually packed
- Samples useful for:
  - Low-level network research
  - C2 prototype logic
  - Implant development
  - Detection engineering
  - SOC analyst training
  - Syscall behavioral baselines

---

## 🤝 Contributions

PRs welcome for:
- Cleaner structure packing
- Clarity improvements
- Minimizing line count
- Adding new syscall samples
