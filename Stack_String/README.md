# Stack String and Memory Alignment

This project demonstrates low-level memory manipulation by copying a string from the static `.data` segment directly onto the execution stack, calculating its length, and printing it from stack memory.

## Project Overview

]The program dynamically handles strings of any length without requiring hardcoded modifications. It is divided into three core functions:
**`main`**: Manages stack allocation, executes a byte-by-byte copy loop, and correctly stores a word-aligned integer alongside the string data on the stack.
**`strlen`**: A leaf function that iterates through the string to locate the null-terminator (`\0`) and returns the exact character count.
**`printit`**: Accepts the stack pointer address and outputs the dynamically copied string using a single Syscall.

## Technical Standards

**Memory Alignment**: Implements strict 4-byte boundaries for word storage on the stack while managing unaligned byte data, preventing Address Exception errors.
**Byte-Level Access**: Utilizes `lb` (load byte) and `sb` (store byte) for granular string manipulation rather than standard word instructions.
**Instruction Strictness**: Written entirely with native MIPS instructions; the use of pseudo-instructions (like `li`) is intentionally restricted, with the sole exception of `la` for address loading.
