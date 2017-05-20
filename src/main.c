/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#include "config.h"
#include <xc.h>
#include "badge.h"

/* Initialize the hardware
 *
 * RA0, 2, 4 and 5 are outputs attached to LEDs
 * RA1 and 3 are currently unused, though attached to the ICSP header.
 */
void init(void)
{
    OSCCONbits.IRCF = SET_IRCF; // Set the clock speed
    OSCCONbits.SCS = 0b11;      // Internal clock
    WDTCON = 0;         // Make sure watchdog is disabled

    // Setup the I/O
    OPTION_REG = 0x00;  // No timers, no interrupts, enable weak pullups
    ANSELA = 0x00;      // All lines are digital
    LATA = 0x000;       // Make sure all outputs are low
    WPUA = 0x0a;        // RA1,3 have weak pullups
    TRISA = 0x1f;       // everything is an input for now

    // Setup PWM
    PWM1CON = PWM2CON = PWM3CON = PWM4CON = 0;

    // Set the PWM period
    PR2 = SET_PR2;
    
    // Reset PWM values
    PWM1DCH = PWM1DCL = 0;
    PWM2DCH = PWM2DCL = 0;
    PWM3DCH = PWM3DCL = 0;
    PWM4DCH = PWM4DCL = 0;

    // Set the timer up for PWM operation
    TMR2IF = 0;
    T2CONbits.T2CKPS = SET_TMR2_PS; // Timer 2 16:1 prescale
    T2CONbits.TMR2ON = 1;   // Timer 2 on
    
    while(!TMR2IF) { /* Wait for Timer 2 */
        continue;
    }
    
    TRISA = 0x0a;       // RA0,2,4,5 are outputs, RA1,3 are inputs
    PWM1EN = PWM2EN = PWM3EN = PWM4EN = 1;
    PWM1OE = PWM2OE = PWM3OE = PWM4OE = 1;

    /* Let it all settle */
    __delay_ms(10);
}

void main(void) {
    // Initialize the peripherals
    init();
    
    while (1) {
        // Iterate on badge animation forever
        badge_iterate();
    }

    return;
}
