#include <avr/interrupt.h>
#include <avr/io.h>

/*
Input Frequency -> CLK=16MHz

Timer Resolution = (1 / (Input Frequency / Prescale)) = (Prescale / Input Frequency)

Prescaler Value | Resolution at 16MHz
              1 |  62.5nS
              8 |  0.6uS
             64 |  4uS
            256 |  16uS
           1024 |  64uS

Target Timer Count = (1 / (Target Frequency * 2)) / (Prescale / Input Frequency) - 1
                   = (Target Period / 2) / Timer Resolution - 1

If: Target Period = 125nseg.  ->  Target frequency = 8MHz
With prescaler = 1
Target Timer Count = (125nS/2)/62.5nS - 1 = 0
*/

//#define TMR1 1    //for 8MHz 
#define TMR1 15   //for 0.5 MHz

void setup() {
  pinMode(9, OUTPUT);

//********************************************************************* 
  //TIMER1 (16 bits) in mode TOP
  TCCR1B |= (1 << CS10);  //selecting prescaler 0b001 (Tclk/1)
  TCCR1B &= ~((1<<CS12) | (1<<CS11));    // turn off CS12 and CS11 bits

  TCCR1A |= ((1<<WGM11) | (1<<WGM10));  //Configure timer 1 for TOP mode (with TOP = OCR1A)
  TCCR1B |= ((1<<WGM13) | (1<<WGM12));

  TCCR1A |= (1 << COM1A0); // Enable timer 1 Compare Output channel A in toggle mode
  TCCR1A &= ~(1 << COM1A1);
  TCNT1 = 0;
 
  OCR1A = TMR1;
 
//*********************************************************************

}

void loop() {
}
