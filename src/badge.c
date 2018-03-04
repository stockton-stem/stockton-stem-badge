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


// Maximum value any LED PWM can be set to
#define MAX_LED_VALUE 255

// Define (or not) these to control which patterns are compiled
#define PATTERN_BASIC_RAMP
#define PATTERN_REVERSE_RAMP
#define PATTERN_FLASH_ALL
//#define PATTERN_FLASH_BLUE

// Helper macro to generate a sort of linear ramp-up/down value
#define lv(v) (v < (MAX_LED_VALUE/2) ? v : MAX_LED_VALUE - (v) - 1)


// Index value for the current pattern being executed.
static uint8_t pattern = 0;


#ifdef PATTERN_BASIC_RAMP
// Basic LED ramping pattern.
static void iterate_basic_ramp(void) {
    // Animate the badge here!
    static uint8_t i = 0, j = 16, k = 32, l = 64;

    set_pwm8(PWM1, lv(i)<<1);
    set_pwm8(PWM2, lv(j)<<1);
    set_pwm8(PWM3, lv(k)<<1);
    set_pwm8(PWM4, lv(l)<<1);

    ++i; ++j; ++k; ++l;
    
//    if (i >= MAX_LED_VALUE) i = 0;
    if (j >= MAX_LED_VALUE) j = 0;
    if (k >= MAX_LED_VALUE) k = 0;
    if (l >= MAX_LED_VALUE) l = 0;

    __delay_ms(10);

    return;
}
#endif // PATTERN_BASIC_RAMP

#ifdef PATTERN_REVERSE_RAMP
// Same ramping pattern, but in reverse
static void iterate_reverse_ramp(void) {
     static uint8_t i = 0, j = 16, k = 32, l = 64;

    set_pwm8(PWM4, lv(i)<<1);
    set_pwm8(PWM3, lv(j)<<1);
    set_pwm8(PWM2, lv(k)<<1);
    set_pwm8(PWM1, lv(l)<<1);

    ++i; ++j; ++k; ++l;
    
    if (i >= MAX_LED_VALUE) i = 0;
    if (j >= MAX_LED_VALUE) j = 0;
    if (k >= MAX_LED_VALUE) k = 0;
    if (l >= MAX_LED_VALUE) l = 0;

    __delay_ms(10);
    
    return;
}
#endif // PATTERN_REVERSE_RAMP

#ifdef PATTERN_FLASH_ALL
// Basic LED blink on-off pattern.
static void iterate_flash_all(void) {
    static uint16_t i = 0;
    
    if (i < 500) {
        set_pwm8(PWM1, MAX_LED_VALUE);
        set_pwm8(PWM2, MAX_LED_VALUE);
        set_pwm8(PWM3, MAX_LED_VALUE);
        set_pwm8(PWM4, MAX_LED_VALUE);
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
#endif // PATTERN_FLASH_ALL

#ifdef PATTERN_FLASH_BLUE
// Blink the blue LED
static void iterate_flash_blue(void) {
    static uint16_t i = 0;
    
    if (i < 500) {
        set_pwm8(PWM1, MAX_LED_VALUE);
        set_pwm8(PWM2, 0);
        set_pwm8(PWM3, 0);
        set_pwm8(PWM4, 0);
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
#endif // PATTERN_FLASH_BLUE


// List of pattern iterator functions.
static void (*badge_iterator[])(void) = {
#ifdef PATTERN_BASIC_RAMP
        iterate_basic_ramp,
#endif
#ifdef PATTERN_REVERSE_RAMP
        iterate_reverse_ramp,
#endif
#ifdef PATTERN_FLASH_ALL
        iterate_flash_all,
#endif
#ifdef PATTERN_FLASH_BLUE
        iterate_flash_blue,
#endif
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
