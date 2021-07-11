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

As a consequence of unsupported features, some opcodes would result in a wrong behaviour.
These opcodes are by design missing from the Bernd emulator and will just cause an immediate processor halt. 

* BVC (branch if overflow clear)
* BVS (branch if overflow set)
* COP (co-processor interrupt) 
* PHP (push processor status) 
* PLP (pull processor status) 
* RTI (return from interrupt)
* SED (set decimal)
* SEP attempting to set decimal mode
* WAI (wait for interrupt)
* XCE attempting to turn on emulation

## Special handling of BRK

As it happens, the BRK instruction has the opcode $00. Executing this opcode causes the Bernd
emulator just to restart, which also resets the emulated 65c816 processor.


## Special use of XCE

Even though emulation is missing and the E flag is not implemented, programms still
need to be able to use the XCE instruction to get into native mode when running on a genuine
65C816 processor. 
To allow this, the XCE instruction when executed by Bernd, is only permitted
to turn off emulation and it will otherwise halt execution.
Additionally it is permitted to turn off emulation repeatedly in which case
the resulting C flag will always be set in the Bernd environment (contrary to 
what it would do on the real processor). 
With this a program can detect when it is running in the Bernd emulator without additional 
preparations.
