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

#ifdef	__cplusplus
}
#endif

#endif	/* _CONFIG_H */