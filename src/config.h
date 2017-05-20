/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#ifndef _CONFIG_H
#define _CONFIG_H

#ifdef	__cplusplus
extern "C" {
#endif

// With a processor clock of 1MHz and 2:1 prescaler, PR2 0x65 gives
// us a 8.16ms PWM period (aka 1.2KHz)
#define SET_TMR2_PS (1)         // 2:1 prescale
#define SET_PR2 (0x65)          // Gives us 8-bit resolution on the duty cycle
#define SET_IRCF (0b1011)       // 1MHz
#define _XTAL_FREQ (1000000)    // 1MHz

// System configuration
#if defined(_12F1501) || defined(_12LF1501)
#pragma config CLKOUTEN = OFF   // Clock out enable
#pragma config BOREN = OFF      // Brown-out detect off
#pragma config CP = OFF         // Code EEPROM protection
#pragma config MCLRE = ON       // !MCLR disable
#pragma config PWRTE = ON       // Power up timer disable
#pragma config WDTE = OFF       // Watchdog timer disable
#pragma config FOSC = INTOSC    // Internal clock
#pragma config LPBOR = OFF      // Low-power brownout
#pragma config BORV = 1         // Brown out reset voltage (low trip point)
#pragma config STVREN = ON      // Stack over/underflow causes reset
#pragma config WRT = 0b11       // Write protection off
#else
#error This code is designed for a PIC12F1501 or PIC12LF1501!
#endif

#ifdef	__cplusplus
}
#endif

#endif	/* _CONFIG_H */