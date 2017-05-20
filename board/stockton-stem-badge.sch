EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stockton-stem-badge-parts
LIBS:stockton-stem-badge-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Stockton STEM Collaborative badge"
Date "2017-05-18"
Rev "1"
Comp "MIT License; (c) 2017 Chris Luke"
Comment1 ""
Comment2 "https://github.com/stockton-stem/stockton-stem-badge"
Comment3 "Microcontroller-driven LED flasher"
Comment4 ""
$EndDescr
$Comp
L PIC12F1501 U1
U 1 1 591E2774
P 6100 3850
F 0 "U1" H 6100 3400 60  0000 C CNN
F 1 "PIC12F1501" H 6100 4300 60  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 6100 3850 60  0001 C CNN
F 3 "" H 6100 3850 60  0001 C CNN
	1    6100 3850
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR01
U 1 1 591E3481
P 6950 3400
F 0 "#PWR01" H 6950 3250 50  0001 C CNN
F 1 "VDD" H 6950 3550 50  0000 C CNN
F 2 "" H 6950 3400 50  0001 C CNN
F 3 "" H 6950 3400 50  0001 C CNN
	1    6950 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 591E34AC
P 6950 4300
F 0 "#PWR02" H 6950 4050 50  0001 C CNN
F 1 "GND" H 6950 4150 50  0000 C CNN
F 2 "" H 6950 4300 50  0001 C CNN
F 3 "" H 6950 4300 50  0001 C CNN
	1    6950 4300
	1    0    0    -1  
$EndComp
$Comp
L Battery_Cell BT1
U 1 1 591E350D
P 8600 3900
F 0 "BT1" H 8700 4000 50  0000 L CNN
F 1 "CR2032" H 8700 3900 50  0000 L CNN
F 2 "Connectors:CR2032H" V 8600 3960 50  0001 C CNN
F 3 "" V 8600 3960 50  0001 C CNN
	1    8600 3900
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR03
U 1 1 591E355E
P 8600 3400
F 0 "#PWR03" H 8600 3250 50  0001 C CNN
F 1 "VDD" H 8600 3550 50  0000 C CNN
F 2 "" H 8600 3400 50  0001 C CNN
F 3 "" H 8600 3400 50  0001 C CNN
	1    8600 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 591E3586
P 8600 4300
F 0 "#PWR04" H 8600 4050 50  0001 C CNN
F 1 "GND" H 8600 4150 50  0000 C CNN
F 2 "" H 8600 4300 50  0001 C CNN
F 3 "" H 8600 4300 50  0001 C CNN
	1    8600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4150 6950 4150
Wire Wire Line
	6950 4150 6950 4300
Wire Wire Line
	6650 3550 6950 3550
Wire Wire Line
	6950 3550 6950 3400
Wire Wire Line
	8600 3400 8600 3700
Wire Wire Line
	8600 4000 8600 4300
$Comp
L C C1
U 1 1 591E35CB
P 6700 3850
F 0 "C1" H 6725 3950 50  0000 L CNN
F 1 "0.1μF" H 6725 3750 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6738 3700 50  0001 C CNN
F 3 "" H 6700 3850 50  0001 C CNN
	1    6700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3700 6700 3550
Connection ~ 6700 3550
Wire Wire Line
	6700 4000 6700 4150
Connection ~ 6700 4150
$Comp
L R R1
U 1 1 591E3893
P 2950 3800
F 0 "R1" V 3030 3800 50  0000 C CNN
F 1 "R" V 2950 3800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2880 3800 50  0001 C CNN
F 3 "" H 2950 3800 50  0001 C CNN
	1    2950 3800
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 591E39DA
P 3200 3800
F 0 "R2" V 3280 3800 50  0000 C CNN
F 1 "R" V 3200 3800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3130 3800 50  0001 C CNN
F 3 "" H 3200 3800 50  0001 C CNN
	1    3200 3800
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 591E3A93
P 3450 3800
F 0 "R3" V 3530 3800 50  0000 C CNN
F 1 "R" V 3450 3800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3380 3800 50  0001 C CNN
F 3 "" H 3450 3800 50  0001 C CNN
	1    3450 3800
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 591E3AD6
P 3700 3800
F 0 "R4" V 3780 3800 50  0000 C CNN
F 1 "R" V 3700 3800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3630 3800 50  0001 C CNN
F 3 "" H 3700 3800 50  0001 C CNN
	1    3700 3800
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 591E3B38
P 2950 4200
F 0 "D1" H 2950 4300 50  0000 C CNN
F 1 "LED" H 2950 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 2950 4200 50  0001 C CNN
F 3 "" H 2950 4200 50  0001 C CNN
	1    2950 4200
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 591E3BE7
P 3200 4200
F 0 "D2" H 3200 4300 50  0000 C CNN
F 1 "LED" H 3200 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3200 4200 50  0001 C CNN
F 3 "" H 3200 4200 50  0001 C CNN
	1    3200 4200
	0    -1   -1   0   
$EndComp
$Comp
L LED D3
U 1 1 591E3C24
P 3450 4200
F 0 "D3" H 3450 4300 50  0000 C CNN
F 1 "LED" H 3450 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3450 4200 50  0001 C CNN
F 3 "" H 3450 4200 50  0001 C CNN
	1    3450 4200
	0    -1   -1   0   
$EndComp
$Comp
L LED D4
U 1 1 591E3C59
P 3700 4200
F 0 "D4" H 3700 4300 50  0000 C CNN
F 1 "LED" H 3700 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3700 4200 50  0001 C CNN
F 3 "" H 3700 4200 50  0001 C CNN
	1    3700 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2950 3950 2950 4050
Wire Wire Line
	3200 3950 3200 4050
Wire Wire Line
	3450 3950 3450 4050
Wire Wire Line
	3700 3950 3700 4050
Wire Wire Line
	3700 4350 3700 4550
Wire Wire Line
	3700 4450 2950 4450
Wire Wire Line
	2950 4450 2950 4350
Wire Wire Line
	3200 4350 3200 4450
Connection ~ 3200 4450
Wire Wire Line
	3450 4350 3450 4450
Connection ~ 3450 4450
$Comp
L GND #PWR05
U 1 1 591E3D7E
P 3700 4550
F 0 "#PWR05" H 3700 4300 50  0001 C CNN
F 1 "GND" H 3700 4400 50  0000 C CNN
F 2 "" H 3700 4550 50  0001 C CNN
F 3 "" H 3700 4550 50  0001 C CNN
	1    3700 4550
	1    0    0    -1  
$EndComp
Connection ~ 3700 4450
Text GLabel 2950 3500 1    60   Input ~ 0
LED1
Text GLabel 3200 3500 1    60   Input ~ 0
LED2
Text GLabel 3450 3500 1    60   Input ~ 0
LED3
Text GLabel 3700 3500 1    60   Input ~ 0
LED4
Wire Wire Line
	2950 3650 2950 3500
Wire Wire Line
	3200 3650 3200 3500
Wire Wire Line
	3450 3650 3450 3500
Wire Wire Line
	3700 3650 3700 3500
Text GLabel 5300 3800 0    60   Input ~ 0
LED1
Text GLabel 5300 3600 0    60   Input ~ 0
LED2
Text GLabel 5300 4000 0    60   Input ~ 0
LED3
Text GLabel 5300 4100 0    60   Input ~ 0
LED4
Wire Wire Line
	5300 3600 5550 3600
Wire Wire Line
	5300 3800 5550 3800
Wire Wire Line
	5300 4000 5550 4000
Wire Wire Line
	5300 4100 5550 4100
$Comp
L VDD #PWR06
U 1 1 591F5699
P 5800 2300
F 0 "#PWR06" H 5800 2150 50  0001 C CNN
F 1 "VDD" H 5800 2450 50  0000 C CNN
F 2 "" H 5800 2300 50  0001 C CNN
F 3 "" H 5800 2300 50  0001 C CNN
	1    5800 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 591F56C5
P 5800 3050
F 0 "#PWR07" H 5800 2800 50  0001 C CNN
F 1 "GND" H 5800 2900 50  0000 C CNN
F 2 "" H 5800 3050 50  0001 C CNN
F 3 "" H 5800 3050 50  0001 C CNN
	1    5800 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2550 5950 2550
Wire Wire Line
	5800 2550 5800 2300
Wire Wire Line
	5800 3050 5800 2650
Wire Wire Line
	5800 2650 5950 2650
Wire Wire Line
	5400 2450 5950 2450
$Comp
L CONN_01X06 J1
U 1 1 591F5833
P 6150 2700
F 0 "J1" H 6150 3050 50  0000 C CNN
F 1 "ICSP" V 6250 2700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 6150 2700 50  0001 C CNN
F 3 "" H 6150 2700 50  0001 C CNN
	1    6150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3700 5500 3700
Wire Wire Line
	5500 3700 5500 2850
Wire Wire Line
	5500 2850 5950 2850
Wire Wire Line
	5950 2750 5450 2750
Wire Wire Line
	5450 2750 5450 3600
Connection ~ 5450 3600
Wire Wire Line
	5550 3900 5400 3900
Wire Wire Line
	5400 3900 5400 2450
$EndSCHEMATC