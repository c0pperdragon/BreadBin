# BreadBin
A CPU made of 7400 logic on breadboards - inside a bread bin ;-) 



## On bread boards

Since a very long time I wanted to design my own CPU and build it from smaller parts, preferable 
on bread boards. My main problem with the approach were my bad experiences with bread boards as a whole,
as they seemed to be too unreliable for anything more serious than arduino tinkering.
As it turns out it is only a matter of using high-quality boards and cabling to get a reliably working
build. The boards I now use (made by BusBoard) are quite expensive, but worth every penny and never 
gave me any trouble.

## Which 7400 logic?

When using this kind of setup it is important to also use a matching logic family of chips. 74AC, 74ACT, 74LVC or 
others have a very fast switching characteristics. This is great for many applications but in a large build with
long and unshielded cables, their brutally steep signal edges wreck havoc with signal integritiy.
So I settled for the moderately fast and well-behaved 74HC logic ICs.

## Speed

To make this project uniquely my own and not merely a copy of one of the existing other projects out there,
I wanted to create the fastest possible bread board machine I can. If it is necessary to completely deassemble
the control logic and to modify the whole instruction set to save just 10 ns, I will do it (did yesterday).
Also I will use any possible trick I can ever think of without compromising the spirit of the challenge.

## Computer case

With the CPU already built so nicely on an actual wodden board, I had the idea to actually put it together with
the rest of the computer into a matching bread bin. Because the machine will not require and ventilation this
will keep the dust out quite reliably.
