EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:microcontrollers
LIBS:dsp
LIBS:opto
LIBS:contrib
LIBS:switches
LIBS:microchip_pic12mcu
LIBS:stockton-stem-badge-parts
LIBS:stockton-stem-badge-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Stockton STEM Collaborative badge"
Date "2017-06-02"
Rev "v0.3"
Comp "MIT License; (c) 2017 Chris Luke"
Comment1 ""
Comment2 "https://github.com/stockton-stem/stockton-stem-badge"
Comment3 "Microcontroller-driven LED flasher"
Comment4 ""
$EndDescr
$Comp
L PIC12LF1501 U1
U 1 1 591E2774
P 6100 3850
F 0 "U1" H 6100 3400 60  0000 C CNN
F 1 "PIC12LF1501" H 6100 4300 60  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 6100 3850 60  0001 C CNN
F 3 "" H 6100 3850 60  0001 C CNN
F 4 "Microchip" H 6100 3850 60  0001 C CNN "Mfr"
F 5 "PIC12LF1501-I/P" H 6100 3850 60  0001 C CNN "Mfr Part"
F 6 "Mouser" H 6100 3850 60  0001 C CNN "Src1"
F 7 "579-PIC12LF1501-I/P" H 6100 3850 60  0001 C CNN "Src1 Part"
F 8 "http://www.mouser.com/ProductDetail/Microchip/PIC12LF1501-I-P" H 6100 3850 60  0001 C CNN "Src1 URL"
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
P 8200 3900
F 0 "BT1" H 8300 4000 50  0000 L CNN
F 1 "CR2032" H 8300 3900 50  0000 L CNN
F 2 "footprints:BAT-HLD-001-THM" V 8200 3960 50  0001 C CNN
F 3 "" V 8200 3960 50  0001 C CNN
	1    8200 3900
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR03
U 1 1 591E355E
P 8200 3400
F 0 "#PWR03" H 8200 3250 50  0001 C CNN
F 1 "VDD" H 8200 3550 50  0000 C CNN
F 2 "" H 8200 3400 50  0001 C CNN
F 3 "" H 8200 3400 50  0001 C CNN
	1    8200 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 591E3586
P 8200 4300
F 0 "#PWR04" H 8200 4050 50  0001 C CNN
F 1 "GND" H 8200 4150 50  0000 C CNN
F 2 "" H 8200 4300 50  0001 C CNN
F 3 "" H 8200 4300 50  0001 C CNN
	1    8200 4300
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 591E35CB
P 6700 3850
F 0 "C1" H 6725 3950 50  0000 L CNN
F 1 "0.1μF" H 6725 3750 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6738 3700 50  0001 C CNN
F 3 "" H 6700 3850 50  0001 C CNN
F 4 "Vishay" H 6700 3850 60  0001 C CNN "Mfr"
F 5 "K102J15C0GF53L2" H 6700 3850 60  0001 C CNN "Mfr Part"
F 6 "Mouser" H 6700 3850 60  0001 C CNN "Src1"
F 7 "594-K102J15C0GF53L2" H 6700 3850 60  0001 C CNN "Src1 Part"
F 8 "http://www.mouser.com/ProductDetail/Vishay/K102J15C0GF53L2" H 6700 3850 60  0001 C CNN "Src1 URL"
	1    6700 3850
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 591E3893
P 2950 3800
F 0 "R1" V 3030 3800 50  0000 C CNN
F 1 "175Ω" V 2950 3800 50  0000 C CNN
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
F 1 "45Ω" V 3200 3800 50  0000 C CNN
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
F 1 "45Ω" V 3450 3800 50  0000 C CNN
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
F 1 "50Ω" V 3700 3800 50  0000 C CNN
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
F 1 "BLUE" H 2950 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 2950 4200 50  0001 C CNN
F 3 "" H 2950 4200 50  0001 C CNN
F 4 "" H 2950 4200 60  0001 C CNN "Mfr"
F 5 "" H 2950 4200 60  0001 C CNN "Mfr Part"
F 6 "" H 2950 4200 60  0001 C CNN "Src1"
F 7 "" H 2950 4200 60  0001 C CNN "Src1 Part"
F 8 "" H 2950 4200 60  0001 C CNN "Src2"
	1    2950 4200
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 591E3BE7
P 3200 4200
F 0 "D2" H 3200 4300 50  0000 C CNN
F 1 "GREEN" H 3200 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3200 4200 50  0001 C CNN
F 3 "" H 3200 4200 50  0001 C CNN
F 4 "" H 3200 4200 60  0001 C CNN "Mfr"
F 5 "" H 3200 4200 60  0001 C CNN "Mfr Part"
F 6 "" H 3200 4200 60  0001 C CNN "Src1"
F 7 "" H 3200 4200 60  0001 C CNN "Src1 Part"
F 8 "" H 3200 4200 60  0001 C CNN "Src2"
	1    3200 4200
	0    -1   -1   0   
$EndComp
$Comp
L LED D3
U 1 1 591E3C24
P 3450 4200
F 0 "D3" H 3450 4300 50  0000 C CNN
F 1 "YELLOW" H 3450 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3450 4200 50  0001 C CNN
F 3 "" H 3450 4200 50  0001 C CNN
F 4 "" H 3450 4200 60  0001 C CNN "Mfr"
F 5 "" H 3450 4200 60  0001 C CNN "Mfr Part"
F 6 "" H 3450 4200 60  0001 C CNN "Src1"
F 7 "" H 3450 4200 60  0001 C CNN "Src1 Part"
F 8 "" H 3450 4200 60  0001 C CNN "Src2"
	1    3450 4200
	0    -1   -1   0   
$EndComp
$Comp
L LED D4
U 1 1 591E3C59
P 3700 4200
F 0 "D4" H 3700 4300 50  0000 C CNN
F 1 "ORANGE" H 3700 4100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 3700 4200 50  0001 C CNN
F 3 "" H 3700 4200 50  0001 C CNN
F 4 "" H 3700 4200 60  0001 C CNN "Mfr"
F 5 "" H 3700 4200 60  0001 C CNN "Mfr Part"
F 6 "" H 3700 4200 60  0001 C CNN "Src1"
F 7 "" H 3700 4200 60  0001 C CNN "Src1 Part"
F 8 "" H 3700 4200 60  0001 C CNN "Src2"
	1    3700 4200
	0    -1   -1   0   
$EndComp
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
Text GLabel 2950 3500 1    60   Input ~ 0
LED1
Text GLabel 3200 3500 1    60   Input ~ 0
LED2
Text GLabel 3450 3500 1    60   Input ~ 0
LED3
Text GLabel 3700 3500 1    60   Input ~ 0
LED4
Text GLabel 5300 3800 0    60   Output ~ 0
LED1
Text GLabel 5300 3600 0    60   Output ~ 0
LED2
Text GLabel 5300 4000 0    60   Output ~ 0
LED3
Text GLabel 5300 4100 0    60   Output ~ 0
LED4
$Comp
L VDD #PWR06
U 1 1 591F5699
P 9750 3400
F 0 "#PWR06" H 9750 3250 50  0001 C CNN
F 1 "VDD" H 9750 3550 50  0000 C CNN
F 2 "" H 9750 3400 50  0001 C CNN
F 3 "" H 9750 3400 50  0001 C CNN
	1    9750 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 591F56C5
P 9750 4550
F 0 "#PWR07" H 9750 4300 50  0001 C CNN
F 1 "GND" H 9750 4400 50  0000 C CNN
F 2 "" H 9750 4550 50  0001 C CNN
F 3 "" H 9750 4550 50  0001 C CNN
	1    9750 4550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 J1
U 1 1 591F5833
P 10100 4200
F 0 "J1" H 10100 4550 50  0000 C CNN
F 1 "ICSP" V 10200 4200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 10100 4200 50  0001 C CNN
F 3 "" H 10100 4200 50  0001 C CNN
	1    10100 4200
	1    0    0    -1  
$EndComp
NoConn ~ 9900 4450
$Comp
L PWR_FLAG #FLG08
U 1 1 5921C5E2
P 8250 3550
F 0 "#FLG08" H 8250 3625 50  0001 C CNN
F 1 "PWR_FLAG" H 8250 3700 50  0001 C CNN
F 2 "" H 8250 3550 50  0001 C CNN
F 3 "" H 8250 3550 50  0001 C CNN
	1    8250 3550
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 5921C806
P 8250 4150
F 0 "#FLG09" H 8250 4225 50  0001 C CNN
F 1 "PWR_FLAG" H 8250 4300 50  0001 C CNN
F 2 "" H 8250 4150 50  0001 C CNN
F 3 "" H 8250 4150 50  0001 C CNN
	1    8250 4150
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 592E12B8
P 9850 3750
F 0 "R5" V 9930 3750 50  0000 C CNN
F 1 "10KΩ" V 9850 3750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9780 3750 50  0001 C CNN
F 3 "" H 9850 3750 50  0001 C CNN
	1    9850 3750
	1    0    0    -1  
$EndComp
Connection ~ 9750 3550
Wire Wire Line
	9850 3550 9750 3550
Wire Wire Line
	9850 3600 9850 3550
Connection ~ 9850 3950
Wire Wire Line
	9850 3900 9850 3950
Connection ~ 8200 4150
Wire Wire Line
	7850 4150 8250 4150
Connection ~ 8200 3550
Wire Wire Line
	7850 3550 8250 3550
Wire Wire Line
	5300 3900 5550 3900
Wire Wire Line
	5300 3700 5550 3700
Wire Wire Line
	9750 4150 9900 4150
Wire Wire Line
	9750 4550 9750 4150
Wire Wire Line
	9750 3400 9750 4050
Wire Wire Line
	9750 4050 9900 4050
Wire Wire Line
	5300 4100 5550 4100
Wire Wire Line
	5300 4000 5550 4000
Wire Wire Line
	5300 3800 5550 3800
Wire Wire Line
	5300 3600 5550 3600
Wire Wire Line
	3700 3650 3700 3500
Wire Wire Line
	3450 3650 3450 3500
Wire Wire Line
	3200 3650 3200 3500
Wire Wire Line
	2950 3650 2950 3500
Connection ~ 3700 4450
Connection ~ 3450 4450
Wire Wire Line
	3450 4350 3450 4450
Connection ~ 3200 4450
Wire Wire Line
	3200 4350 3200 4450
Wire Wire Line
	2950 4450 2950 4350
Wire Wire Line
	3700 4450 2950 4450
Wire Wire Line
	3700 4350 3700 4550
Wire Wire Line
	3700 3950 3700 4050
Wire Wire Line
	3450 3950 3450 4050
Wire Wire Line
	3200 3950 3200 4050
Wire Wire Line
	2950 3950 2950 4050
Connection ~ 6700 4150
Wire Wire Line
	6700 4000 6700 4150
Connection ~ 6700 3550
Wire Wire Line
	6700 3700 6700 3550
Wire Wire Line
	8200 4000 8200 4300
Wire Wire Line
	8200 3400 8200 3700
Wire Wire Line
	6950 3550 6950 3400
Wire Wire Line
	6650 3550 6950 3550
Wire Wire Line
	6950 4150 6950 4300
Wire Wire Line
	6650 4150 6950 4150
Text GLabel 5300 3700 0    60   Input ~ 0
BUT1
Text GLabel 9450 3950 0    60   Output ~ 0
VPP
Wire Wire Line
	9450 3950 9900 3950
Text GLabel 5300 3900 0    60   Input ~ 0
VPP
Text GLabel 9450 4350 0    60   Output ~ 0
BUT1
Wire Wire Line
	9900 4350 9450 4350
Text GLabel 9450 4250 0    60   BiDi ~ 0
LED2
Wire Wire Line
	9900 4250 9450 4250
Text Label 9500 4250 0    60   ~ 0
PGD
Text Label 9500 4350 0    60   ~ 0
PGC
$Comp
L CP C2
U 1 1 592E55AD
P 7850 3850
F 0 "C2" H 7875 3950 50  0000 L CNN
F 1 "47μF" H 7875 3750 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 7888 3700 50  0001 C CNN
F 3 "" H 7850 3850 50  0001 C CNN
	1    7850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4000 7850 4150
Wire Wire Line
	7850 3700 7850 3550
$Comp
L SW_Push SW1
U 1 1 592F2E35
P 1850 3900
F 0 "SW1" H 1900 4000 50  0000 L CNN
F 1 "SPST" H 1850 3840 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 1850 4100 50  0001 C CNN
F 3 "" H 1850 4100 50  0001 C CNN
	1    1850 3900
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 592F2EB0
P 1850 4550
F 0 "#PWR010" H 1850 4300 50  0001 C CNN
F 1 "GND" H 1850 4400 50  0000 C CNN
F 2 "" H 1850 4550 50  0001 C CNN
F 3 "" H 1850 4550 50  0001 C CNN
	1    1850 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4550 1850 4100
Text GLabel 1850 3500 1    60   Output ~ 0
BUT1
Wire Wire Line
	1850 3700 1850 3500
$EndSCHEMATC
