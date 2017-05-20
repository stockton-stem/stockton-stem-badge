/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#include <xc.h>
#include "badge.h"

#define LED1 PWM1DCH
#define LED2 PWM2DCH
#define LED3 PWM3DCH
#define LED4 PWM4DCH

void badge_iterate(void) {
    // Animate the badge here!
    static int i = 0;
    
    LED1 = i & 0xff;;
    LED2 = (i + 32) & 0xff;
    LED3 = (i + 64) & 0xff;
    LED4 = (i + 96) & 0xff;

    ++i;

    return;
}