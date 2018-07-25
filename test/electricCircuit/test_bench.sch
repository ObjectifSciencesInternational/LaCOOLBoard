EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:coolboardpins
LIBS:relaistq2-5v
LIBS:test_bench-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 2N2219 Q?
U 1 1 5B51BA53
P 5650 3300
F 0 "Q?" H 5850 3375 50  0000 L CNN
F 1 "2N2219" H 5850 3300 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-39-3" H 5850 3225 50  0001 L CIN
F 3 "" H 5650 3300 50  0001 L CNN
	1    5650 3300
	1    0    0    -1  
$EndComp
$Comp
L R 1K
U 1 1 5B51BA7E
P 4950 3300
F 0 "1K" V 5030 3300 50  0000 C CNN
F 1 "R" V 4950 3300 50  0000 C CNN
F 2 "" V 4880 3300 50  0001 C CNN
F 3 "" H 4950 3300 50  0001 C CNN
	1    4950 3300
	0    1    1    0   
$EndComp
$Comp
L Raspberry_Pi_2_3 J?
U 1 1 5B51BB7E
P 2200 3000
F 0 "J?" H 2900 1750 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 1800 3900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 3200 4250 50  0001 C CNN
F 3 "" H 2250 2850 50  0001 C CNN
	1    2200 3000
	1    0    0    -1  
$EndComp
$Comp
L CoolBoardPins CoolBoard?
U 1 1 5B51CE63
P 7650 4050
F 0 "CoolBoard?" H 8000 4850 60  0000 C CNN
F 1 "CoolBoardPins" H 8050 4300 60  0000 C CNN
F 2 "" H 8050 4300 60  0001 C CNN
F 3 "" H 8050 4300 60  0001 C CNN
	1    7650 4050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B51CF99
P 1800 4800
F 0 "#PWR?" H 1800 4550 50  0001 C CNN
F 1 "GND" H 1800 4650 50  0000 C CNN
F 2 "" H 1800 4800 50  0001 C CNN
F 3 "" H 1800 4800 50  0001 C CNN
	1    1800 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B51D090
P 9100 3950
F 0 "#PWR?" H 9100 3700 50  0001 C CNN
F 1 "GND" H 9100 3800 50  0000 C CNN
F 2 "" H 9100 3950 50  0001 C CNN
F 3 "" H 9100 3950 50  0001 C CNN
	1    9100 3950
	1    0    0    -1  
$EndComp
$Comp
L relaisTQ2-5V relais?
U 1 1 5B51D472
P 6700 3300
F 0 "relais?" H 6650 3200 60  0000 C CNN
F 1 "relaisTQ2-5V" H 6600 3350 60  0000 C CNN
F 2 "" H 6550 3850 60  0001 C CNN
F 3 "" H 6550 3850 60  0001 C CNN
	1    6700 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B51D5E9
P 5750 3700
F 0 "#PWR?" H 5750 3450 50  0001 C CNN
F 1 "GND" H 5750 3550 50  0000 C CNN
F 2 "" H 5750 3700 50  0001 C CNN
F 3 "" H 5750 3700 50  0001 C CNN
	1    5750 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B51D89D
P 6450 2550
F 0 "#PWR?" H 6450 2300 50  0001 C CNN
F 1 "GND" H 6450 2400 50  0000 C CNN
F 2 "" H 6450 2550 50  0001 C CNN
F 3 "" H 6450 2550 50  0001 C CNN
	1    6450 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3300 5100 3300
Wire Wire Line
	4800 3300 3700 3300
Wire Wire Line
	3700 3300 3700 2300
Wire Wire Line
	3700 2300 3100 2300
Wire Wire Line
	8700 3150 9400 3150
Wire Wire Line
	9400 3150 9400 4650
Wire Wire Line
	9400 4650 3700 4650
Wire Wire Line
	3700 4650 3700 3800
Wire Wire Line
	3700 3800 3100 3800
Wire Wire Line
	1800 4800 1800 4300
Wire Wire Line
	8750 3850 9100 3850
Wire Wire Line
	9100 3850 9100 3950
Wire Wire Line
	6300 2900 6300 2750
Wire Wire Line
	6300 2750 5750 2750
Wire Wire Line
	5750 2750 5750 3100
Wire Wire Line
	4150 1100 4150 4050
Wire Wire Line
	4150 1100 2000 1100
Wire Wire Line
	2000 1100 2000 1700
Wire Wire Line
	5750 3500 5750 3700
Connection ~ 5750 3700
Wire Wire Line
	6300 3650 6300 4050
Wire Wire Line
	6300 4050 4150 4050
Wire Wire Line
	6650 2950 6650 2400
Wire Wire Line
	6650 2400 6450 2400
Wire Wire Line
	6450 2400 6450 2550
Wire Wire Line
	6800 2950 6800 2600
Wire Wire Line
	6800 2600 7250 2600
Wire Wire Line
	7250 2600 7250 3150
Wire Wire Line
	7250 3150 7300 3150
$EndSCHEMATC