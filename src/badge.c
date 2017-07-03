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


#define mv 255
#define lv(v) (v < (mv/2) ? v : mv - (v) - 1)


// Index value for the current pattern being executed.
static uint8_t pattern = 0;


// Basic LED ramping pattern.
static void iterate_basic_ramp(void) {
    // Animate the badge here!
    static uint8_t i = 0, j = 16, k = 32, l = 64;

    set_pwm8(PWM1, lv(i)<<1);
    set_pwm8(PWM2, lv(j)<<1);
    set_pwm8(PWM3, lv(k)<<1);
    set_pwm8(PWM4, lv(l)<<1);

    ++i; ++j; ++k; ++l;
    
    if (i >= mv) i = 0;
    if (j >= mv) j = 0;
    if (k >= mv) k = 0;
    if (l >= mv) l = 0;

    __delay_ms(10);

    return;
}


// Basic LED blink on-off pattern.
static void iterate_basic_flash(void) {
    static uint16_t i = 0;
    
    if (i < 500) {
        set_pwm8(PWM1, mv);
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


// List of pattern iterator functions.
static void (*badge_iterator[])(void) = {
        iterate_basic_ramp,
        iterate_basic_flash,
};


// Calculates how many items are in badge_iterator.
// This will be optimized to a constant by the compiler.
#define PATTERN_MAX (sizeof(badge_iterator) / sizeof(badge_iterator[0]))


// Iterates the badge pattern by calling the iterator function based
// on the current valuer of 'pattern'.
void badge_iterate(void) {
    badge_iterator[pattern]();

    return;
}


// The button has been pressed; increment the pattern index, wrapping to
// 0 if we increment past the number of patterns.
void badge_button(void) {
    pattern++;

    if (pattern >= PATTERN_MAX)
        pattern = 0;

    return;
}
