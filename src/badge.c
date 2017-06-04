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


enum badge_patterns {
    BASIC_RAMP,
    BASIC_FLASH,
    
    PATTERN_MAX
};

static enum badge_patterns pattern = 0;


void iterate_basic_ramp(void) {
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


void iterate_basic_flash(void) {
    static uint16_t i = 0;
    
    if (i < 500) {
        set_pwm8(PWM1, mv>>2);
        set_pwm8(PWM2, mv);
        set_pwm8(PWM3, mv);
        set_pwm8(PWM4, mv);
        ++i;
    } else if (i < 1000) {
        set_pwm8(PWM1, 0);
        set_pwm8(PWM2, 0);
        set_pwm8(PWM3, 0);
        set_pwm8(PWM4, 0);
        ++i;
    } else {
        i = 0;
    }
    
    return;
}


void badge_iterate(void) {
    switch (pattern) {
        case BASIC_RAMP:
            iterate_basic_ramp();
            break;

        case BASIC_FLASH:
            iterate_basic_flash();
            break;

        default:
            pattern = 0;
    }

    return;
}


void badge_button(void) {
    pattern++;

    if (pattern >= PATTERN_MAX)
        pattern = 0;

    return;
}
