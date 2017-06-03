/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#include "pic_config.h"
#include "config.h"
#include <xc.h>
#include <stdint.h>
#include "badge.h"

// Incremented by a timer. Interval TBD.
volatile uint8_t tick = 0;

// Flag to indicate our time is up
volatile uint8_t want_to_sleep = 0;


/* Initialize the hardware.
 * 
 * Set the clock speed based on the values in config.h
 *
 * RA0, 2, 4 and 5 are outputs attached to LEDs. We want these to be PWM
 * driven outputs.
 * 
 * RA1 is a button. We want this to be an input with a weak pull-up. We also
 * want an interrupt to trigger if the input changes.
 * 
 * RA1 and 3 are also attached to the ICSP header.
 */
static void init(void) {
    OSCCONbits.IRCF = SET_IRCF; // Set the clock speed
    OSCCONbits.SCS = 0b11;      // Internal clock

    // Setup the I/O
    OPTION_REG = 0x00;  // No timers, no interrupts, enable weak pullups
    ANSELA = 0x00;      // All lines are digital
    LATA = 0x00;        // Make sure all outputs are low
    WPUA = 0x0a;        // RA1,3 have weak pullups
    TRISA = 0x1f;       // everything is an input for now

    // Setup interrupt-on-change for RA1
    IOCAF = IOCAP = 0x02; // IOC on rising edge of RA1
    IOCAN = 0x00;       // No IOC on any falling edge
    IOCIE = 1;
    IOCIF = 0;

    // Setup PWM
    PWM1CON = PWM2CON = PWM3CON = PWM4CON = 0;

    // Reset PWM values
    PWM1DCH = PWM1DCL = 0;
    PWM2DCH = PWM2DCL = 0;
    PWM3DCH = PWM3DCL = 0;
    PWM4DCH = PWM4DCL = 0;

    // Set the timer up for PWM operation
    TMR2IF = 0; // Reset counter
    PR2 = SET_PR2; // Set the PWM period
    T2CONbits.T2CKPS = SET_TMR2_PS; // Timer 2 4:1 prescale
    TMR2ON = 1;   // Timer 2 on
    
    while(!TMR2IF) { /* Wait for Timer 2 */
        continue;
    }
    
    TRISA = 0x0a;       // RA0,2,4,5 are outputs, RA1,3 are inputs
    PWM1EN = PWM2EN = PWM3EN = PWM4EN = 1;
    PWM1OE = PWM2OE = PWM3OE = PWM4OE = 1;

    // Setup Timer1 for our tick
    // This should give us an interrupt every 4 seconds
    T1CONbits.TMR1CS = 0b11;
    T1CONbits.T1CKPS = 0b11;
    T1CONbits.nT1SYNC = 0b1;
    TMR1GE = TMR1IF = 0;
    TMR1ON = TMR1IE = 1;

    // Let the interrupts loose
    ei();
}


// Shuts everything down and goes to sleep
void go_to_sleep(void) {
    // Disable the PWM output values
    PWM1OE = PWM2OE = PWM3OE = PWM4OE = 0;

    // Turn off any output pins
    LATA = 0x00;

    // Go to sleep
    SLEEP();
}


// Fire it all up
void main(void) {
    // Initialize the peripherals
    init();
    
    while (1) {
        // Iterate on badge animation forever
        badge_iterate();

#ifdef USE_WATCHDOG
        // Let the puppy know we're alive
        CLRWDT();
#endif /* USE_WATCHDOG */

        // Have we been running quite long enough?
        if (want_to_sleep)
            go_to_sleep();
    }
}


// Interrupt handler
static void interrupt int_handler(void) {
    // Button pressed?
    if (IOCIE && IOCIF) {
        // TODO: Debounce? Call an fn in badge.c?
        
        // Reset the interrupt flag
        IOCIF = 0;
    }
    
    // Timer expired?
    if (TMR1IE && TMR1IF) {
        // Tock the tick
        ++tick;

        // Did our tick expire?
        if (tick >= 75) // on a 4-sec tick, this should be 5 minutes.
            want_to_sleep = 1;
        
        // Reset the overflow flag
        TMR1IF = 0;

        // Reset the timer
        TMR1H = TMR1L = 0;
    }
}
