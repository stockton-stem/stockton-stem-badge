/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#include "config.h"
#include <xc.h>

// System configuration
// Include only once per project
#if defined(_12F1501) || defined(_12LF1501)
#pragma config CLKOUTEN = OFF   // Clock out enable
#pragma config BOREN = OFF      // Brown-out detect off
#pragma config CP = OFF         // Code EEPROM protection
#pragma config MCLRE = ON       // !MCLR disable
#pragma config PWRTE = ON       // Power up timer enable
#pragma config FOSC = INTOSC    // Internal clock
#pragma config LPBOR = OFF      // Low-power brownout
#pragma config BORV = 1         // Brown out reset voltage (low trip point)
#pragma config STVREN = ON      // Stack over/underflow causes reset
#pragma config WRT = 0b11       // Write protection off

#ifdef USE_WATCHDOG
#pragma config WDTE = ON        // Watchdog timer enable
#else /* USE_WATCHDOG */
#pragma config WDTE = OFF       // Watchdog timer disable
#endif /* USE_WATCHDOG */

#else
#error This code is designed for a PIC12F1501 or PIC12LF1501!
#endif
