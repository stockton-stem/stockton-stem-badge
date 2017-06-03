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


// Programs all 10 bits of the PWM duty cycle
#define set_pwm10(pwm, val) do { \
    pwm##DCH = (unsigned char)((val) >> 2); \
    pwm##DCL = (unsigned char)((val) << 6); \
} while(0)

// Program the MSB and LSB independently
#define set_pwm82(pwm, h, l) do { \
    pwm##DCH = (unsigned char)(h); \
    pwm##DCL = (unsigned char)((l) << 6); \
} while(0)

// Programs only the 8MSB of the PWM duty cycle
#define set_pwm8(pwm, val) do { \
    pwm##DCH = (unsigned char)(val); \
} while(0)

void badge_iterate(void) {
    // Animate the badge here!
    static uint8_t i = 0, j = 16, k = 32, l = 64;

    set_pwm8(PWM1, i>>2);
    set_pwm8(PWM2, j);
    set_pwm8(PWM3, k);
    set_pwm8(PWM4, l);

    ++i; ++j; ++k; ++l;
    
    if (i > 127) i = 0;
    if (j > 127) j = 0;
    if (k > 127) k = 0;
    if (l > 127) l = 0;

    __delay_ms(10);

    return;
}