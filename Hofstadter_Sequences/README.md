# Hofstadter Female-Male Sequences

This project implements mutual recursion in MIPS assembly, computing the Hofstadter Female and Male sequences. 

## Project Overview

The program utilizes two interdependent functions, `male(n)` and `female(n)`, which continuously call one another to calculate sequence values:
* **Base Cases**: `male(0) = 0` and `female(0) = 1`.
* **Recursive Cases**: For `n > 0`, `male(n) = n - female(male(n-1))` and `female(n) = n - male(female(n-1))`.

The main program loop calculates and clearly prints both sequence values for integers 0 through 10.

## Technical Standards

* **Inter-Function State Preservation**: Because neither function is a leaf function, both must establish dedicated stack frames to preserve their respective return addresses (`$ra`) and state arguments (`$a0`) before yielding control to each other.

## Simulator Configuration (Required)

Due to the extreme depth of mutual recursion, this program generates a massive number of nested calls. 
* To run this successfully in the MARS simulator, you **must** increase the instruction limit.
* Navigate to `Settings -> Maximum number of steps` and increase the threshold significantly (above the default 500,000) to prevent premature execution termination.
