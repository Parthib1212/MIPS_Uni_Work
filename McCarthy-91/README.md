# McCarthy-91 Recursive Function

This project contains a MIPS assembly implementation of a recursive algorithm, specifically modeling the well-known McCarthy-91 function. 

## Project Overview

The core logic is handled by the `magic(n)` function, which evaluates an integer input against two mathematical conditions:
* If `n > 100`, the function returns `n - 10`.
* If `n <= 100`, the function returns `magic(magic(n + 11))`, demonstrating deep, nested recursion.

The main routine reads user input, calls the recursive function, and outputs the final evaluated result.

## Technical Standards

* **Stack Frame Management**: Demonstrates strict adherence to ABI conventions during recursive calls by independently securing the return address (`$ra`) and argument (`$a0`) on the stack for every nested execution level.
* **Control Flow**: Enforces the exclusive use of `jal` (jump and link) for all function invocations, avoiding arbitrary branch jumps to maintain a predictable call stack.
