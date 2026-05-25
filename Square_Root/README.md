# Floating-Point Square Root (MIPS Assembly)

This project demonstrates the use of the MIPS Floating Point Unit (FPU) by calculating the square root of a given floating-point number.

## Project Overview

The primary function implements Heron's iteration formula (also known as the Newton-Raphson method) to calculate the square root. The algorithm continuously refines the result until the change between iterations is less than `0.00001`. Additionally, the project features an implementation of the famous "Fast Inverse Square Root" algorithm, utilized in 3D graphics engines, to efficiently approximate `1/sqrt(x)` using direct bit-level manipulation.

## Technical Standards

* **FPU ABI Compliance**: Adheres strictly to floating-point calling conventions, utilizing `$f12` for function arguments and `$f0` for return values.
* **Constant Memory Loading**: Demonstrates proper handling of floating-point constants (such as `1.0` or `0.5`) by defining them in the `.data` segment and moving them to coprocessor registers via the `lwc1` instruction.
* **FP Control Flow**: Utilizes dedicated floating-point comparison instructions (`c.lt.s`) and condition flags for loop evaluations, rather than standard integer branching.
* **Bitwise Cross-Register Operations**: Employs `mfc1` and `mtc1` to transfer exact 32-bit representations between integer and FPU registers without type conversion, enabling fast bitwise operations on floating-point data.
