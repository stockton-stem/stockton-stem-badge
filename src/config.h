/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#ifndef _CONFIG_H
#define _CONFIG_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif


// With a processor clock of 1MHz and 2:1 prescaler, PR2 0x65 gives
// us a 16.26ms PWM period (aka ~600Hz)
#define SET_TMR2_PS (1)         // 4:1 prescale
#define SET_PR2 (0x65)          // Gives us 8-bit resolution on the duty cycle
#define SET_IRCF (0b1011)       // 1MHz
#define _XTAL_FREQ (1000000)    // 1MHz

// Values for Timer1
#define SET_TMR1_CS (0b11)      // LFINTOSC = 31KHz
#define SET_TMR1_SYNC (0b1)     // Use clock directly (no sync)
#define SET_TMR1_PS (0b00)      // 1:1 prescaler
#define TMR1_COUNT_MAX (62000)  // Interrupt every 2 seconds
#define TMR1_INTERVAL (TMR1_COUNT_MAX/31000)
#define SET_TMR1_RESET_LSB ((uint8_t)((65536-TMR1_COUNT_MAX) & 0x00ff))
#define SET_TMR1_RESET_MSB ((uint8_t)((65536-TMR1_COUNT_MAX) >> 8))

#define RESET_TMR1() do { \
        TMR1H = SET_TMR1_RESET_MSB; \
        TMR1L = SET_TMR1_RESET_LSB; \
        TMR1IF = 0; \
    } while (0)

#define DISABLE_TMR1() do { \
        TMR1IE = 0; \
        TMR1IF = 0; \
    } while (0)

//#define RUN_INTERVAL (300)      // 5 minutes run time before sleep
#define RUN_INTERVAL (30)      // debugging: 30 seconds run time before sleep


// Values for Timer0
#define SET_TMR0_CS (0b0)       // Internal clock (Fosc/4)
#define SET_TMR0_PS (0b101)     // 1:64 prescaler

#define RESET_TMR0() do { \
        TMR0 = 0; \
        TMR0IF = 0; \
        TMR0IE = 1; \
    } while (0)

#define DISABLE_TMR0() do { \
        TMR0IE = 0; \
        TMR0IF = 0; \
    } while (0)


#ifdef	__cplusplus
}
#endif

#endif	/* _CONFIG_H */