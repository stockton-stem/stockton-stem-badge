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
    APFCON = 0x00;      // No alternative mappings
    ANSELA = 0x00;      // All lines are digital
    LATA = 0x00;        // Make sure all outputs are low
    WPUA = 0x0a;        // RA1,3 have weak pullups
    TRISA = 0x1f;       // everything is an input for now

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

    // Setup interrupt-on-change for RA1
    IOCAP = 0x02;       // IOC on rising edge of RA1
    IOCAN = 0x00;       // No IOC on any falling edge
    IOCAF = 0;
    IOCIF = 0;
    IOCIE = 1;

    // Setup Timer1 for our tick
    T1CONbits.TMR1CS = SET_TMR1_CS;
    T1CONbits.T1CKPS = SET_TMR1_PS;
    T1CONbits.nT1SYNC = SET_TMR1_SYNC;
    RESET_TMR1();
    TMR1GE = 0; // no gate
    TMR1IE = 1; // enable interrupt
    TMR1ON = 1; // enable timer

    // Let the interrupts loose
    PEIE = 1;
    GIE = 1;
}


// Shuts everything down and goes to sleep
void go_to_sleep(void) {
    // Disable the PWM output values
    PWM1OE = PWM2OE = PWM3OE = PWM4OE = 0;

    // Turn off any output pins
    LATA = 0x00;

    // Cancel pending IOC flags (but don't disable the interrupt)
    IOCAF = 0;
    IOCIF = 0;

    // Cancel any pending timer interrupt
    RESET_TMR1();
    TMR1IE = 0;

    // Go to sleep
    SLEEP();

    // We woke up! Re-initialize the hardware
    init();
    want_to_sleep = 0;
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
    // Timer expired?
    if (TMR1IE && TMR1IF) {
        // Reset the timer
        RESET_TMR1();

        // Tock the tick
        ++tick;

        // Did our tick expire?
        if (tick >= (RUN_INTERVAL/TMR1_INTERVAL))
            want_to_sleep = 1;
    }

    // Button pressed?
    if (IOCIE && IOCIF) {
        if (IOCAF1) {
            // TODO: Reset timer0, call fn in badge.c in tmr0 isr
            // Reset the runtime counter
            tick = 0;

            // Reset our trigger
            IOCAF1 = 0;
        }

        // Reset the interrupt flag
        IOCIF = 0;
    }
}
