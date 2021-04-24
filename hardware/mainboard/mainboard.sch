EESchema Schematic File Version 4
LIBS:mainboard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "BreadBin - Memory and IO board"
Date ""
Rev "2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L parts:AS6C4008 U2
U 1 1 5ECA766A
P 8850 5100
F 0 "U2" H 8850 6567 50  0000 C CNN
F 1 "AS6C4008" H 8850 6476 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket" H 8900 4600 50  0001 L CNN
F 3 "http://download.intel.com/design/archives/flash/docs/29045101.pdf" H 8850 5350 50  0001 C CNN
	1    8850 5100
	0    -1   -1   0   
$EndComp
$Comp
L parts:SST39SF040 U5
U 1 1 5ECA772E
P 6000 5100
F 0 "U5" H 6000 6567 50  0000 C CNN
F 1 "SST39SF040" H 6000 6476 50  0000 C CNN
F 2 "ProjectFootprints:DIP-32_LargeHoles" H 6050 4600 50  0001 L CNN
F 3 "http://download.intel.com/design/archives/flash/docs/29045101.pdf" H 6000 5350 50  0001 C CNN
	1    6000 5100
	0    -1   -1   0   
$EndComp
Text Label 10400 5550 2    50   ~ 0
D0
Text Label 10400 5450 2    50   ~ 0
D1
Text Label 10400 5350 2    50   ~ 0
D2
Text Label 10400 5250 2    50   ~ 0
D3
Text Label 10400 5150 2    50   ~ 0
D4
Text Label 10400 5050 2    50   ~ 0
D5
Text Label 10400 4950 2    50   ~ 0
D6
Text Label 10400 4850 2    50   ~ 0
D7
Text Label 10400 4400 2    50   ~ 0
A0
Text Label 10400 4300 2    50   ~ 0
A1
Text Label 10400 4200 2    50   ~ 0
A2
Text Label 10400 4100 2    50   ~ 0
A3
Text Label 10400 4000 2    50   ~ 0
A4
Text Label 10400 3900 2    50   ~ 0
A5
Text Label 10400 3800 2    50   ~ 0
A6
Text Label 10400 3700 2    50   ~ 0
A7
Text Label 10400 3200 2    50   ~ 0
B0
Text Label 10400 3100 2    50   ~ 0
B1
Text Label 10400 3000 2    50   ~ 0
B2
Text Label 10400 2900 2    50   ~ 0
B3
Text Label 10400 2800 2    50   ~ 0
B4
Text Label 10400 2700 2    50   ~ 0
B5
Text Label 10400 2600 2    50   ~ 0
B6
Text Label 10400 2500 2    50   ~ 0
B7
Text Label 7800 2050 3    50   ~ 0
A16
Text Label 7900 2050 3    50   ~ 0
A17
Text Label 8000 2050 3    50   ~ 0
A18
Text Label 6750 3050 1    50   ~ 0
RAMSEL#
$Comp
L power:GND #PWR04
U 1 1 5ECA7CBD
P 6300 7350
F 0 "#PWR04" H 6300 7100 50  0001 C CNN
F 1 "GND" V 6305 7222 50  0000 R CNN
F 2 "" H 6300 7350 50  0001 C CNN
F 3 "" H 6300 7350 50  0001 C CNN
	1    6300 7350
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5ECA7CF5
P 6300 7450
F 0 "#PWR05" H 6300 7300 50  0001 C CNN
F 1 "+5V" V 6315 7578 50  0000 L CNN
F 2 "" H 6300 7450 50  0001 C CNN
F 3 "" H 6300 7450 50  0001 C CNN
	1    6300 7450
	0    1    1    0   
$EndComp
Text Label 10400 1700 2    50   ~ 0
WR#
Text Label 10400 1900 2    50   ~ 0
RD#
Text Label 7650 5900 1    50   ~ 0
A18
Text Label 7750 5900 1    50   ~ 0
A16
Text Label 7750 4450 1    50   ~ 0
B7
Text Label 7950 5900 1    50   ~ 0
B4
Text Label 8050 5900 1    50   ~ 0
A7
Text Label 8150 5900 1    50   ~ 0
A6
Text Label 8250 5900 1    50   ~ 0
A5
Text Label 8350 5900 1    50   ~ 0
A4
Text Label 8450 5900 1    50   ~ 0
A3
Text Label 8550 5900 1    50   ~ 0
A2
Text Label 8650 5900 1    50   ~ 0
A1
Text Label 8750 5900 1    50   ~ 0
A0
Text Label 8850 5900 1    50   ~ 0
D0
Text Label 8950 5900 1    50   ~ 0
D1
Text Label 9050 5900 1    50   ~ 0
D2
$Comp
L power:GND #PWR07
U 1 1 5ECACC58
P 9150 5800
F 0 "#PWR07" H 9150 5550 50  0001 C CNN
F 1 "GND" V 9155 5672 50  0000 R CNN
F 2 "" H 9150 5800 50  0001 C CNN
F 3 "" H 9150 5800 50  0001 C CNN
	1    9150 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5800 9150 5700
Wire Wire Line
	9050 5900 9050 5700
Wire Wire Line
	8950 5900 8950 5700
Wire Wire Line
	8850 5900 8850 5700
Wire Wire Line
	8750 5900 8750 5700
Wire Wire Line
	8650 5900 8650 5700
Wire Wire Line
	8550 5900 8550 5700
Wire Wire Line
	8450 5900 8450 5700
Wire Wire Line
	8350 5900 8350 5700
Wire Wire Line
	8250 5900 8250 5700
Wire Wire Line
	8150 5900 8150 5700
Wire Wire Line
	8050 5900 8050 5700
Wire Wire Line
	7950 5900 7950 5700
Wire Wire Line
	7850 5900 7850 5700
Wire Wire Line
	7750 5900 7750 5700
Wire Wire Line
	7650 5900 7650 5700
Text Label 9150 4450 1    50   ~ 0
D3
Text Label 9050 4450 1    50   ~ 0
D4
Text Label 8950 4450 1    50   ~ 0
D5
Text Label 8850 4450 1    50   ~ 0
D6
Text Label 8750 4450 1    50   ~ 0
D7
Text Label 8550 4450 1    50   ~ 0
B2
Text Label 8350 4450 1    50   ~ 0
B3
Text Label 8250 4450 1    50   ~ 0
B1
Text Label 8150 4450 1    50   ~ 0
B0
Text Label 8050 4450 1    50   ~ 0
B5
Text Label 7850 4450 1    50   ~ 0
A17
Text Label 7850 5900 1    50   ~ 0
B6
$Comp
L power:+5V #PWR013
U 1 1 5ECB8D04
P 7650 4450
F 0 "#PWR013" H 7650 4300 50  0001 C CNN
F 1 "+5V" V 7665 4578 50  0000 L CNN
F 2 "" H 7650 4450 50  0001 C CNN
F 3 "" H 7650 4450 50  0001 C CNN
	1    7650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4500 7650 4450
Wire Wire Line
	7750 4500 7750 4450
Wire Wire Line
	7850 4500 7850 4450
Wire Wire Line
	8050 4500 8050 4450
Wire Wire Line
	8150 4500 8150 4450
Wire Wire Line
	8250 4500 8250 4450
Wire Wire Line
	8350 4500 8350 4450
Wire Wire Line
	8550 4500 8550 4450
Wire Wire Line
	8750 4500 8750 4450
Wire Wire Line
	8850 4500 8850 4450
Wire Wire Line
	8950 4500 8950 4450
Wire Wire Line
	9050 4500 9050 4450
Wire Wire Line
	9150 4500 9150 4450
Wire Wire Line
	7950 4500 7950 4450
$Comp
L 74xx:7400 U4
U 5 1 5ECCC851
P 4700 7250
F 0 "U4" V 4333 7250 50  0000 C CNN
F 1 "74HC00" V 4424 7250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4700 7250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn7400" H 4700 7250 50  0001 C CNN
	5    4700 7250
	0    1    1    0   
$EndComp
$Comp
L 74xx:7400 U4
U 1 1 5ECCC932
P 6100 2350
F 0 "U4" H 6100 2550 50  0000 C CNN
F 1 "74HC00" H 6050 2650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6100 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn7400" H 6100 2350 50  0001 C CNN
	1    6100 2350
	0    1    1    0   
$EndComp
Text Label 7950 4450 1    50   ~ 0
WR#
$Comp
L 74xx:7400 U4
U 2 1 5ECE311F
P 6750 2350
F 0 "U4" H 6750 2675 50  0000 C CNN
F 1 "74HC00" H 6750 2584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 6750 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn7400" H 6750 2350 50  0001 C CNN
	2    6750 2350
	0    -1   1    0   
$EndComp
$Comp
L 74xx:7400 U4
U 3 1 5ECE31C6
P 7250 1450
F 0 "U4" H 7250 1150 50  0000 C CNN
F 1 "74HC00" H 7250 1250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 7250 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn7400" H 7250 1450 50  0001 C CNN
	3    7250 1450
	-1   0    0    1   
$EndComp
Text Label 6200 5850 1    50   ~ 0
D2
Text Label 6100 5850 1    50   ~ 0
D1
Text Label 6000 5850 1    50   ~ 0
D0
Text Label 5900 5850 1    50   ~ 0
A0
Text Label 5800 5850 1    50   ~ 0
A1
Text Label 5700 5850 1    50   ~ 0
A2
Text Label 5600 5850 1    50   ~ 0
A3
Text Label 5500 5850 1    50   ~ 0
A4
Text Label 5400 5850 1    50   ~ 0
A5
Text Label 5300 5850 1    50   ~ 0
A6
Text Label 5200 5850 1    50   ~ 0
A7
Text Label 5100 5850 1    50   ~ 0
B4
Text Label 5000 5850 1    50   ~ 0
B7
Text Label 4900 5850 1    50   ~ 0
A16
Text Label 4800 5850 1    50   ~ 0
A18
Text Label 6300 4450 1    50   ~ 0
D3
Text Label 6200 4450 1    50   ~ 0
D4
Text Label 6100 4450 1    50   ~ 0
D5
Text Label 6000 4450 1    50   ~ 0
D6
Text Label 5900 4450 1    50   ~ 0
D7
Text Label 5700 4450 1    50   ~ 0
B2
Text Label 5500 4450 1    50   ~ 0
B3
Text Label 5400 4450 1    50   ~ 0
B1
Text Label 5300 4450 1    50   ~ 0
B0
Text Label 5200 4450 1    50   ~ 0
B5
Text Label 5100 4450 1    50   ~ 0
B6
Text Label 5000 4450 1    50   ~ 0
A17
$Comp
L power:+5V #PWR024
U 1 1 5ECE5F5A
P 4900 4450
F 0 "#PWR024" H 4900 4300 50  0001 C CNN
F 1 "+5V" V 4915 4578 50  0000 L CNN
F 2 "" H 4900 4450 50  0001 C CNN
F 3 "" H 4900 4450 50  0001 C CNN
	1    4900 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 5ECE5FA6
P 4800 4450
F 0 "#PWR023" H 4800 4300 50  0001 C CNN
F 1 "+5V" V 4815 4578 50  0000 L CNN
F 2 "" H 4800 4450 50  0001 C CNN
F 3 "" H 4800 4450 50  0001 C CNN
	1    4800 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5ECE5FF9
P 6300 5750
F 0 "#PWR015" H 6300 5500 50  0001 C CNN
F 1 "GND" V 6305 5622 50  0000 R CNN
F 2 "" H 6300 5750 50  0001 C CNN
F 3 "" H 6300 5750 50  0001 C CNN
	1    6300 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 5750 6300 5700
Wire Wire Line
	6200 5850 6200 5700
Wire Wire Line
	6100 5850 6100 5700
Wire Wire Line
	6000 5850 6000 5700
Wire Wire Line
	5900 5850 5900 5700
Wire Wire Line
	5800 5850 5800 5700
Wire Wire Line
	5700 5850 5700 5700
Wire Wire Line
	5600 5850 5600 5700
Wire Wire Line
	5500 5850 5500 5700
Wire Wire Line
	5400 5850 5400 5700
Wire Wire Line
	5300 5850 5300 5700
Wire Wire Line
	5200 5850 5200 5700
Wire Wire Line
	5100 5850 5100 5700
Wire Wire Line
	5000 5850 5000 5700
Wire Wire Line
	4900 5850 4900 5700
Wire Wire Line
	4800 5850 4800 5700
Wire Wire Line
	6300 4500 6300 4450
Wire Wire Line
	6200 4500 6200 4450
Wire Wire Line
	6100 4500 6100 4450
Wire Wire Line
	6000 4500 6000 4450
Wire Wire Line
	5900 4500 5900 4450
Wire Wire Line
	5800 4500 5800 4450
Wire Wire Line
	5700 4500 5700 4450
Wire Wire Line
	5500 4500 5500 4450
Wire Wire Line
	5400 4500 5400 4450
Wire Wire Line
	5300 4500 5300 4450
Wire Wire Line
	5200 4500 5200 4450
Wire Wire Line
	5100 4500 5100 4450
Wire Wire Line
	5000 4500 5000 4450
Wire Wire Line
	4900 4500 4900 4450
Wire Wire Line
	4800 4500 4800 4450
$Comp
L power:+5V #PWR039
U 1 1 5EE63668
P 1800 5000
F 0 "#PWR039" H 1800 4850 50  0001 C CNN
F 1 "+5V" V 1815 5128 50  0000 L CNN
F 2 "" H 1800 5000 50  0001 C CNN
F 3 "" H 1800 5000 50  0001 C CNN
	1    1800 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5EE636E2
P 3400 5150
F 0 "#PWR036" H 3400 4900 50  0001 C CNN
F 1 "GND" V 3405 5022 50  0000 R CNN
F 2 "" H 3400 5150 50  0001 C CNN
F 3 "" H 3400 5150 50  0001 C CNN
	1    3400 5150
	1    0    0    -1  
$EndComp
Text Label 2800 4400 3    50   ~ 0
D0
Text Label 2700 4400 3    50   ~ 0
D1
Text Label 2600 4400 3    50   ~ 0
D2
Text Label 2500 4400 3    50   ~ 0
D3
Text Label 2400 4400 3    50   ~ 0
D4
Text Label 2300 4400 3    50   ~ 0
D5
Text Label 2200 4400 3    50   ~ 0
D6
Text Label 2100 4400 3    50   ~ 0
D7
Wire Wire Line
	2800 4400 2800 4550
Wire Wire Line
	2700 4400 2700 4550
Wire Wire Line
	2600 4400 2600 4550
Wire Wire Line
	2500 4400 2500 4550
Wire Wire Line
	2400 4400 2400 4550
Wire Wire Line
	2300 4400 2300 4550
Wire Wire Line
	2200 4400 2200 4550
Wire Wire Line
	2100 4400 2100 4550
Wire Wire Line
	3400 5150 3400 5050
Text Label 2100 3400 1    50   ~ 0
B0
Text Label 2200 3400 1    50   ~ 0
B1
Text Label 2300 3400 1    50   ~ 0
B2
Text Label 2400 3400 1    50   ~ 0
B3
Text Label 2500 3400 1    50   ~ 0
B4
Text Label 2600 3400 1    50   ~ 0
B5
Text Label 2700 3400 1    50   ~ 0
B6
Text Label 2800 3400 1    50   ~ 0
B7
Wire Wire Line
	2100 3400 2100 3250
Wire Wire Line
	2200 3400 2200 3250
Wire Wire Line
	2300 3400 2300 3250
Wire Wire Line
	2400 3400 2400 3250
Wire Wire Line
	2500 3400 2500 3250
Wire Wire Line
	2600 3400 2600 3250
Wire Wire Line
	2700 3400 2700 3250
Wire Wire Line
	2800 3400 2800 3250
$Comp
L power:GND #PWR038
U 1 1 5F032521
P 3400 2850
F 0 "#PWR038" H 3400 2600 50  0001 C CNN
F 1 "GND" V 3405 2722 50  0000 R CNN
F 2 "" H 3400 2850 50  0001 C CNN
F 3 "" H 3400 2850 50  0001 C CNN
	1    3400 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2850 3400 2750
$Comp
L power:+5V #PWR041
U 1 1 5F08E922
P 1800 2650
F 0 "#PWR041" H 1800 2500 50  0001 C CNN
F 1 "+5V" V 1815 2778 50  0000 L CNN
F 2 "" H 1800 2650 50  0001 C CNN
F 3 "" H 1800 2650 50  0001 C CNN
	1    1800 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small LED0
U 1 1 5F419692
P 2050 1850
F 0 "LED0" H 1900 1800 50  0000 C CNN
F 1 "LED_Small" H 2050 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2050 1850 50  0001 C CNN
F 3 "~" V 2050 1850 50  0001 C CNN
	1    2050 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 2200 2050 1950
$Comp
L power:GND #PWR046
U 1 1 5F4196A2
P 2800 1150
F 0 "#PWR046" H 2800 900 50  0001 C CNN
F 1 "GND" H 2805 977 50  0000 C CNN
F 2 "" H 2800 1150 50  0001 C CNN
F 3 "" H 2800 1150 50  0001 C CNN
	1    2800 1150
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small LED1
U 1 1 5F4196A8
P 2150 1850
F 0 "LED1" H 2000 1800 50  0000 C CNN
F 1 "LED_Small" H 2150 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2150 1850 50  0001 C CNN
F 3 "~" V 2150 1850 50  0001 C CNN
	1    2150 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 2200 2150 1950
Wire Wire Line
	2250 2200 2250 1950
$Comp
L Device:LED_Small LED2
U 1 1 5F4196C3
P 2250 1850
F 0 "LED2" H 2100 1800 50  0000 C CNN
F 1 "LED_Small" H 2250 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2250 1850 50  0001 C CNN
F 3 "~" V 2250 1850 50  0001 C CNN
	1    2250 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 2200 2350 1950
$Comp
L Device:LED_Small LED3
U 1 1 5F4196D1
P 2350 1850
F 0 "LED3" H 2200 1800 50  0000 C CNN
F 1 "LED_Small" H 2350 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2350 1850 50  0001 C CNN
F 3 "~" V 2350 1850 50  0001 C CNN
	1    2350 1850
	0    1    1    0   
$EndComp
$Comp
L Device:LED_Small LED4
U 1 1 5F4196D7
P 2450 1850
F 0 "LED4" H 2300 1800 50  0000 C CNN
F 1 "LED_Small" H 2450 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2450 1850 50  0001 C CNN
F 3 "~" V 2450 1850 50  0001 C CNN
	1    2450 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 2200 2450 1950
Wire Wire Line
	2550 2200 2550 1950
Wire Wire Line
	2650 2200 2650 1950
$Comp
L Device:LED_Small LED6
U 1 1 5F4196FA
P 2650 1850
F 0 "LED6" H 2500 1800 50  0000 C CNN
F 1 "LED_Small" H 2650 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2650 1850 50  0001 C CNN
F 3 "~" V 2650 1850 50  0001 C CNN
	1    2650 1850
	0    1    1    0   
$EndComp
$Comp
L Device:LED_Small LED7
U 1 1 5F419700
P 2750 1850
F 0 "LED7" H 2600 1800 50  0000 C CNN
F 1 "LED_Small" H 2750 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2750 1850 50  0001 C CNN
F 3 "~" V 2750 1850 50  0001 C CNN
	1    2750 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 2200 2750 1950
Wire Wire Line
	2800 2250 2800 2200
Wire Wire Line
	2800 2200 2750 2200
Connection ~ 2800 2200
Wire Wire Line
	2800 2200 2800 2150
Wire Wire Line
	2700 2150 2700 2200
Wire Wire Line
	2650 2200 2700 2200
Connection ~ 2700 2200
Wire Wire Line
	2700 2200 2700 2250
Wire Wire Line
	2600 2250 2600 2200
Wire Wire Line
	2550 2200 2600 2200
Connection ~ 2600 2200
Wire Wire Line
	2600 2200 2600 2150
Wire Wire Line
	2500 2250 2500 2200
Wire Wire Line
	2450 2200 2500 2200
Connection ~ 2500 2200
Wire Wire Line
	2500 2200 2500 2150
Wire Wire Line
	2400 2250 2400 2200
Wire Wire Line
	2350 2200 2400 2200
Connection ~ 2400 2200
Wire Wire Line
	2400 2200 2400 2150
Wire Wire Line
	2300 2250 2300 2200
Wire Wire Line
	2250 2200 2300 2200
Connection ~ 2300 2200
Wire Wire Line
	2300 2200 2300 2150
Wire Wire Line
	2200 2250 2200 2200
Wire Wire Line
	2150 2200 2200 2200
Connection ~ 2200 2200
Wire Wire Line
	2200 2200 2200 2150
Wire Wire Line
	2100 2250 2100 2200
Wire Wire Line
	2050 2200 2100 2200
Connection ~ 2100 2200
Wire Wire Line
	2100 2200 2100 2150
$Comp
L power:+5V #PWR019
U 1 1 5F8A94F5
P 5200 7200
F 0 "#PWR019" H 5200 7050 50  0001 C CNN
F 1 "+5V" H 5215 7373 50  0000 C CNN
F 2 "" H 5200 7200 50  0001 C CNN
F 3 "" H 5200 7200 50  0001 C CNN
	1    5200 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 7250 5200 7200
$Comp
L power:GND #PWR020
U 1 1 5F92DA51
P 4200 7400
F 0 "#PWR020" H 4200 7150 50  0001 C CNN
F 1 "GND" H 4205 7227 50  0000 C CNN
F 2 "" H 4200 7400 50  0001 C CNN
F 3 "" H 4200 7400 50  0001 C CNN
	1    4200 7400
	1    0    0    -1  
$EndComp
Text Notes 8500 4029 2    79   ~ 0
RAM
Text Notes 5700 4050 2    79   ~ 0
ROM
Text Label 3000 3650 1    50   ~ 0
WR#
$Comp
L Device:R_Network08 RN4
U 1 1 5EF30647
P 2350 1350
F 0 "RN4" V 2867 1350 50  0000 C CNN
F 1 "1k" V 2776 1350 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2825 1350 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2350 1350 50  0001 C CNN
	1    2350 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2050 1750 2050 1550
Wire Wire Line
	2150 1750 2150 1550
Wire Wire Line
	2250 1750 2250 1550
Wire Wire Line
	2350 1750 2350 1550
Wire Wire Line
	2550 1750 2550 1550
Wire Wire Line
	2650 1750 2650 1550
Wire Wire Line
	2750 1750 2750 1550
Wire Wire Line
	2750 1150 2800 1150
$Comp
L Device:R_Network08 RN1
U 1 1 5F268690
P 2400 6350
F 0 "RN1" V 1800 6350 50  0000 C CNN
F 1 "10k" V 1900 6350 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2875 6350 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2400 6350 50  0001 C CNN
	1    2400 6350
	-1   0    0    1   
$EndComp
Text Label 8650 4450 1    50   ~ 0
RAMSEL#
Text Label 8450 4450 1    50   ~ 0
RD#
Text Label 5600 4450 1    50   ~ 0
RD#
Wire Wire Line
	4200 7250 4200 7400
Wire Wire Line
	8450 4500 8450 4450
Wire Wire Line
	8650 4500 8650 4450
Wire Wire Line
	5600 4500 5600 4450
Text Notes 2700 4050 2    81   ~ 0
INPUT
Text Notes 2650 850  2    79   ~ 0
OUTPUT
Wire Wire Line
	3000 3650 3000 3250
$Comp
L power:+5V #PWR0101
U 1 1 5EF0C22D
P 2850 6550
F 0 "#PWR0101" H 2850 6400 50  0001 C CNN
F 1 "+5V" H 2865 6723 50  0000 C CNN
F 2 "" H 2850 6550 50  0001 C CNN
F 3 "" H 2850 6550 50  0001 C CNN
	1    2850 6550
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x08_Male JIN1
U 1 1 5EFDCCD8
P 2450 5800
F 0 "JIN1" H 2600 5250 50  0000 R CNN
F 1 "Conn_01x08_Male" H 2600 5150 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 2450 5800 50  0001 C CNN
F 3 "~" H 2450 5800 50  0001 C CNN
	1    2450 5800
	0    1    -1   0   
$EndComp
$Comp
L Connector:Conn_01x08_Male JOUT1
U 1 1 5EFDE82B
P 2500 1950
F 0 "JOUT1" H 2650 1400 50  0000 R CNN
F 1 "Conn_01x08_Male" H 2750 1300 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 2500 1950 50  0001 C CNN
F 3 "~" H 2500 1950 50  0001 C CNN
	1    2500 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 6550 2850 6550
Wire Wire Line
	2800 5550 2800 5600
Wire Wire Line
	2700 5550 2700 5600
Wire Wire Line
	2600 5550 2600 5600
Wire Wire Line
	2500 5550 2500 5600
Wire Wire Line
	2400 5550 2400 5600
Wire Wire Line
	2300 5550 2300 5600
Wire Wire Line
	2200 5550 2200 5600
Wire Wire Line
	2100 5550 2100 5600
$Comp
L Connector_Generic:Conn_01x08 JDATA1
U 1 1 60853B02
P 10750 5250
F 0 "JDATA1" H 10670 4625 50  0000 C CNN
F 1 "Conn_01x08" H 10670 4716 50  0000 C CNN
F 2 "" H 10750 5250 50  0001 C CNN
F 3 "~" H 10750 5250 50  0001 C CNN
	1    10750 5250
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 JA1
U 1 1 608691CD
P 10750 4100
F 0 "JA1" H 10670 3475 50  0000 C CNN
F 1 "Conn_01x08" H 10670 3566 50  0000 C CNN
F 2 "" H 10750 4100 50  0001 C CNN
F 3 "~" H 10750 4100 50  0001 C CNN
	1    10750 4100
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 JB1
U 1 1 6087E7B4
P 10750 2900
F 0 "JB1" H 10670 2275 50  0000 C CNN
F 1 "Conn_01x08" H 10670 2366 50  0000 C CNN
F 2 "" H 10750 2900 50  0001 C CNN
F 3 "~" H 10750 2900 50  0001 C CNN
	1    10750 2900
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 JCTR
U 1 1 60894DE5
P 10750 1800
F 0 "JCTR" H 10670 1475 50  0000 C CNN
F 1 "Conn_01x03" H 10670 1566 50  0000 C CNN
F 2 "" H 10750 1800 50  0001 C CNN
F 3 "~" H 10750 1800 50  0001 C CNN
	1    10750 1800
	1    0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 608AA4DE
P 6200 7350
F 0 "#FLG?" H 6200 7425 50  0001 C CNN
F 1 "PWR_FLAG" V 6200 7478 50  0000 L CNN
F 2 "" H 6200 7350 50  0001 C CNN
F 3 "~" H 6200 7350 50  0001 C CNN
	1    6200 7350
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 608AA5C8
P 6200 7450
F 0 "#FLG?" H 6200 7525 50  0001 C CNN
F 1 "PWR_FLAG" V 6200 7578 50  0000 L CNN
F 2 "" H 6200 7450 50  0001 C CNN
F 3 "~" H 6200 7450 50  0001 C CNN
	1    6200 7450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6200 7350 6300 7350
Wire Wire Line
	6200 7450 6300 7450
Text Label 10400 1800 2    50   ~ 0
WRX#
Wire Wire Line
	10550 1700 10400 1700
Wire Wire Line
	10550 1800 10400 1800
Wire Wire Line
	10550 1900 10400 1900
Wire Wire Line
	10550 2500 10400 2500
Wire Wire Line
	10550 2600 10400 2600
Wire Wire Line
	10550 2700 10400 2700
Wire Wire Line
	10550 2800 10400 2800
Wire Wire Line
	10550 2900 10400 2900
Wire Wire Line
	10550 3000 10400 3000
Wire Wire Line
	10550 3100 10400 3100
Wire Wire Line
	10550 3200 10400 3200
Wire Wire Line
	10550 3700 10400 3700
Wire Wire Line
	10550 3800 10400 3800
Wire Wire Line
	10550 3900 10400 3900
Wire Wire Line
	10550 4000 10400 4000
Wire Wire Line
	10550 4100 10400 4100
Wire Wire Line
	10550 4200 10400 4200
Wire Wire Line
	10550 4300 10400 4300
Wire Wire Line
	10550 4400 10400 4400
Wire Wire Line
	10550 4850 10400 4850
Wire Wire Line
	10550 4950 10400 4950
Wire Wire Line
	10550 5050 10400 5050
Wire Wire Line
	10550 5150 10400 5150
Wire Wire Line
	10550 5250 10400 5250
Wire Wire Line
	10550 5350 10400 5350
Wire Wire Line
	10550 5450 10400 5450
Wire Wire Line
	10550 5550 10400 5550
NoConn ~ 8100 2250
NoConn ~ 8200 2250
Text Label 8700 3550 1    50   ~ 0
WRX#
$Comp
L power:GND #PWR?
U 1 1 60D49D16
P 8800 3300
F 0 "#PWR?" H 8800 3050 50  0001 C CNN
F 1 "GND" V 8805 3172 50  0000 R CNN
F 2 "" H 8800 3300 50  0001 C CNN
F 3 "" H 8800 3300 50  0001 C CNN
	1    8800 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3300 8800 3250
Wire Wire Line
	8700 3550 8700 3250
$Comp
L power:GND #PWR?
U 1 1 60D7C9B1
P 9150 2800
F 0 "#PWR?" H 9150 2550 50  0001 C CNN
F 1 "GND" V 9155 2672 50  0000 R CNN
F 2 "" H 9150 2800 50  0001 C CNN
F 3 "" H 9150 2800 50  0001 C CNN
	1    9150 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60D7CA2C
P 7450 2700
F 0 "#PWR?" H 7450 2550 50  0001 C CNN
F 1 "+5V" V 7465 2828 50  0000 L CNN
F 2 "" H 7450 2700 50  0001 C CNN
F 3 "" H 7450 2700 50  0001 C CNN
	1    7450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5050 1800 5000
Wire Wire Line
	1800 2750 1800 2650
$Comp
L 74xx:74LS541 U?
U 1 1 608454BF
P 2600 5050
F 0 "U?" V 2646 4209 50  0000 R CNN
F 1 "74HC541" V 2555 4209 50  0000 R CNN
F 2 "" H 2600 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 2600 5050 50  0001 C CNN
	1    2600 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 5600 2100 5600
Connection ~ 2100 5600
Wire Wire Line
	2100 5600 2100 6150
Wire Wire Line
	2150 5600 2200 5600
Connection ~ 2200 5600
Wire Wire Line
	2200 5600 2200 6150
Wire Wire Line
	2250 5600 2300 5600
Connection ~ 2300 5600
Wire Wire Line
	2300 5600 2300 6150
Wire Wire Line
	2350 5600 2400 5600
Connection ~ 2400 5600
Wire Wire Line
	2400 5600 2400 6150
Wire Wire Line
	2450 5600 2500 5600
Connection ~ 2500 5600
Wire Wire Line
	2500 5600 2500 6150
Wire Wire Line
	2550 5600 2600 5600
Connection ~ 2600 5600
Wire Wire Line
	2600 5600 2600 6150
Wire Wire Line
	2650 5600 2700 5600
Connection ~ 2700 5600
Wire Wire Line
	2700 5600 2700 6150
Wire Wire Line
	2750 5600 2800 5600
Connection ~ 2800 5600
Wire Wire Line
	2800 5600 2800 6150
Text Label 3000 5850 1    50   ~ 0
RD#
Text Label 3100 5850 1    50   ~ 0
IOSEL#
Wire Wire Line
	3000 5850 3000 5550
Wire Wire Line
	3100 5850 3100 5550
Text Label 5800 4450 1    50   ~ 0
ROMSEL#
Wire Wire Line
	9100 2750 9150 2750
Wire Wire Line
	9150 2750 9150 2800
Wire Wire Line
	7450 2700 7450 2750
Wire Wire Line
	7450 2750 7500 2750
Text Label 7800 3400 1    50   ~ 0
B0
Text Label 7900 3400 1    50   ~ 0
B1
Text Label 8000 3400 1    50   ~ 0
B2
Text Label 8100 3400 1    50   ~ 0
B3
Text Label 8200 3400 1    50   ~ 0
B4
Text Label 8300 3400 1    50   ~ 0
B5
Text Label 8400 3400 1    50   ~ 0
B6
Text Label 8500 3400 1    50   ~ 0
B7
Wire Wire Line
	8500 3400 8500 3250
Wire Wire Line
	8400 3250 8400 3400
Wire Wire Line
	8300 3250 8300 3400
Wire Wire Line
	8200 3250 8200 3400
Wire Wire Line
	8100 3250 8100 3400
Wire Wire Line
	8000 3400 8000 3250
Wire Wire Line
	7900 3400 7900 3250
Wire Wire Line
	7800 3400 7800 3250
Text Label 6100 3050 1    50   ~ 0
IOSEL#
Text Label 5550 3050 1    50   ~ 0
ROMSEL#
Wire Wire Line
	6750 2650 6750 3050
Text Notes 7000 1000 2    79   ~ 0
DECODE
$Comp
L Device:LED_Small LED5
U 1 1 5F4196EC
P 2550 1850
F 0 "LED5" H 2400 1800 50  0000 C CNN
F 1 "LED_Small" H 2550 1736 50  0001 C CNN
F 2 "LED_THT:LED_D3.0mm" V 2550 1850 50  0001 C CNN
F 3 "~" V 2550 1850 50  0001 C CNN
	1    2550 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 1750 2450 1550
$Comp
L 74xx:74LS377 U?
U 1 1 611AF403
P 2600 2750
F 0 "U?" V 2646 1909 50  0000 R CNN
F 1 "74LS377" V 2555 1909 50  0000 R CNN
F 2 "" H 2600 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS377" H 2600 2750 50  0001 C CNN
	1    2600 2750
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS377 U?
U 1 1 611AF9AC
P 8300 2750
F 0 "U?" V 8600 2050 50  0000 R CNN
F 1 "74HC377" V 8500 2050 50  0000 R CNN
F 2 "" H 8300 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS377" H 8300 2750 50  0001 C CNN
	1    8300 2750
	0    -1   -1   0   
$EndComp
Text Label 3100 3650 1    50   ~ 0
IOSEL#
Wire Wire Line
	3100 3250 3100 3650
Wire Wire Line
	7800 2250 7800 2050
Wire Wire Line
	7900 2250 7900 2050
Wire Wire Line
	8000 2250 8000 2050
NoConn ~ 8300 2250
Wire Wire Line
	7550 1800 7600 1800
Wire Wire Line
	7600 1800 7600 1900
Wire Wire Line
	7600 2000 7550 2000
Wire Wire Line
	7600 1900 8400 1900
Wire Wire Line
	8400 1900 8400 2250
Connection ~ 7600 1900
Wire Wire Line
	7600 1900 7600 2000
$Comp
L 74xx:7400 U4
U 4 1 6094D119
P 7250 1900
F 0 "U4" H 7250 2150 50  0000 C CNN
F 1 "74HC00" H 7250 2250 50  0000 C CNN
F 2 "" H 7250 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn7400" H 7250 1900 50  0001 C CNN
	4    7250 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 3050 6100 2650
Wire Wire Line
	6950 1900 6850 1900
Wire Wire Line
	6850 1900 6850 2050
Wire Wire Line
	7550 1550 7600 1550
Wire Wire Line
	7600 1550 7600 1450
Wire Wire Line
	7600 1350 7550 1350
Wire Wire Line
	7600 1450 8500 1450
Wire Wire Line
	8500 1450 8500 2250
Connection ~ 7600 1450
Wire Wire Line
	7600 1450 7600 1350
Wire Wire Line
	6950 1450 6650 1450
Wire Wire Line
	6000 1450 6000 2050
Connection ~ 6650 1450
Wire Wire Line
	6650 1450 6000 1450
Wire Wire Line
	5550 1450 6000 1450
Connection ~ 6000 1450
Wire Wire Line
	8400 1900 8400 1700
Wire Wire Line
	8400 1700 6200 1700
Wire Wire Line
	6200 1700 6200 2050
Connection ~ 8400 1900
Wire Wire Line
	6650 2050 6650 1450
Wire Wire Line
	5550 1450 5550 3050
$EndSCHEMATC
