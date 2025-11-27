# File Samples (Linux x86_64)

Minimal safe syscall samples for reading and writing files.
Useful for SOC testing, malware analysis training, and syscall research.

## Included
- `read.asm` — open → read → write → close → exit
- `write.asm` — open/create → write → close → exit

## Syscalls used
- `open`   (2)
- `read`   (0)
- `write`  (1)
- `close`  (3)
- `exit`   (60)
