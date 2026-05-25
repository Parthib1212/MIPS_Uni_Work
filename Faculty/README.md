# Factorial via Delayed Branching (MIPS Assembly)

This project implements an iterative factorial function while actively exploiting MIPS processor pipelining mechanics, specifically delayed branching.

## Project Overview

To increase instruction throughput, MIPS processors execute the instruction immediately following a jump or branch before the branch actually takes effect (the "delay slot"). This program calculates the factorial of a user-inputted integer by strategically placing necessary calculation steps inside these delay slots.

## Technical Standards

* **Pipeline Optimization**: The loop decrements the counter within the delay slot of the `bne` (branch not equal) instruction, and executes the multiplication within the delay slot of the unconditional `j` (jump) instruction.
* **Stack Integrity**: Ensures that the return address (`$ra`) is properly secured on the stack by the main function before executing any `jal` instructions, preserving the execution path.

## Simulator Configuration (Required)

Because this code explicitly relies on pipeline mechanics, it requires specific emulator settings to function correctly in **MARS 4.5**.
* You **must** navigate to `Settings` and check `Delayed Branching`. 
* If this setting is not enabled, MARS will ignore the instructions in the delay slots, resulting in incorrect calculations without generating any error messages.
