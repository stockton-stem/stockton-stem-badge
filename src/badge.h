/*
 * Stockton STEM collaborative badge.
 * 
 * Copyright (c) 2017 Chris Luke. MIT Licensed.
 * https://github.com/stockton-stem/stockton-stem-badge
 */

#ifndef _BADGE_H
#define _BADGE_H

#ifdef	__cplusplus
extern "C" {
#endif


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


void badge_iterate(void);
void badge_button(void);


#ifdef	__cplusplus
}
#endif

#endif	/* _BADGE_H */

