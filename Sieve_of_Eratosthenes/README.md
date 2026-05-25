# Sieve of Eratosthenes (MIPS Assembly)

This repository contains a MIPS assembly implementation of the Sieve of Eratosthenes. The program is designed to efficiently identify and output all prime numbers up to a specified limit of 1000.

## Project Overview

The algorithm relies on a global integer array, `sieve[1000]`, to track prime candidates. The logic is divided into distinct functions to maintain modularity and adherence to low-level programming best practices:

* **`init_array`**: Initializes the array by setting all elements to `1` (potentially prime), and then explicitly marks indices 0 and 1 as non-prime.
* **`eliminate_multiples`**: Accepts a factor and iteratively marks all multiples of that factor as `0` within the array.
* **`next_prime`**: Scans the array to locate and return the next index greater than the current prime that still holds a value of `1`.
* **`print_primes`**: Traverses the fully processed array and prints every index where the value remains `1`.

## Technical Standards

The implementation strictly follows the MIPS Application Binary Interface (ABI) conventions.

* **Register Allocation**: The `current_prime` variable is maintained in the saved register `$s0`. Function arguments, such as the factor to eliminate, are passed via `$a0`. Function return values, such as the next prime found, are passed via `$v0`.
* **Stack Memory Management**: Functions that utilize `jal` for internal calls correctly preserve the return address (`$ra`) and any used saved registers (`$s0`) on the stack prior to execution.
* **Syscall Handling**: Standard syscalls are used for console output, and temporary registers are managed carefully, as syscalls can overwrite temporary data.

## Execution Instructions

This program is designed to be executed within the **MARS 4.5** simulator environment.

1. Open **MARS 4.5** on your system.
2. Load the `.asm` source file.
3. Assemble the program using the **F3** shortcut.
4. Run the program using the **F5** shortcut.
5. Observe the Run I/O console for the printed sequence of prime numbers.
