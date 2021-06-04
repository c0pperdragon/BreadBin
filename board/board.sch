EESchema Schematic File Version 4
LIBS:board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "BreadBinComputer"
Date ""
Rev ""
Comp ""
Comment1 "Add a 100nF capacitor to every IC to please the gods of signal integrity."
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0207
U 1 1 612BCFBF
P 1250 7450
F 0 "#PWR0207" H 1250 7200 50  0001 C CNN
F 1 "GND" H 1255 7277 50  0000 C CNN
F 2 "" H 1250 7450 50  0001 C CNN
F 3 "" H 1250 7450 50  0001 C CNN
	1    1250 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0208
U 1 1 612BCFEE
P 1250 6700
F 0 "#PWR0208" H 1250 6550 50  0001 C CNN
F 1 "+5V" H 1265 6873 50  0000 C CNN
F 2 "" H 1250 6700 50  0001 C CNN
F 3 "" H 1250 6700 50  0001 C CNN
	1    1250 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C4
U 1 1 612BD06E
P 1250 7150
F 0 "C4" H 1350 7150 50  0000 L CNN
F 1 "100uF" H 1300 7050 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 1250 7150 50  0001 C CNN
F 3 "~" H 1250 7150 50  0001 C CNN
	1    1250 7150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 612BD192
P 850 6700
F 0 "#FLG0101" H 850 6775 50  0001 C CNN
F 1 "PWR_FLAG" H 750 6850 50  0000 L CNN
F 2 "" H 850 6700 50  0001 C CNN
F 3 "~" H 850 6700 50  0001 C CNN
	1    850  6700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 612BD1C8
P 850 7450
F 0 "#FLG0102" H 850 7525 50  0001 C CNN
F 1 "PWR_FLAG" H 600 7600 50  0000 L CNN
F 2 "" H 850 7450 50  0001 C CNN
F 3 "~" H 850 7450 50  0001 C CNN
	1    850  7450
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS32 OR2
U 5 1 62016085
P 6500 6900
F 0 "OR2" H 6550 7400 50  0000 L CNN
F 1 "74HC32" H 6550 7300 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6500 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6500 6900 50  0001 C CNN
	5    6500 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 6201618D
P 6500 7450
F 0 "#PWR0127" H 6500 7200 50  0001 C CNN
F 1 "GND" H 6505 7277 50  0000 C CNN
F 2 "" H 6500 7450 50  0001 C CNN
F 3 "" H 6500 7450 50  0001 C CNN
	1    6500 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0128
U 1 1 620161E9
P 6500 6350
F 0 "#PWR0128" H 6500 6200 50  0001 C CNN
F 1 "+5V" H 6515 6523 50  0000 C CNN
F 2 "" H 6500 6350 50  0001 C CNN
F 3 "" H 6500 6350 50  0001 C CNN
	1    6500 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 62609387
P 1650 3650
F 0 "Y1" H 1650 3918 50  0000 C CNN
F 1 "Crystal" H 1650 3827 50  0000 C CNN
F 2 "Crystal:Crystal_HC18-U_Vertical" H 1650 3650 50  0001 C CNN
F 3 "~" H 1650 3650 50  0001 C CNN
	1    1650 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 62609613
P 1350 3850
F 0 "C2" H 1442 3896 50  0000 L CNN
F 1 "33pF" H 1442 3805 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 1350 3850 50  0001 C CNN
F 3 "~" H 1350 3850 50  0001 C CNN
	1    1350 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 6260970F
P 1950 3850
F 0 "C1" H 1750 3900 50  0000 L CNN
F 1 "33pF" H 1700 3800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 1950 3850 50  0001 C CNN
F 3 "~" H 1950 3850 50  0001 C CNN
	1    1950 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 62634084
P 1350 4000
F 0 "#PWR0132" H 1350 3750 50  0001 C CNN
F 1 "GND" H 1355 3827 50  0000 C CNN
F 2 "" H 1350 4000 50  0001 C CNN
F 3 "" H 1350 4000 50  0001 C CNN
	1    1350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 626340D0
P 1950 4000
F 0 "#PWR0133" H 1950 3750 50  0001 C CNN
F 1 "GND" H 1955 3827 50  0000 C CNN
F 2 "" H 1950 4000 50  0001 C CNN
F 3 "" H 1950 4000 50  0001 C CNN
	1    1950 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 62634131
P 1950 3450
F 0 "R1" H 2009 3496 50  0000 L CNN
F 1 "1k" H 2009 3405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 1950 3450 50  0001 C CNN
F 3 "~" H 1950 3450 50  0001 C CNN
	1    1950 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 626341D7
P 1650 3250
F 0 "R2" V 1454 3250 50  0000 C CNN
F 1 "1M" V 1545 3250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 1650 3250 50  0001 C CNN
F 3 "~" H 1650 3250 50  0001 C CNN
	1    1650 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 3750 1350 3650
Wire Wire Line
	1550 3250 1350 3250
Connection ~ 1350 3250
Wire Wire Line
	1350 3250 1350 2850
Connection ~ 1350 3650
Wire Wire Line
	1350 3650 1350 3250
$Comp
L 74xx:74HC04 INV1
U 7 1 62914B85
P 5800 6900
F 0 "INV1" H 5850 7400 50  0000 L CNN
F 1 "74HC04" H 5850 7300 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5800 6900 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 5800 6900 50  0001 C CNN
	7    5800 6900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0134
U 1 1 62914C47
P 5800 6350
F 0 "#PWR0134" H 5800 6200 50  0001 C CNN
F 1 "+5V" H 5815 6523 50  0000 C CNN
F 2 "" H 5800 6350 50  0001 C CNN
F 3 "" H 5800 6350 50  0001 C CNN
	1    5800 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 62914CA6
P 5800 7450
F 0 "#PWR0135" H 5800 7200 50  0001 C CNN
F 1 "GND" H 5805 7277 50  0000 C CNN
F 2 "" H 5800 7450 50  0001 C CNN
F 3 "" H 5800 7450 50  0001 C CNN
	1    5800 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6400 6500 6350
Wire Wire Line
	6500 7450 6500 7400
Wire Wire Line
	5800 6350 5800 6400
Wire Wire Line
	5800 7400 5800 7450
Wire Wire Line
	1350 3650 1500 3650
Wire Wire Line
	1800 3650 1950 3650
Wire Wire Line
	1950 3650 1950 3750
Wire Wire Line
	1950 3650 1950 3550
Connection ~ 1950 3650
Wire Wire Line
	1750 3250 1950 3250
Connection ~ 1950 3250
Wire Wire Line
	1950 3250 1950 3350
Wire Wire Line
	1350 3950 1350 4000
Wire Wire Line
	1950 3950 1950 4000
$Comp
L Timer:NE555 TIM1
U 1 1 6328C04A
P 2200 1600
F 0 "TIM1" H 2400 2100 50  0000 C CNN
F 1 "NE555" H 2400 2000 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 2200 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 2200 1600 50  0001 C CNN
	1    2200 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 632BAB41
P 1450 1250
F 0 "C3" H 1358 1204 50  0000 R CNN
F 1 "10uF" H 1358 1295 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 1450 1250 50  0001 C CNN
F 3 "~" H 1450 1250 50  0001 C CNN
	1    1450 1250
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0136
U 1 1 632BAC81
P 2200 1100
F 0 "#PWR0136" H 2200 950 50  0001 C CNN
F 1 "+5V" H 2215 1273 50  0000 C CNN
F 2 "" H 2200 1100 50  0001 C CNN
F 3 "" H 2200 1100 50  0001 C CNN
	1    2200 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 63319C93
P 1450 1800
F 0 "R3" H 1509 1846 50  0000 L CNN
F 1 "33k" H 1509 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 1450 1800 50  0001 C CNN
F 3 "~" H 1450 1800 50  0001 C CNN
	1    1450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1350 1450 1400
$Comp
L power:GND #PWR0137
U 1 1 6340801B
P 2250 2050
F 0 "#PWR0137" H 2250 1800 50  0001 C CNN
F 1 "GND" V 2255 1922 50  0000 R CNN
F 2 "" H 2250 2050 50  0001 C CNN
F 3 "" H 2250 2050 50  0001 C CNN
	1    2250 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 1400 1450 1400
Connection ~ 1450 1400
Wire Wire Line
	1450 1400 1450 1700
Wire Wire Line
	2200 2000 2200 2050
Wire Wire Line
	1450 1900 1450 2050
Wire Wire Line
	1450 2050 2200 2050
NoConn ~ 2700 1600
Wire Wire Line
	2200 2050 2250 2050
Connection ~ 2200 2050
Wire Wire Line
	2200 1100 1450 1100
Wire Wire Line
	1450 1100 1450 1150
Connection ~ 2200 1100
Wire Wire Line
	2200 1100 2200 1200
Wire Wire Line
	1450 1400 1300 1400
Wire Wire Line
	1300 1400 1300 2150
Wire Wire Line
	1300 2150 2700 2150
Wire Wire Line
	2700 2150 2700 1800
Wire Wire Line
	2700 1400 2800 1400
NoConn ~ 1700 1600
NoConn ~ 1700 1800
$Comp
L Connector_Generic:Conn_01x02 JPOWER1
U 1 1 64DD40DB
P 850 7200
F 0 "JPOWER1" H 770 6875 50  0000 C CNN
F 1 "Conn_01x02" H 770 6966 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 850 7200 50  0001 C CNN
F 3 "~" H 850 7200 50  0001 C CNN
	1    850  7200
	-1   0    0    1   
$EndComp
Wire Wire Line
	850  6700 850  6750
Wire Wire Line
	850  6750 1250 6750
Wire Wire Line
	1250 6750 1250 7050
Wire Wire Line
	1250 6700 1250 6750
Connection ~ 1250 6750
Wire Wire Line
	1250 7450 1250 7400
Wire Wire Line
	1250 7400 850  7400
Wire Wire Line
	850  7400 850  7450
Connection ~ 1250 7400
Wire Wire Line
	1250 7400 1250 7250
Connection ~ 1250 7250
Connection ~ 1250 7050
Wire Wire Line
	1050 7100 1100 7100
Wire Wire Line
	1100 7100 1100 7050
Wire Wire Line
	1100 7050 1250 7050
Wire Wire Line
	1050 7200 1100 7200
Wire Wire Line
	1100 7200 1100 7250
Wire Wire Line
	1100 7250 1250 7250
$Comp
L 74xx:74HC04 INV1
U 4 1 60751A4F
P 2500 4100
F 0 "INV1" H 2500 4417 50  0000 C CNN
F 1 "74HC04" H 2500 4326 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2500 4100 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 2500 4100 50  0001 C CNN
	4    2500 4100
	1    0    0    -1  
$EndComp
Connection ~ 1950 2850
Wire Wire Line
	1950 2850 1950 3250
$Comp
L 74xx:74HC04 INV1
U 5 1 60751C2E
P 2500 7450
F 0 "INV1" H 2500 7133 50  0000 C CNN
F 1 "74HC04" H 2500 7224 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2500 7450 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 2500 7450 50  0001 C CNN
	5    2500 7450
	1    0    0    1   
$EndComp
$Comp
L 74xx:74HC04 INV1
U 6 1 60751D57
P 2500 6900
F 0 "INV1" H 2500 7217 50  0000 C CNN
F 1 "74HC04" H 2500 7126 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2500 6900 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 2500 6900 50  0001 C CNN
	6    2500 6900
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:74164 RES1
U 1 1 60777DBE
P 3750 1300
F 0 "RES1" H 4150 1600 50  0000 C CNN
F 1 "74HC164" H 4200 1500 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3750 1300 50  0001 C CNN
F 3 "" H 3750 1300 50  0001 C CNN
	1    3750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1400 2800 1050
Wire Wire Line
	2800 1050 3200 1050
$Comp
L power:+5V #PWR0140
U 1 1 60858F5C
P 3200 1400
F 0 "#PWR0140" H 3200 1250 50  0001 C CNN
F 1 "+5V" H 3150 1550 50  0000 L CNN
F 2 "" H 3200 1400 50  0001 C CNN
F 3 "" H 3200 1400 50  0001 C CNN
	1    3200 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 1300 3200 1400
Wire Wire Line
	4300 2100 4350 2100
NoConn ~ 4300 2000
NoConn ~ 4300 1900
NoConn ~ 4300 1800
NoConn ~ 4300 1700
NoConn ~ 4300 1600
NoConn ~ 4300 1500
NoConn ~ 4300 1350
$Comp
L power:GND #PWR0142
U 1 1 60B65DC9
P 4000 900
F 0 "#PWR0142" H 4000 650 50  0001 C CNN
F 1 "GND" V 4005 772 50  0000 R CNN
F 2 "" H 4000 900 50  0001 C CNN
F 3 "" H 4000 900 50  0001 C CNN
	1    4000 900 
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0143
U 1 1 60B65EA6
P 3500 900
F 0 "#PWR0143" H 3500 750 50  0001 C CNN
F 1 "+5V" V 3515 1028 50  0000 L CNN
F 2 "" H 3500 900 50  0001 C CNN
F 3 "" H 3500 900 50  0001 C CNN
	1    3500 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 900  3950 900 
Wire Wire Line
	3950 900  3950 950 
Wire Wire Line
	3500 900  3750 900 
Wire Wire Line
	3750 900  3750 950 
$Sheet
S 1850 4600 2500 800 
U 60ADE4F9
F0 "BreadBinCPU" 50
F1 "CPU.sch" 50
F2 "A0" I B 4250 5400 50 
F3 "A1" I B 4150 5400 50 
F4 "A2" I B 4050 5400 50 
F5 "A3" I B 3950 5400 50 
F6 "A4" I B 3850 5400 50 
F7 "A5" I B 3750 5400 50 
F8 "A6" I B 3650 5400 50 
F9 "A7" I B 3550 5400 50 
F10 "B0" I B 3450 5400 50 
F11 "B1" I B 3350 5400 50 
F12 "B2" I B 3250 5400 50 
F13 "B3" I B 3150 5400 50 
F14 "B4" I B 3050 5400 50 
F15 "B5" I B 2950 5400 50 
F16 "B6" I B 2850 5400 50 
F17 "B7" I B 2750 5400 50 
F18 "C0" I B 2650 5400 50 
F19 "C1" I B 2550 5400 50 
F20 "C2" I B 2450 5400 50 
F21 "C3" I B 2350 5400 50 
F22 "C4" I B 2250 5400 50 
F23 "C5" I B 2150 5400 50 
F24 "C6" I B 2050 5400 50 
F25 "C7" I B 1950 5400 50 
F26 "D7" I T 3550 4600 50 
F27 "D6" I T 3650 4600 50 
F28 "D5" I T 3750 4600 50 
F29 "D4" I T 3850 4600 50 
F30 "D3" I T 3950 4600 50 
F31 "D2" I T 4050 4600 50 
F32 "D1" I T 4150 4600 50 
F33 "D0" I T 4250 4600 50 
F34 "WR#" I T 3350 4600 50 
F35 "RD#" I T 3250 4600 50 
F36 "CLK" I T 2950 4600 50 
F37 "RES#" I T 3050 4600 50 
$EndSheet
$Comp
L Library:AS6C4008 RAM1
U 1 1 60AAA482
P 9600 4950
F 0 "RAM1" V 9646 4520 50  0000 R CNN
F 1 "AS6C4008" V 9555 4520 50  0000 R CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 9650 4450 50  0001 L CNN
F 3 "http://download.intel.com/design/archives/flash/docs/29045101.pdf" H 9600 5200 50  0001 C CNN
	1    9600 4950
	0    -1   -1   0   
$EndComp
$Comp
L Library:SST39SF040 ROM1
U 1 1 60AAA595
P 7000 4950
F 0 "ROM1" V 7046 4520 50  0000 R CNN
F 1 "SST39SF040" V 6955 4520 50  0000 R CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 7050 4450 50  0001 L CNN
F 3 "http://download.intel.com/design/archives/flash/docs/29045101.pdf" H 7000 5200 50  0001 C CNN
	1    7000 4950
	0    -1   -1   0   
$EndComp
Text Label 6900 5750 1    50   ~ 0
AD0
Text Label 6800 5750 1    50   ~ 0
AD1
Text Label 6700 5750 1    50   ~ 0
AD2
Text Label 6600 5750 1    50   ~ 0
AD3
Text Label 6500 5750 1    50   ~ 0
AD4
Text Label 6400 5750 1    50   ~ 0
AD5
Text Label 6300 5750 1    50   ~ 0
AD6
Text Label 6200 5750 1    50   ~ 0
AD7
Text Label 6100 5750 1    50   ~ 0
AD12
Text Label 6000 5750 1    50   ~ 0
AD15
Text Label 5900 5750 1    50   ~ 0
AD16
Text Label 5800 5750 1    50   ~ 0
AD18
Wire Wire Line
	5800 5750 5800 5550
Wire Wire Line
	5900 5750 5900 5550
Wire Wire Line
	6000 5750 6000 5550
Wire Wire Line
	6100 5750 6100 5550
Wire Wire Line
	6200 5750 6200 5550
Wire Wire Line
	6300 5750 6300 5550
Wire Wire Line
	6400 5750 6400 5550
Wire Wire Line
	6500 5750 6500 5550
Wire Wire Line
	6600 5750 6600 5550
Wire Wire Line
	6700 5750 6700 5550
Wire Wire Line
	6800 5750 6800 5550
Wire Wire Line
	6900 5750 6900 5550
Text Label 7000 5750 1    50   ~ 0
D0
Text Label 7100 5750 1    50   ~ 0
D1
Text Label 7200 5750 1    50   ~ 0
D2
Wire Wire Line
	7000 5750 7000 5550
Wire Wire Line
	7100 5750 7100 5550
Wire Wire Line
	7200 5750 7200 5550
$Comp
L power:GND #PWR0101
U 1 1 60ABC014
P 7300 5600
F 0 "#PWR0101" H 7300 5350 50  0001 C CNN
F 1 "GND" H 7305 5427 50  0000 C CNN
F 2 "" H 7300 5600 50  0001 C CNN
F 3 "" H 7300 5600 50  0001 C CNN
	1    7300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5600 7300 5550
$Comp
L power:+5V #PWR0102
U 1 1 60ABEB90
P 5800 4250
F 0 "#PWR0102" H 5800 4100 50  0001 C CNN
F 1 "+5V" H 5815 4423 50  0000 C CNN
F 2 "" H 5800 4250 50  0001 C CNN
F 3 "" H 5800 4250 50  0001 C CNN
	1    5800 4250
	1    0    0    -1  
$EndComp
Text Label 5900 4150 3    50   ~ 0
WR#
Text Label 6000 4150 3    50   ~ 0
AD17
Text Label 6100 4150 3    50   ~ 0
AD14
Text Label 6200 4150 3    50   ~ 0
AD13
Text Label 6300 4150 3    50   ~ 0
AD8
Text Label 6400 4150 3    50   ~ 0
AD9
Text Label 6500 4150 3    50   ~ 0
AD11
Text Label 6600 4150 3    50   ~ 0
RD#
Text Label 6700 4150 3    50   ~ 0
AD10
Text Label 6800 4050 3    50   ~ 0
ROMSEL#
Text Label 6900 4150 3    50   ~ 0
D7
Text Label 7000 4150 3    50   ~ 0
D6
Text Label 7100 4150 3    50   ~ 0
D5
Text Label 7200 4150 3    50   ~ 0
D4
Text Label 7300 4150 3    50   ~ 0
D3
Wire Wire Line
	5800 4350 5800 4250
Wire Wire Line
	5900 4350 5900 4150
Wire Wire Line
	6000 4350 6000 4150
Wire Wire Line
	6100 4350 6100 4150
Wire Wire Line
	6200 4350 6200 4150
Wire Wire Line
	6300 4350 6300 4150
Wire Wire Line
	6400 4350 6400 4150
Wire Wire Line
	6500 4350 6500 4150
Wire Wire Line
	6600 4350 6600 4150
Wire Wire Line
	6700 4350 6700 4150
Wire Wire Line
	6800 4350 6800 4050
Wire Wire Line
	6900 4350 6900 4150
Wire Wire Line
	7000 4350 7000 4150
Wire Wire Line
	7100 4350 7100 4150
Wire Wire Line
	7200 4350 7200 4150
Wire Wire Line
	7300 4350 7300 4150
Text Label 9800 5750 1    50   ~ 0
D2
Text Label 9700 5750 1    50   ~ 0
D1
Text Label 9600 5750 1    50   ~ 0
D0
Text Label 9500 5750 1    50   ~ 0
AD18
Text Label 9400 5750 1    50   ~ 0
AD16
Text Label 9300 5750 1    50   ~ 0
AD15
Text Label 9200 5750 1    50   ~ 0
AD12
Text Label 9100 5750 1    50   ~ 0
AD7
Text Label 9000 5750 1    50   ~ 0
AD6
Text Label 8900 5750 1    50   ~ 0
AD5
Text Label 8800 5750 1    50   ~ 0
AD4
Text Label 8700 5750 1    50   ~ 0
AD3
Text Label 8600 5750 1    50   ~ 0
AD2
Text Label 8500 5750 1    50   ~ 0
AD1
Text Label 8400 5750 1    50   ~ 0
AD0
$Comp
L power:GND #PWR0103
U 1 1 60ADD508
P 9900 5650
F 0 "#PWR0103" H 9900 5400 50  0001 C CNN
F 1 "GND" H 9905 5477 50  0000 C CNN
F 2 "" H 9900 5650 50  0001 C CNN
F 3 "" H 9900 5650 50  0001 C CNN
	1    9900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 5650 9900 5550
Wire Wire Line
	9800 5750 9800 5550
Wire Wire Line
	9700 5750 9700 5550
Wire Wire Line
	9600 5750 9600 5550
Wire Wire Line
	9500 5750 9500 5550
Wire Wire Line
	9400 5750 9400 5550
Wire Wire Line
	9300 5750 9300 5550
Wire Wire Line
	9200 5750 9200 5550
Wire Wire Line
	9100 5750 9100 5550
Wire Wire Line
	9000 5750 9000 5550
Wire Wire Line
	8900 5750 8900 5550
Wire Wire Line
	8800 5750 8800 5550
Wire Wire Line
	8700 5750 8700 5550
Wire Wire Line
	8600 5750 8600 5550
Wire Wire Line
	8500 5750 8500 5550
Wire Wire Line
	8400 5750 8400 5550
Text Label 9900 4150 3    50   ~ 0
D3
Text Label 9800 4150 3    50   ~ 0
D4
Text Label 9700 4150 3    50   ~ 0
D5
Text Label 9600 4150 3    50   ~ 0
D6
Text Label 9500 4150 3    50   ~ 0
D7
Text Label 9300 4150 3    50   ~ 0
AD17
Text Label 9100 4150 3    50   ~ 0
AD14
Text Label 9000 4150 3    50   ~ 0
AD13
Text Label 8900 4150 3    50   ~ 0
AD8
Text Label 8800 4150 3    50   ~ 0
AD9
Text Label 8600 4150 3    50   ~ 0
AD11
Text Label 8500 4150 3    50   ~ 0
AD10
Wire Wire Line
	9900 4350 9900 4150
Wire Wire Line
	9800 4350 9800 4150
Wire Wire Line
	9700 4350 9700 4150
Wire Wire Line
	9600 4350 9600 4150
Wire Wire Line
	9500 4350 9500 4150
Wire Wire Line
	9300 4350 9300 4150
Wire Wire Line
	9100 4350 9100 4150
Wire Wire Line
	9000 4350 9000 4150
Wire Wire Line
	8900 4350 8900 4150
Wire Wire Line
	8800 4350 8800 4150
Wire Wire Line
	8600 4350 8600 4150
Wire Wire Line
	8500 4350 8500 4150
$Comp
L power:+5V #PWR0104
U 1 1 60B3BDAF
P 8400 4250
F 0 "#PWR0104" H 8400 4100 50  0001 C CNN
F 1 "+5V" H 8415 4423 50  0000 C CNN
F 2 "" H 8400 4250 50  0001 C CNN
F 3 "" H 8400 4250 50  0001 C CNN
	1    8400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4350 8400 4250
Text Label 8700 4150 3    50   ~ 0
WR#
Wire Wire Line
	8700 4350 8700 4150
Text Label 9200 4150 3    50   ~ 0
RD#
Wire Wire Line
	9200 4350 9200 4150
Text Label 9400 4050 3    50   ~ 0
RAMSEL#
Wire Wire Line
	9400 4350 9400 4050
Text Label 4250 5750 1    50   ~ 0
AD0
Text Label 4150 5750 1    50   ~ 0
AD1
Text Label 4050 5750 1    50   ~ 0
AD2
Text Label 3950 5750 1    50   ~ 0
AD3
Text Label 3850 5750 1    50   ~ 0
AD4
Text Label 3750 5750 1    50   ~ 0
AD5
Text Label 3650 5750 1    50   ~ 0
AD6
Text Label 3550 5750 1    50   ~ 0
AD7
Text Label 3450 5750 1    50   ~ 0
AD8
Text Label 3350 5750 1    50   ~ 0
AD9
Text Label 3250 5750 1    50   ~ 0
AD10
Text Label 3150 5750 1    50   ~ 0
AD11
Text Label 3050 5750 1    50   ~ 0
AD12
Text Label 2950 5750 1    50   ~ 0
AD13
Text Label 2850 5750 1    50   ~ 0
AD14
Text Label 2750 5750 1    50   ~ 0
AD15
Text Label 2650 5750 1    50   ~ 0
AD16
Text Label 2550 5750 1    50   ~ 0
AD17
Text Label 2450 5750 1    50   ~ 0
AD18
Wire Wire Line
	4250 5750 4250 5400
Wire Wire Line
	4150 5750 4150 5400
Wire Wire Line
	4050 5750 4050 5400
Wire Wire Line
	3950 5750 3950 5400
Wire Wire Line
	3850 5750 3850 5400
Wire Wire Line
	3750 5750 3750 5400
Wire Wire Line
	3650 5750 3650 5400
Wire Wire Line
	3550 5750 3550 5400
Wire Wire Line
	3450 5750 3450 5400
Wire Wire Line
	3350 5750 3350 5400
Wire Wire Line
	3250 5750 3250 5400
Wire Wire Line
	3150 5750 3150 5400
Wire Wire Line
	3050 5750 3050 5400
Wire Wire Line
	2950 5750 2950 5400
Wire Wire Line
	2850 5750 2850 5400
Wire Wire Line
	2750 5750 2750 5400
Wire Wire Line
	2650 5750 2650 5400
Wire Wire Line
	2550 5750 2550 5400
Wire Wire Line
	2450 5750 2450 5400
NoConn ~ 2350 5400
NoConn ~ 2250 5400
NoConn ~ 2150 5400
Text Label 4250 4150 3    50   ~ 0
D0
Text Label 4150 4150 3    50   ~ 0
D1
Text Label 4050 4150 3    50   ~ 0
D2
Text Label 3950 4150 3    50   ~ 0
D3
Text Label 3850 4150 3    50   ~ 0
D4
Text Label 3750 4150 3    50   ~ 0
D5
Text Label 3650 4150 3    50   ~ 0
D6
Text Label 3550 4150 3    50   ~ 0
D7
Wire Wire Line
	4250 4600 4250 4150
Wire Wire Line
	4150 4150 4150 4600
Wire Wire Line
	4050 4600 4050 4150
Wire Wire Line
	3950 4150 3950 4600
Wire Wire Line
	3850 4600 3850 4150
Wire Wire Line
	3750 4150 3750 4600
Wire Wire Line
	3650 4600 3650 4150
Wire Wire Line
	3550 4150 3550 4600
Text Label 3350 4150 3    50   ~ 0
WR#
Text Label 3250 4150 3    50   ~ 0
RD#
Wire Wire Line
	3350 4600 3350 4150
Wire Wire Line
	3250 4150 3250 4600
Wire Wire Line
	1950 2850 2200 2850
Connection ~ 3200 1400
Wire Wire Line
	2950 1150 3200 1150
Wire Wire Line
	2950 4600 2950 3500
Wire Wire Line
	4350 2400 4350 2100
Wire Wire Line
	3050 2400 4350 2400
Wire Wire Line
	3050 2400 3050 4600
Wire Wire Line
	2200 3100 2800 3100
Wire Wire Line
	2800 3100 2800 2850
Wire Wire Line
	2200 3100 2200 3500
Wire Wire Line
	2800 3500 2950 3500
Connection ~ 2950 3500
Wire Wire Line
	2950 1150 2950 3500
$Comp
L 74xx:74HC04 INV1
U 1 1 60D6D7E8
P 1650 2850
F 0 "INV1" H 1650 3167 50  0000 C CNN
F 1 "74HC04" H 1650 3076 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1650 2850 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 1650 2850 50  0001 C CNN
	1    1650 2850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 INV1
U 2 1 60D6D89C
P 2500 2850
F 0 "INV1" H 2500 3167 50  0000 C CNN
F 1 "74HC04" H 2500 3076 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2500 2850 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 2500 2850 50  0001 C CNN
	2    2500 2850
	1    0    0    -1  
$EndComp
Text Label 1950 5750 1    50   ~ 0
AD23
Text Label 2050 5750 1    50   ~ 0
AD22
$Comp
L 74xx:74LS32 OR2
U 1 1 60D820F3
P 6750 2950
F 0 "OR2" H 6750 3275 50  0000 C CNN
F 1 "74HC32" H 6750 3184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6750 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6750 2950 50  0001 C CNN
	1    6750 2950
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 OR2
U 2 1 60D8215E
P 9150 2950
F 0 "OR2" H 9150 3275 50  0000 C CNN
F 1 "74HC32" H 9150 3184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9150 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9150 2950 50  0001 C CNN
	2    9150 2950
	0    -1   -1   0   
$EndComp
Text Label 4050 7450 2    50   ~ 0
ROMSEL#
Wire Wire Line
	3050 6150 2050 6150
Wire Wire Line
	2050 5400 2050 6150
Wire Wire Line
	3050 6350 2900 6350
Wire Wire Line
	1950 5400 1950 6350
Text Label 4050 6250 2    50   ~ 0
RAMSEL#
Wire Wire Line
	3650 6250 4050 6250
Wire Wire Line
	3050 6700 2900 6700
Wire Wire Line
	2900 6700 2900 6350
Connection ~ 2900 6350
Wire Wire Line
	2900 6350 1950 6350
Wire Wire Line
	3050 6900 2800 6900
Wire Wire Line
	2200 6900 2050 6900
Wire Wire Line
	2050 6900 2050 6150
Connection ~ 2050 6150
Wire Wire Line
	1950 6350 1950 7450
Wire Wire Line
	1950 7450 2200 7450
Connection ~ 1950 6350
Wire Wire Line
	2800 7450 4050 7450
Text Label 4050 6800 2    50   ~ 0
IOSEL#
Wire Wire Line
	3650 6800 4050 6800
$Comp
L 74xx:74LS574 OUT1
U 1 1 60E23CFD
P 6350 2100
F 0 "OUT1" V 6396 1259 50  0000 R CNN
F 1 "74HC574" V 6305 1259 50  0000 R CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6350 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6350 2100 50  0001 C CNN
	1    6350 2100
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 OR2
U 3 1 60E5121A
P 3350 6250
F 0 "OR2" V 3396 6070 50  0000 R CNN
F 1 "74HC32" V 3305 6070 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3350 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3350 6250 50  0001 C CNN
	3    3350 6250
	1    0    0    -1  
$EndComp
Text Label 6650 3550 1    50   ~ 0
IOSEL#
Text Label 6850 3550 1    50   ~ 0
WR#
Wire Wire Line
	6650 3550 6650 3250
Wire Wire Line
	6850 3550 6850 3250
Wire Wire Line
	6750 2650 6750 2600
$Comp
L power:GND #PWR0105
U 1 1 60E73F1C
P 6900 2650
F 0 "#PWR0105" H 6900 2400 50  0001 C CNN
F 1 "GND" V 6905 2522 50  0000 R CNN
F 2 "" H 6900 2650 50  0001 C CNN
F 3 "" H 6900 2650 50  0001 C CNN
	1    6900 2650
	0    -1   -1   0   
$EndComp
Text Label 5850 2850 1    50   ~ 0
D7
Text Label 5950 2850 1    50   ~ 0
D6
Text Label 6050 2850 1    50   ~ 0
D5
Text Label 6150 2850 1    50   ~ 0
D4
Text Label 6250 2850 1    50   ~ 0
D3
Text Label 6350 2850 1    50   ~ 0
D2
Text Label 6450 2850 1    50   ~ 0
D1
Text Label 6550 2850 1    50   ~ 0
D0
Wire Wire Line
	5850 2850 5850 2600
Wire Wire Line
	5950 2850 5950 2600
Wire Wire Line
	6050 2850 6050 2600
Wire Wire Line
	6150 2850 6150 2600
Wire Wire Line
	6250 2850 6250 2600
Wire Wire Line
	6350 2850 6350 2600
Wire Wire Line
	6450 2850 6450 2600
Wire Wire Line
	6550 2850 6550 2600
Wire Wire Line
	6850 2600 6850 2650
Wire Wire Line
	6850 2650 6900 2650
$Comp
L power:GND #PWR0106
U 1 1 60EF1121
P 7150 2150
F 0 "#PWR0106" H 7150 1900 50  0001 C CNN
F 1 "GND" H 7155 1977 50  0000 C CNN
F 2 "" H 7150 2150 50  0001 C CNN
F 3 "" H 7150 2150 50  0001 C CNN
	1    7150 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 60EF117A
P 5550 2050
F 0 "#PWR0107" H 5550 1900 50  0001 C CNN
F 1 "+5V" H 5565 2223 50  0000 C CNN
F 2 "" H 5550 2050 50  0001 C CNN
F 3 "" H 5550 2050 50  0001 C CNN
	1    5550 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2100 5550 2050
Wire Wire Line
	7150 2100 7150 2150
$Comp
L Connector_Generic:Conn_01x08 JOUT1
U 1 1 60F0BB19
P 6250 950
F 0 "JOUT1" V 6467 896 50  0000 C CNN
F 1 "Conn_01x08" V 6376 896 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 6250 950 50  0001 C CNN
F 3 "~" H 6250 950 50  0001 C CNN
	1    6250 950 
	0    1    -1   0   
$EndComp
Wire Wire Line
	5850 1600 5850 1150
Wire Wire Line
	5950 1600 5950 1150
Wire Wire Line
	6050 1600 6050 1150
Wire Wire Line
	6150 1600 6150 1150
Wire Wire Line
	6250 1600 6250 1150
Wire Wire Line
	6350 1600 6350 1150
Wire Wire Line
	6450 1600 6450 1150
Wire Wire Line
	6550 1600 6550 1150
$Comp
L 74xx:74HC245 IN1
U 1 1 60F8B3B2
P 8650 2100
F 0 "IN1" V 8696 1259 50  0000 R CNN
F 1 "74HC245" V 8605 1259 50  0000 R CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 8650 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 8650 2100 50  0001 C CNN
	1    8650 2100
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 OR2
U 4 1 60F8B8F9
P 3350 6800
F 0 "OR2" V 3396 6620 50  0000 R CNN
F 1 "74HC32" V 3305 6620 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3350 6800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3350 6800 50  0001 C CNN
	4    3350 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2650 9150 2600
Text Label 9050 3550 1    50   ~ 0
IOSEL#
Text Label 9250 3550 1    50   ~ 0
RD#
Wire Wire Line
	9250 3550 9250 3250
Wire Wire Line
	9050 3550 9050 3250
$Comp
L power:GND #PWR0108
U 1 1 60FD66F2
P 8950 2650
F 0 "#PWR0108" H 8950 2400 50  0001 C CNN
F 1 "GND" H 8955 2477 50  0000 C CNN
F 2 "" H 8950 2650 50  0001 C CNN
F 3 "" H 8950 2650 50  0001 C CNN
	1    8950 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2650 9050 2650
Wire Wire Line
	9050 2650 9050 2600
Text Label 8850 2850 1    50   ~ 0
D0
Text Label 8750 2850 1    50   ~ 0
D1
Text Label 8650 2850 1    50   ~ 0
D2
Text Label 8550 2850 1    50   ~ 0
D3
Text Label 8450 2850 1    50   ~ 0
D4
Text Label 8350 2850 1    50   ~ 0
D5
Text Label 8250 2850 1    50   ~ 0
D6
Text Label 8150 2850 1    50   ~ 0
D7
Wire Wire Line
	8150 2850 8150 2600
Wire Wire Line
	8250 2850 8250 2600
Wire Wire Line
	8350 2850 8350 2600
Wire Wire Line
	8450 2850 8450 2600
Wire Wire Line
	8550 2850 8550 2600
Wire Wire Line
	8650 2850 8650 2600
Wire Wire Line
	8750 2850 8750 2600
Wire Wire Line
	8850 2850 8850 2600
$Comp
L power:GND #PWR0109
U 1 1 610648C5
P 9450 2150
F 0 "#PWR0109" H 9450 1900 50  0001 C CNN
F 1 "GND" H 9455 1977 50  0000 C CNN
F 2 "" H 9450 2150 50  0001 C CNN
F 3 "" H 9450 2150 50  0001 C CNN
	1    9450 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 61064924
P 7850 2050
F 0 "#PWR0110" H 7850 1900 50  0001 C CNN
F 1 "+5V" H 7865 2223 50  0000 C CNN
F 2 "" H 7850 2050 50  0001 C CNN
F 3 "" H 7850 2050 50  0001 C CNN
	1    7850 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2100 7850 2050
Wire Wire Line
	9450 2100 9450 2150
$Comp
L Connector_Generic:Conn_01x08 JIN1
U 1 1 61085E19
P 8550 900
F 0 "JIN1" V 8767 846 50  0000 C CNN
F 1 "Conn_01x08" V 8676 846 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 8550 900 50  0001 C CNN
F 3 "~" H 8550 900 50  0001 C CNN
	1    8550 900 
	0    1    -1   0   
$EndComp
Wire Wire Line
	8150 1600 8150 1550
Wire Wire Line
	8250 1600 8250 1550
Wire Wire Line
	8350 1600 8350 1550
Wire Wire Line
	8450 1600 8450 1550
Wire Wire Line
	8550 1600 8550 1550
Wire Wire Line
	8650 1600 8650 1550
Wire Wire Line
	8750 1600 8750 1550
Wire Wire Line
	8850 1600 8850 1550
$Comp
L Device:R_Network08 RN1
U 1 1 61133376
P 8500 1350
F 0 "RN1" H 8880 1396 50  0000 L CNN
F 1 "10k" H 8880 1305 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 8975 1350 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8500 1350 50  0001 C CNN
	1    8500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1550 8150 1550
Connection ~ 8150 1550
Wire Wire Line
	8150 1550 8150 1100
Wire Wire Line
	8200 1550 8250 1550
Connection ~ 8250 1550
Wire Wire Line
	8250 1550 8250 1100
Wire Wire Line
	8300 1550 8350 1550
Connection ~ 8350 1550
Wire Wire Line
	8350 1550 8350 1100
Wire Wire Line
	8400 1550 8450 1550
Connection ~ 8450 1550
Wire Wire Line
	8450 1550 8450 1100
Wire Wire Line
	8500 1550 8550 1550
Connection ~ 8550 1550
Wire Wire Line
	8550 1550 8550 1100
Wire Wire Line
	8600 1550 8650 1550
Connection ~ 8650 1550
Wire Wire Line
	8650 1550 8650 1100
Wire Wire Line
	8700 1550 8750 1550
Connection ~ 8750 1550
Wire Wire Line
	8750 1550 8750 1100
Wire Wire Line
	8800 1550 8850 1550
Connection ~ 8850 1550
Wire Wire Line
	8850 1550 8850 1100
$Comp
L power:+5V #PWR0111
U 1 1 611C81C4
P 8050 1150
F 0 "#PWR0111" H 8050 1000 50  0001 C CNN
F 1 "+5V" V 8065 1278 50  0000 L CNN
F 2 "" H 8050 1150 50  0001 C CNN
F 3 "" H 8050 1150 50  0001 C CNN
	1    8050 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 1150 8100 1150
$Comp
L 74xx:74HC04 INV1
U 3 1 60BB8A88
P 2500 3500
F 0 "INV1" H 2500 3817 50  0000 C CNN
F 1 "74HC04" H 2500 3726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2500 3500 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 2500 3500 50  0001 C CNN
	3    2500 3500
	1    0    0    -1  
$EndComp
NoConn ~ 2800 4100
Wire Wire Line
	2200 3500 2200 4100
Connection ~ 2200 3500
$EndSCHEMATC
