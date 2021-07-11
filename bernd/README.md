# BreadBin Emulation Runtime / Nearly Documented

For the BreadBin to be able to execute useful code, it can run BER/ND, which is an instruction-level
emulation of the 65C816 CPU. Execution speed is of course pretty slow compared to a real 65C816, 
but you would not expect top-performance from a bread with such short arms and legs. 
But as long as it gets the job done eventually, this is totally fine by me.

![alt text](../gallery/Logo.jpg "Bernd logo")

## Unsupported features

To keep the complexity down for the specific purpose of running C programs on the breadbin computer,
some rarely used features and unused features are ommited.

* Emulation mode
* Interrupts (and I flag)
* Decimal mode (and D flag)
* Overflow flag (V)

## Missing instructions

As a consequence of unsupported features, some opcodes would create a wrong result or are useless anyway.
These opcodes are by design missing from the Bernd emulator and will just cause an immediate processor halt. 

* BVC (branch if overflow clear)
* BVS (branch if overflow set)
* CLD (clear decimal)
* CLI (clear interrupt)
* CLV (clear overflow)
* COP (co-processor interrupt) 
* PHP (push processor status) 
* PLP (pull processor status) 
* REP with any operand execept $10, $20, $30
* RTI (return from interrupt)
* SED (set decimal)
* SEI (set interrupt)
* SEP with any operand execept $10, $20, $30
* WAI (wait for interrupt)

## Special handling of BRK

As it happens, the BRK instruction has the opcode $00. Executing this opcode causes the Bernd
emulator just to restart, which also resets the emulated 65c816 processor.


## Special use of XCE

Even though emulation is missing and the E flag is not implemented, programms still
need to be able to use the XCE instruction to get into native mode when running on a genuine
65C816 processor. 
To allow this, the XCE instruction when executed by Bernd, does not change anything 
on the emulation state. It always just directly sets the C flag, instead of setting it to the
previous emulation state (which would be 0 in native mode).
With this a program can detect when it is running in the Bernd emulator without additional 
preparations.

