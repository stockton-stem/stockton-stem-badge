/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#include "config.h"
#include <xc.h>
#include <stdint.h>
#include "badge.h"


#define mv 128
#define lv(v) (v < (mv/2) ? v : mv - (v))

void badge_iterate(void) {
    // Animate the badge here!
    static uint8_t i = 0, j = 16, k = 32, l = 64;

    set_pwm8(PWM1, lv(i)>>2);
    set_pwm8(PWM2, lv(j));
    set_pwm8(PWM3, lv(k));
    set_pwm8(PWM4, lv(l));

    ++i; ++j; ++k; ++l;
    
    if (i >= mv) i = 0;
    if (j >= mv) j = 0;
    if (k >= mv) k = 0;
    if (l >= mv) l = 0;

    __delay_ms(10);

    return;
}