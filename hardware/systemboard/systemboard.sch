EESchema Schematic File Version 4
LIBS:systemboard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "BreadBin system board"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5F982E2B
P 6150 850
F 0 "J2" V 6367 796 50  0000 C CNN
F 1 "Conn_01x08" V 6276 796 50  0000 C CNN
F 2 "" H 6150 850 50  0001 C CNN
F 3 "~" H 6150 850 50  0001 C CNN
	1    6150 850 
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J1
U 1 1 5F982EFE
P 7300 850
F 0 "J1" V 7266 1130 50  0000 L CNN
F 1 "Conn_01x06" V 7175 1130 50  0000 L CNN
F 2 "" H 7300 850 50  0001 C CNN
F 3 "~" H 7300 850 50  0001 C CNN
	1    7300 850 
	0    1    -1   0   
$EndComp
Text Label 7500 1300 1    50   ~ 0
RD#
Text Label 7400 1300 1    50   ~ 0
WR#
Text Label 7300 1300 1    50   ~ 0
RES#
Text Label 7200 1300 1    50   ~ 0
CLK
$Comp
L power:+5V #PWR0101
U 1 1 5F982FB3
P 7100 1300
F 0 "#PWR0101" H 7100 1150 50  0001 C CNN
F 1 "+5V" H 7115 1473 50  0000 C CNN
F 2 "" H 7100 1300 50  0001 C CNN
F 3 "" H 7100 1300 50  0001 C CNN
	1    7100 1300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F982FF0
P 7000 1100
F 0 "#PWR0102" H 7000 850 50  0001 C CNN
F 1 "GND" H 7005 927 50  0000 C CNN
F 2 "" H 7000 1100 50  0001 C CNN
F 3 "" H 7000 1100 50  0001 C CNN
	1    7000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1100 7000 1050
Wire Wire Line
	7100 1300 7100 1050
Wire Wire Line
	7400 1050 7400 1300
Wire Wire Line
	7500 1050 7500 1300
$Comp
L power:GND #PWR0103
U 1 1 5F9834D0
P 3250 3850
F 0 "#PWR0103" H 3250 3600 50  0001 C CNN
F 1 "GND" H 3255 3677 50  0000 C CNN
F 2 "" H 3250 3850 50  0001 C CNN
F 3 "" H 3250 3850 50  0001 C CNN
	1    3250 3850
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5F983517
P 850 3750
F 0 "#PWR0104" H 850 3600 50  0001 C CNN
F 1 "+5V" H 865 3923 50  0000 C CNN
F 2 "" H 850 3750 50  0001 C CNN
F 3 "" H 850 3750 50  0001 C CNN
	1    850  3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	850  3850 850  3750
Text Label 3550 1250 1    50   ~ 0
A0
Text Label 3450 1250 1    50   ~ 0
A1
Text Label 3350 1250 1    50   ~ 0
A2
Text Label 3250 1250 1    50   ~ 0
A3
Text Label 3150 1250 1    50   ~ 0
A4
Text Label 3050 1250 1    50   ~ 0
A5
Text Label 2950 1250 1    50   ~ 0
A6
Text Label 2850 1250 1    50   ~ 0
A7
Text Label 2750 1250 1    50   ~ 0
A8
Text Label 2650 1250 1    50   ~ 0
A9
Text Label 2550 1250 1    50   ~ 0
A10
Text Label 2450 1250 1    50   ~ 0
A11
Text Label 2350 1250 1    50   ~ 0
A12
Text Label 2250 1250 1    50   ~ 0
A13
Text Label 2150 1250 1    50   ~ 0
A14
Text Label 2050 1250 1    50   ~ 0
A15
Wire Wire Line
	2950 3250 2950 3350
Wire Wire Line
	3250 3250 2950 3250
$Comp
L Connector_Generic:Conn_01x16 J3
U 1 1 5F9C10D6
P 2850 850
F 0 "J3" V 3067 796 50  0000 C CNN
F 1 "Conn_01x16" V 2976 796 50  0000 C CNN
F 2 "" H 2850 850 50  0001 C CNN
F 3 "~" H 2850 850 50  0001 C CNN
	1    2850 850 
	0    1    -1   0   
$EndComp
$Comp
L 74xx:74HC245 U4
U 1 1 5FA115D2
P 6250 3850
F 0 "U4" V 6750 3450 50  0000 C CNN
F 1 "74HC245" V 6650 3350 50  0000 C CNN
F 2 "" H 6250 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 6250 3850 50  0001 C CNN
	1    6250 3850
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC245 U3
U 1 1 5FA9F853
P 4400 3850
F 0 "U3" V 4900 3450 50  0000 C CNN
F 1 "74HC245" V 4800 3350 50  0000 C CNN
F 2 "" H 4400 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 4400 3850 50  0001 C CNN
	1    4400 3850
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC04 U8
U 1 1 5FAD80A3
P 9150 5050
F 0 "U8" H 9150 5367 50  0000 C CNN
F 1 "74HC04" H 9150 5276 50  0000 C CNN
F 2 "" H 9150 5050 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 9150 5050 50  0001 C CNN
	1    9150 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U8
U 2 1 5FAD8137
P 9900 5050
F 0 "U8" H 9950 4750 50  0000 R CNN
F 1 "74HC04" H 10050 4850 50  0000 R CNN
F 2 "" H 9900 5050 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 9900 5050 50  0001 C CNN
	2    9900 5050
	1    0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U8
U 3 1 5FAD8190
P 10600 5050
F 0 "U8" H 10600 5367 50  0000 C CNN
F 1 "74HC04" H 10600 5276 50  0000 C CNN
F 2 "" H 10600 5050 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 10600 5050 50  0001 C CNN
	3    10600 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U8
U 4 1 5FAD81F1
P 8900 1450
F 0 "U8" H 8900 1133 50  0000 C CNN
F 1 "74HC04" H 8900 1224 50  0000 C CNN
F 2 "" H 8900 1450 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 8900 1450 50  0001 C CNN
	4    8900 1450
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 U8
U 5 1 5FAD8258
P 10750 3450
F 0 "U8" H 10750 3767 50  0000 C CNN
F 1 "74HC04" H 10750 3676 50  0000 C CNN
F 2 "" H 10750 3450 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 10750 3450 50  0001 C CNN
	5    10750 3450
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC04 U8
U 6 1 5FAD82C5
P 2200 5500
F 0 "U8" H 2200 5817 50  0000 C CNN
F 1 "74HC04" H 2200 5726 50  0000 C CNN
F 2 "" H 2200 5500 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 2200 5500 50  0001 C CNN
	6    2200 5500
	1    0    0    -1  
$EndComp
Text Label 6450 1150 1    50   ~ 0
D0
Text Label 6350 1150 1    50   ~ 0
D1
Text Label 6250 1150 1    50   ~ 0
D2
Text Label 6150 1150 1    50   ~ 0
D3
Text Label 6050 1150 1    50   ~ 0
D4
Text Label 5950 1150 1    50   ~ 0
D5
Text Label 5850 1150 1    50   ~ 0
D6
Text Label 5750 1150 1    50   ~ 0
D7
$Comp
L Device:C_Small C1
U 1 1 5FB5E2B7
P 8800 6050
F 0 "C1" H 8892 6096 50  0000 L CNN
F 1 "33pF" H 8892 6005 50  0000 L CNN
F 2 "" H 8800 6050 50  0001 C CNN
F 3 "~" H 8800 6050 50  0001 C CNN
	1    8800 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5FB5E325
P 9500 6050
F 0 "C2" H 9592 6096 50  0000 L CNN
F 1 "33pF" H 9592 6005 50  0000 L CNN
F 2 "" H 9500 6050 50  0001 C CNN
F 3 "~" H 9500 6050 50  0001 C CNN
	1    9500 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5FB5E3B7
P 8800 6200
F 0 "#PWR0105" H 8800 5950 50  0001 C CNN
F 1 "GND" H 8805 6027 50  0000 C CNN
F 2 "" H 8800 6200 50  0001 C CNN
F 3 "" H 8800 6200 50  0001 C CNN
	1    8800 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FB5E40B
P 9500 6200
F 0 "#PWR0106" H 9500 5950 50  0001 C CNN
F 1 "GND" H 9505 6027 50  0000 C CNN
F 2 "" H 9500 6200 50  0001 C CNN
F 3 "" H 9500 6200 50  0001 C CNN
	1    9500 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5FB713E9
P 9150 5850
F 0 "Y1" H 9150 6118 50  0000 C CNN
F 1 "Crystal" H 9150 6027 50  0000 C CNN
F 2 "" H 9150 5850 50  0001 C CNN
F 3 "~" H 9150 5850 50  0001 C CNN
	1    9150 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5FB714AA
P 9150 5450
F 0 "R1" V 8954 5450 50  0000 C CNN
F 1 "220k" V 9045 5450 50  0000 C CNN
F 2 "" H 9150 5450 50  0001 C CNN
F 3 "~" H 9150 5450 50  0001 C CNN
	1    9150 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5FB71512
P 9500 5650
F 0 "R2" H 9559 5696 50  0000 L CNN
F 1 "22" H 9559 5605 50  0000 L CNN
F 2 "" H 9500 5650 50  0001 C CNN
F 3 "~" H 9500 5650 50  0001 C CNN
	1    9500 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 5450 8800 5450
Wire Wire Line
	8800 5450 8800 5850
Wire Wire Line
	8800 6150 8800 6200
Wire Wire Line
	9000 5850 8800 5850
Connection ~ 8800 5850
Wire Wire Line
	8800 5850 8800 5950
Wire Wire Line
	9500 5750 9500 5850
Wire Wire Line
	9500 6150 9500 6200
Wire Wire Line
	9500 5550 9500 5450
Wire Wire Line
	9500 5450 9250 5450
Wire Wire Line
	9500 5450 9500 5050
Wire Wire Line
	9500 5050 9450 5050
Connection ~ 9500 5450
Wire Wire Line
	8800 5450 8800 5050
Wire Wire Line
	8800 5050 8850 5050
Connection ~ 8800 5450
Wire Wire Line
	9300 5850 9500 5850
Connection ~ 9500 5850
Wire Wire Line
	9500 5850 9500 5950
Wire Wire Line
	9500 5050 9600 5050
Connection ~ 9500 5050
$Comp
L 74xx:74LS74 U7
U 1 1 6002F2BA
P 7950 3900
F 0 "U7" H 8250 4300 50  0000 R CNN
F 1 "74HC74" H 8350 4200 50  0000 R CNN
F 2 "" H 7950 3900 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7950 3900 50  0001 C CNN
	1    7950 3900
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U7
U 2 1 6002F327
P 7950 2950
F 0 "U7" H 8150 3350 50  0000 C CNN
F 1 "74HC74" H 8200 3250 50  0000 C CNN
F 2 "" H 7950 2950 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 7950 2950 50  0001 C CNN
	2    7950 2950
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U7
U 3 1 6002F3A0
P 900 6900
F 0 "U7" H 1130 6946 50  0000 L CNN
F 1 "74HC74" H 1130 6855 50  0000 L CNN
F 2 "" H 900 6900 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 900 6900 50  0001 C CNN
	3    900  6900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U9
U 1 1 601611CB
P 7950 4800
F 0 "U9" H 7950 5125 50  0000 C CNN
F 1 "74HC32" H 7950 5034 50  0000 C CNN
F 2 "" H 7950 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7950 4800 50  0001 C CNN
	1    7950 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U9
U 2 1 60161252
P 5450 6750
F 0 "U9" H 5450 7075 50  0000 C CNN
F 1 "74HC32" H 5450 6984 50  0000 C CNN
F 2 "" H 5450 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5450 6750 50  0001 C CNN
	2    5450 6750
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 U9
U 3 1 601612C7
P 6000 6750
F 0 "U9" H 6000 7075 50  0000 C CNN
F 1 "74HC32" H 6000 6984 50  0000 C CNN
F 2 "" H 6000 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6000 6750 50  0001 C CNN
	3    6000 6750
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 U9
U 4 1 60161340
P 7950 2100
F 0 "U9" H 8250 2350 50  0000 R CNN
F 1 "74HC32" H 8350 2250 50  0000 R CNN
F 2 "" H 7950 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7950 2100 50  0001 C CNN
	4    7950 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U9
U 5 1 601613CB
P 2500 6900
F 0 "U9" H 2730 6946 50  0000 L CNN
F 1 "74HC32" H 2730 6855 50  0000 L CNN
F 2 "" H 2500 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2500 6900 50  0001 C CNN
	5    2500 6900
	1    0    0    -1  
$EndComp
$Comp
L Timer:NE555 U6
U 1 1 602470C7
P 9750 1650
F 0 "U6" H 9750 2228 50  0000 C CNN
F 1 "NE555" H 9750 2137 50  0000 C CNN
F 2 "" H 9750 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 9750 1650 50  0001 C CNN
	1    9750 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9200 1450 9250 1450
Wire Wire Line
	8600 1450 7300 1450
Wire Wire Line
	7300 1050 7300 1450
NoConn ~ 9250 1650
NoConn ~ 10250 1650
NoConn ~ 10250 1850
$Comp
L power:GND #PWR0107
U 1 1 602A1B4C
P 9700 2100
F 0 "#PWR0107" H 9700 1850 50  0001 C CNN
F 1 "GND" H 9705 1927 50  0000 C CNN
F 2 "" H 9700 2100 50  0001 C CNN
F 3 "" H 9700 2100 50  0001 C CNN
	1    9700 2100
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 602A1BBF
P 9800 1250
F 0 "#PWR0108" H 9800 1100 50  0001 C CNN
F 1 "+5V" V 9815 1378 50  0000 L CNN
F 2 "" H 9800 1250 50  0001 C CNN
F 3 "" H 9800 1250 50  0001 C CNN
	1    9800 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	9750 1250 9800 1250
Wire Wire Line
	9750 2100 9750 2050
Wire Wire Line
	9250 1850 9200 1850
Wire Wire Line
	9200 1850 9200 2250
Wire Wire Line
	9200 2250 10450 2250
Wire Wire Line
	10450 2250 10450 1450
Wire Wire Line
	10450 1450 10250 1450
$Comp
L Device:C_Small C3
U 1 1 602D8ABF
P 10450 2350
F 0 "C3" H 10542 2396 50  0000 L CNN
F 1 "100nF" H 10542 2305 50  0000 L CNN
F 2 "" H 10450 2350 50  0001 C CNN
F 3 "~" H 10450 2350 50  0001 C CNN
	1    10450 2350
	1    0    0    -1  
$EndComp
Connection ~ 10450 2250
$Comp
L power:GND #PWR0109
U 1 1 602D8B6A
P 10450 2500
F 0 "#PWR0109" H 10450 2250 50  0001 C CNN
F 1 "GND" H 10455 2327 50  0000 C CNN
F 2 "" H 10450 2500 50  0001 C CNN
F 3 "" H 10450 2500 50  0001 C CNN
	1    10450 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 2500 10450 2450
$Comp
L Device:R_Small R3
U 1 1 602EBB8E
P 10450 1200
F 0 "R3" H 10509 1246 50  0000 L CNN
F 1 "1M" H 10509 1155 50  0000 L CNN
F 2 "" H 10450 1200 50  0001 C CNN
F 3 "~" H 10450 1200 50  0001 C CNN
	1    10450 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 602EBC0B
P 10450 1000
F 0 "#PWR0110" H 10450 850 50  0001 C CNN
F 1 "+5V" H 10465 1173 50  0000 C CNN
F 2 "" H 10450 1000 50  0001 C CNN
F 3 "" H 10450 1000 50  0001 C CNN
	1    10450 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 1300 10450 1450
Connection ~ 10450 1450
Wire Wire Line
	10450 1100 10450 1000
Wire Wire Line
	1150 4800 1150 4350
Text Label 1150 4800 1    50   ~ 0
ZEROPAGE#
$Comp
L Library:IS61C1024AL U1
U 1 1 5F9B5E59
P 3800 2200
F 0 "U1" V 3900 2300 50  0000 R CNN
F 1 "IS61C1024AL" V 3800 2700 50  0000 R CNN
F 2 "" H 3800 2200 50  0001 C CNN
F 3 "" H 3800 2200 50  0001 C CNN
	1    3800 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 1800 4800 1300
Wire Wire Line
	4800 1300 3550 1300
Wire Wire Line
	3550 1050 3550 1300
Wire Wire Line
	4600 1800 4600 1350
Wire Wire Line
	4600 1350 3450 1350
Wire Wire Line
	3450 1050 3450 1350
Wire Wire Line
	4500 1800 4500 1400
Wire Wire Line
	4500 1400 3350 1400
Wire Wire Line
	3350 1050 3350 1400
Wire Wire Line
	4400 1800 4400 1450
Wire Wire Line
	4400 1450 3250 1450
Wire Wire Line
	3250 1050 3250 1450
Wire Wire Line
	4300 1800 4300 1500
Wire Wire Line
	4300 1500 3150 1500
Wire Wire Line
	3150 1050 3150 1500
Wire Wire Line
	4000 1800 4000 1550
Wire Wire Line
	4000 1550 3050 1550
Wire Wire Line
	3050 1050 3050 1550
Wire Wire Line
	4000 2600 4000 2650
Wire Wire Line
	2950 1050 2950 2650
Wire Wire Line
	4100 2600 4100 2700
Wire Wire Line
	2850 1050 2850 2700
Wire Wire Line
	4200 2600 4200 2750
Wire Wire Line
	4200 2750 2750 2750
Wire Wire Line
	2750 1050 2750 2750
Wire Wire Line
	4300 2600 4300 2800
Wire Wire Line
	4300 2800 2650 2800
Wire Wire Line
	2650 1050 2650 2800
Wire Wire Line
	4400 2600 4400 2850
Wire Wire Line
	4400 2850 2550 2850
Wire Wire Line
	2550 1050 2550 2850
Wire Wire Line
	4500 2600 4500 2900
Wire Wire Line
	4500 2900 2450 2900
Wire Wire Line
	2450 1050 2450 2900
Wire Wire Line
	4600 2600 4600 2950
Wire Wire Line
	4600 2950 2350 2950
Wire Wire Line
	2350 1050 2350 2950
Wire Wire Line
	4700 2600 4700 3000
Wire Wire Line
	4700 3000 2250 3000
Wire Wire Line
	2250 1050 2250 3000
Wire Wire Line
	4800 2600 4800 3050
Wire Wire Line
	4800 3050 2150 3050
Wire Wire Line
	2150 1050 2150 3050
Wire Wire Line
	4900 2600 4900 3100
Wire Wire Line
	4900 3100 2050 3100
Wire Wire Line
	2050 1050 2050 3100
$Comp
L power:GND #PWR0111
U 1 1 5FB1A5DE
P 5000 2850
F 0 "#PWR0111" H 5000 2600 50  0001 C CNN
F 1 "GND" H 5005 2677 50  0000 C CNN
F 2 "" H 5000 2850 50  0001 C CNN
F 3 "" H 5000 2850 50  0001 C CNN
	1    5000 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 5FB1A7D1
P 3900 1750
F 0 "#PWR0112" H 3900 1600 50  0001 C CNN
F 1 "+5V" V 3915 1878 50  0000 L CNN
F 2 "" H 3900 1750 50  0001 C CNN
F 3 "" H 3900 1750 50  0001 C CNN
	1    3900 1750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5FB1A8AE
P 5400 2650
F 0 "#PWR0113" H 5400 2400 50  0001 C CNN
F 1 "GND" V 5405 2522 50  0000 R CNN
F 2 "" H 5400 2650 50  0001 C CNN
F 3 "" H 5400 2650 50  0001 C CNN
	1    5400 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 2600 5300 2850
Wire Wire Line
	5300 2850 6250 2850
Wire Wire Line
	5200 2600 5200 2900
Wire Wire Line
	5200 2900 6350 2900
Wire Wire Line
	5100 2600 5100 2950
Wire Wire Line
	5100 2950 6450 2950
Wire Wire Line
	6450 2950 6450 1050
Wire Wire Line
	6250 1050 6250 2850
Wire Wire Line
	5400 2650 5400 2600
Wire Wire Line
	3900 1800 3900 1750
Wire Wire Line
	5000 2600 5000 2850
Wire Wire Line
	5400 1800 5400 1750
Wire Wire Line
	5400 1750 6150 1750
Wire Wire Line
	6150 1750 6150 1050
Wire Wire Line
	5300 1800 5300 1700
Wire Wire Line
	5300 1700 6050 1700
Wire Wire Line
	6050 1700 6050 1050
Wire Wire Line
	5200 1800 5200 1650
Wire Wire Line
	5200 1650 5950 1650
Wire Wire Line
	5950 1650 5950 1050
Wire Wire Line
	5100 1800 5100 1600
Wire Wire Line
	5100 1600 5850 1600
Wire Wire Line
	5850 1600 5850 1050
Wire Wire Line
	5000 1800 5000 1550
Wire Wire Line
	5000 1550 5750 1550
Wire Wire Line
	5750 1550 5750 1050
Text Label 4700 1600 3    50   ~ 0
RD#
Text Label 4200 1600 3    50   ~ 0
WR#
Wire Wire Line
	4700 1800 4700 1600
$Comp
L 74xx:74LS688 U2
U 1 1 5F9831DB
P 2050 3850
F 0 "U2" V 2150 4950 50  0000 L CNN
F 1 "74HC688" V 2250 4950 50  0000 L CNN
F 2 "" H 2050 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS688" H 2050 3850 50  0001 C CNN
	1    2050 3850
	0    -1   1    0   
$EndComp
Wire Wire Line
	2050 3100 2050 3350
Connection ~ 2050 3100
Wire Wire Line
	2150 3050 2150 3350
Connection ~ 2150 3050
Wire Wire Line
	2250 3000 2250 3350
Connection ~ 2250 3000
Wire Wire Line
	2350 2950 2350 3350
Connection ~ 2350 2950
Wire Wire Line
	2450 2900 2450 3350
Connection ~ 2450 2900
Wire Wire Line
	2550 2850 2550 3350
Connection ~ 2550 2850
Wire Wire Line
	2650 2800 2650 3350
Connection ~ 2650 2800
Wire Wire Line
	2750 2750 2750 3350
Connection ~ 2750 2750
$Comp
L power:GND #PWR0114
U 1 1 5FCC85B2
P 1100 3250
F 0 "#PWR0114" H 1100 3000 50  0001 C CNN
F 1 "GND" V 1105 3122 50  0000 R CNN
F 2 "" H 1100 3250 50  0001 C CNN
F 3 "" H 1100 3250 50  0001 C CNN
	1    1100 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 3250 1150 3250
Wire Wire Line
	1150 3250 1150 3350
Wire Wire Line
	1150 3250 1250 3250
Wire Wire Line
	1250 3250 1250 3350
Connection ~ 1150 3250
Wire Wire Line
	1250 3250 1350 3250
Wire Wire Line
	1350 3250 1350 3350
Connection ~ 1250 3250
Wire Wire Line
	1350 3250 1450 3250
Wire Wire Line
	1450 3250 1450 3350
Connection ~ 1350 3250
Wire Wire Line
	1450 3250 1550 3250
Wire Wire Line
	1550 3250 1550 3350
Connection ~ 1450 3250
Wire Wire Line
	1550 3250 1650 3250
Wire Wire Line
	1650 3250 1650 3350
Connection ~ 1550 3250
Wire Wire Line
	1650 3250 1750 3250
Wire Wire Line
	1750 3250 1750 3350
Connection ~ 1650 3250
Wire Wire Line
	1750 3250 1850 3250
Wire Wire Line
	1850 3250 1850 3350
Connection ~ 1750 3250
Wire Wire Line
	6450 2950 6450 3350
Connection ~ 6450 2950
Wire Wire Line
	6350 1050 6350 2900
Connection ~ 6350 2900
Wire Wire Line
	6350 2900 6350 3350
Wire Wire Line
	6250 2850 6250 3350
Connection ~ 6250 2850
Wire Wire Line
	6150 3350 6150 1750
Connection ~ 6150 1750
Wire Wire Line
	6050 1700 6050 3350
Connection ~ 6050 1700
Wire Wire Line
	5950 3350 5950 1650
Connection ~ 5950 1650
Wire Wire Line
	5850 1600 5850 3350
Connection ~ 5850 1600
Wire Wire Line
	5750 3350 5750 1550
Connection ~ 5750 1550
Wire Wire Line
	2950 2650 4000 2650
Wire Wire Line
	2850 2700 4100 2700
Text Label 3900 3200 3    50   ~ 0
A7
Text Label 4000 3200 3    50   ~ 0
A6
Text Label 4100 3200 3    50   ~ 0
A5
Text Label 4200 3200 3    50   ~ 0
A4
Text Label 4300 3200 3    50   ~ 0
A3
Text Label 4400 3200 3    50   ~ 0
A2
Text Label 4500 3200 3    50   ~ 0
A1
Text Label 4600 3200 3    50   ~ 0
A0
Wire Wire Line
	3900 3350 3900 3200
Wire Wire Line
	4000 3350 4000 3200
Wire Wire Line
	4100 3350 4100 3200
Wire Wire Line
	4200 3350 4200 3200
Wire Wire Line
	4300 3350 4300 3200
Wire Wire Line
	4400 3350 4400 3200
Wire Wire Line
	4500 3350 4500 3200
Wire Wire Line
	4600 3350 4600 3200
Connection ~ 3250 3850
Wire Wire Line
	3250 3250 3250 3850
$Sheet
S 3800 4750 2750 1600
U 5FA0C35A
F0 "IOSystem" 50
F1 "IOSystem.sch" 50
F2 "A0" I T 4600 4750 50 
F3 "A1" I T 4500 4750 50 
F4 "A2" I T 4400 4750 50 
F5 "A3" I T 4300 4750 50 
F6 "A4" I T 4200 4750 50 
F7 "A5" I T 4100 4750 50 
F8 "A6" I T 4000 4750 50 
F9 "A7" I T 3900 4750 50 
F10 "D0" I T 6450 4750 50 
F11 "D1" I T 6350 4750 50 
F12 "D2" I T 6250 4750 50 
F13 "D4" I T 6050 4750 50 
F14 "D5" I T 5950 4750 50 
F15 "D6" I T 5850 4750 50 
F16 "D7" I T 5750 4750 50 
F17 "D3" I T 6150 4750 50 
F18 "IOWR#" I B 6000 6350 50 
F19 "IORD#" I B 5450 6350 50 
F20 "RES#" I B 6450 6350 50 
$EndSheet
Wire Wire Line
	3900 4750 3900 4350
Wire Wire Line
	4000 4750 4000 4350
Wire Wire Line
	4100 4750 4100 4350
Wire Wire Line
	4200 4750 4200 4350
Wire Wire Line
	4300 4750 4300 4350
Wire Wire Line
	4400 4750 4400 4350
Wire Wire Line
	4500 4750 4500 4350
Wire Wire Line
	4600 4750 4600 4350
Wire Wire Line
	5750 4750 5750 4350
Wire Wire Line
	5850 4750 5850 4350
Wire Wire Line
	5950 4750 5950 4350
Wire Wire Line
	6050 4750 6050 4350
Wire Wire Line
	6150 4750 6150 4350
Wire Wire Line
	6250 4750 6250 4350
Wire Wire Line
	6350 4750 6350 4350
Wire Wire Line
	6450 4750 6450 4350
$Comp
L power:GND #PWR0115
U 1 1 6009E9DD
P 4900 4450
F 0 "#PWR0115" H 4900 4200 50  0001 C CNN
F 1 "GND" H 4905 4277 50  0000 C CNN
F 2 "" H 4900 4450 50  0001 C CNN
F 3 "" H 4900 4450 50  0001 C CNN
	1    4900 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4450 4900 4400
Wire Wire Line
	4800 4350 4800 4400
Wire Wire Line
	4900 4400 4800 4400
Connection ~ 4900 4400
Wire Wire Line
	4900 4400 4900 4350
Wire Wire Line
	4200 1600 4200 1800
NoConn ~ 9200 2950
NoConn ~ 9300 2950
NoConn ~ 9400 2950
$Comp
L power:+5V #PWR0116
U 1 1 601EC503
P 8800 3400
F 0 "#PWR0116" H 8800 3250 50  0001 C CNN
F 1 "+5V" H 8815 3573 50  0000 C CNN
F 2 "" H 8800 3400 50  0001 C CNN
F 3 "" H 8800 3400 50  0001 C CNN
	1    8800 3400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS163 U5
U 1 1 600F6923
P 9600 3450
F 0 "U5" V 10100 3200 50  0000 R CNN
F 1 "74LS163" V 10000 3250 50  0000 R CNN
F 2 "" H 9600 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 9600 3450 50  0001 C CNN
	1    9600 3450
	0    -1   -1   0   
$EndComp
NoConn ~ 9600 2950
Wire Wire Line
	9100 2850 10750 2850
Wire Wire Line
	10750 2850 10750 3150
Wire Wire Line
	9100 2850 9100 2950
Wire Wire Line
	10750 3750 10750 4000
Wire Wire Line
	10750 4000 10100 4000
Wire Wire Line
	10100 4000 10100 3950
Wire Wire Line
	9700 2100 9750 2100
Wire Wire Line
	8800 3450 8800 3400
$Comp
L power:GND #PWR0117
U 1 1 6029060E
P 10400 3500
F 0 "#PWR0117" H 10400 3250 50  0001 C CNN
F 1 "GND" H 10405 3327 50  0000 C CNN
F 2 "" H 10400 3500 50  0001 C CNN
F 3 "" H 10400 3500 50  0001 C CNN
	1    10400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 3500 10400 3450
Wire Wire Line
	9100 2850 8950 2850
Connection ~ 9100 2850
Wire Wire Line
	9900 4550 8450 4550
Wire Wire Line
	9900 4550 9900 3950
Wire Wire Line
	8250 2950 8450 2950
Wire Wire Line
	8450 2950 8450 3900
Wire Wire Line
	8250 3900 8450 3900
Connection ~ 8450 3900
Wire Wire Line
	8450 3900 8450 4550
Wire Wire Line
	7650 2850 7450 2850
Wire Wire Line
	7450 2850 7450 3400
Wire Wire Line
	7450 3400 8350 3400
Wire Wire Line
	8350 3400 8350 3800
Wire Wire Line
	8350 3800 8250 3800
$Comp
L power:+5V #PWR0118
U 1 1 6033980A
P 9800 4000
F 0 "#PWR0118" H 9800 3850 50  0001 C CNN
F 1 "+5V" H 9815 4173 50  0000 C CNN
F 2 "" H 9800 4000 50  0001 C CNN
F 3 "" H 9800 4000 50  0001 C CNN
	1    9800 4000
	-1   0    0    1   
$EndComp
Text Label 9700 4400 1    50   ~ 0
ZEROPAGE#
Wire Wire Line
	9800 3950 9800 4000
Wire Wire Line
	7200 1050 7200 1750
Wire Wire Line
	8950 2850 8950 1750
Connection ~ 8950 2850
Wire Wire Line
	8950 2850 8450 2850
Wire Wire Line
	8950 1750 7200 1750
Text Label 6450 6650 1    50   ~ 0
RES#
Wire Wire Line
	6450 6650 6450 6350
Wire Wire Line
	9700 3950 9700 4400
Connection ~ 9900 4550
Wire Wire Line
	7450 3400 7450 4900
Wire Wire Line
	7450 4900 7650 4900
Connection ~ 7450 3400
Wire Wire Line
	7650 3800 7550 3800
Wire Wire Line
	7550 3800 7550 4700
Wire Wire Line
	7550 4700 7650 4700
Wire Wire Line
	8250 4800 8300 4800
Wire Wire Line
	9600 4350 9600 3950
Wire Wire Line
	8300 4800 8300 4350
Wire Wire Line
	8300 4350 9600 4350
$Comp
L power:+5V #PWR0119
U 1 1 6041D146
P 8800 3950
F 0 "#PWR0119" H 8800 3800 50  0001 C CNN
F 1 "+5V" H 8815 4123 50  0000 C CNN
F 2 "" H 8800 3950 50  0001 C CNN
F 3 "" H 8800 3950 50  0001 C CNN
	1    8800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3950 8800 4000
Wire Wire Line
	8800 4000 9100 4000
Wire Wire Line
	9100 4000 9100 3950
Wire Wire Line
	9100 4000 9200 4000
Wire Wire Line
	9200 4000 9200 3950
Connection ~ 9100 4000
Wire Wire Line
	9200 4000 9300 4000
Wire Wire Line
	9300 4000 9300 3950
Connection ~ 9200 4000
Wire Wire Line
	9300 4000 9400 4000
Wire Wire Line
	9400 4000 9400 3950
Connection ~ 9300 4000
Wire Wire Line
	7450 2850 7450 2000
Wire Wire Line
	7450 2000 7650 2000
Connection ~ 7450 2850
Wire Wire Line
	8450 2850 8450 2350
Wire Wire Line
	8450 2350 7600 2350
Wire Wire Line
	7600 2350 7600 2200
Wire Wire Line
	7600 2200 7650 2200
Connection ~ 8450 2850
Wire Wire Line
	8450 2850 8250 2850
Text Label 8650 2100 2    50   ~ 0
IO#
Wire Wire Line
	8250 2100 8650 2100
NoConn ~ 7650 3050
NoConn ~ 7650 4000
$Comp
L power:+5V #PWR0120
U 1 1 604E1F61
P 7950 2600
F 0 "#PWR0120" H 7950 2450 50  0001 C CNN
F 1 "+5V" V 7965 2728 50  0000 L CNN
F 2 "" H 7950 2600 50  0001 C CNN
F 3 "" H 7950 2600 50  0001 C CNN
	1    7950 2600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0121
U 1 1 604E1FCD
P 7950 3300
F 0 "#PWR0121" H 7950 3150 50  0001 C CNN
F 1 "+5V" V 7965 3428 50  0000 L CNN
F 2 "" H 7950 3300 50  0001 C CNN
F 3 "" H 7950 3300 50  0001 C CNN
	1    7950 3300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 604E20F2
P 7950 3550
F 0 "#PWR0122" H 7950 3400 50  0001 C CNN
F 1 "+5V" V 7965 3678 50  0000 L CNN
F 2 "" H 7950 3550 50  0001 C CNN
F 3 "" H 7950 3550 50  0001 C CNN
	1    7950 3550
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 604E21F2
P 7950 4250
F 0 "#PWR0123" H 7950 4100 50  0001 C CNN
F 1 "+5V" V 7965 4378 50  0000 L CNN
F 2 "" H 7950 4250 50  0001 C CNN
F 3 "" H 7950 4250 50  0001 C CNN
	1    7950 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 2650 7950 2600
Wire Wire Line
	7950 3250 7950 3300
Wire Wire Line
	7950 3600 7950 3550
Wire Wire Line
	7950 4250 7950 4200
Text Label 6750 4600 1    50   ~ 0
IO#
Wire Wire Line
	6750 4600 6750 4350
Text Label 6650 4600 1    50   ~ 0
WR#
Wire Wire Line
	6650 4600 6650 4350
$Comp
L power:GND #PWR0124
U 1 1 60554A10
P 7050 3900
F 0 "#PWR0124" H 7050 3650 50  0001 C CNN
F 1 "GND" H 7055 3727 50  0000 C CNN
F 2 "" H 7050 3900 50  0001 C CNN
F 3 "" H 7050 3900 50  0001 C CNN
	1    7050 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 60554A7C
P 5200 3900
F 0 "#PWR0125" H 5200 3650 50  0001 C CNN
F 1 "GND" H 5205 3727 50  0000 C CNN
F 2 "" H 5200 3900 50  0001 C CNN
F 3 "" H 5200 3900 50  0001 C CNN
	1    5200 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0126
U 1 1 60554AEF
P 5450 3800
F 0 "#PWR0126" H 5450 3650 50  0001 C CNN
F 1 "+5V" H 5465 3973 50  0000 C CNN
F 2 "" H 5450 3800 50  0001 C CNN
F 3 "" H 5450 3800 50  0001 C CNN
	1    5450 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 60554B5B
P 3600 3800
F 0 "#PWR0127" H 3600 3650 50  0001 C CNN
F 1 "+5V" H 3615 3973 50  0000 C CNN
F 2 "" H 3600 3800 50  0001 C CNN
F 3 "" H 3600 3800 50  0001 C CNN
	1    3600 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3800 3600 3850
Wire Wire Line
	5200 3850 5200 3900
Wire Wire Line
	7050 3850 7050 3900
Wire Wire Line
	5450 3850 5450 3800
Text Label 5900 7250 1    50   ~ 0
IO#
Text Label 6100 7250 1    50   ~ 0
WR#
Text Label 5550 7250 1    50   ~ 0
RD#
Text Label 5350 7250 1    50   ~ 0
IO#
Wire Wire Line
	5350 7250 5350 7050
Wire Wire Line
	5550 7250 5550 7050
Wire Wire Line
	5900 7250 5900 7050
Wire Wire Line
	6100 7250 6100 7050
Wire Wire Line
	5450 6450 5450 6350
Wire Wire Line
	6000 6450 6000 6350
Text Label 4100 1600 3    50   ~ 0
IO#
Wire Wire Line
	4100 1800 4100 1600
$Comp
L power:GND #PWR0128
U 1 1 60617AB4
P 4900 1700
F 0 "#PWR0128" H 4900 1450 50  0001 C CNN
F 1 "GND" H 4905 1527 50  0000 C CNN
F 2 "" H 4900 1700 50  0001 C CNN
F 3 "" H 4900 1700 50  0001 C CNN
	1    4900 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 1800 4900 1700
Wire Wire Line
	10200 5050 10300 5050
Wire Wire Line
	10900 5050 10950 5050
$Comp
L 74xx:74HC04 U8
U 7 1 5FAD8334
P 1700 6900
F 0 "U8" H 1930 6946 50  0000 L CNN
F 1 "74HC04" H 1930 6855 50  0000 L CNN
F 2 "" H 1700 6900 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 1700 6900 50  0001 C CNN
	7    1700 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 4550 10950 5050
Wire Wire Line
	9900 4550 10950 4550
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60700E5A
P 1250 5750
F 0 "#FLG0101" H 1250 5825 50  0001 C CNN
F 1 "PWR_FLAG" V 1250 5878 50  0000 L CNN
F 2 "" H 1250 5750 50  0001 C CNN
F 3 "~" H 1250 5750 50  0001 C CNN
	1    1250 5750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 60701225
P 900 7450
F 0 "#PWR0129" H 900 7200 50  0001 C CNN
F 1 "GND" H 905 7277 50  0000 C CNN
F 2 "" H 900 7450 50  0001 C CNN
F 3 "" H 900 7450 50  0001 C CNN
	1    900  7450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 607012C3
P 1700 7450
F 0 "#PWR0130" H 1700 7200 50  0001 C CNN
F 1 "GND" H 1705 7277 50  0000 C CNN
F 2 "" H 1700 7450 50  0001 C CNN
F 3 "" H 1700 7450 50  0001 C CNN
	1    1700 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0131
U 1 1 60701368
P 900 6350
F 0 "#PWR0131" H 900 6200 50  0001 C CNN
F 1 "+5V" H 915 6523 50  0000 C CNN
F 2 "" H 900 6350 50  0001 C CNN
F 3 "" H 900 6350 50  0001 C CNN
	1    900  6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0132
U 1 1 607013C8
P 1700 6350
F 0 "#PWR0132" H 1700 6200 50  0001 C CNN
F 1 "+5V" H 1715 6523 50  0000 C CNN
F 2 "" H 1700 6350 50  0001 C CNN
F 3 "" H 1700 6350 50  0001 C CNN
	1    1700 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0133
U 1 1 607142B9
P 2500 6350
F 0 "#PWR0133" H 2500 6200 50  0001 C CNN
F 1 "+5V" H 2515 6523 50  0000 C CNN
F 2 "" H 2500 6350 50  0001 C CNN
F 3 "" H 2500 6350 50  0001 C CNN
	1    2500 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 60714320
P 2500 7450
F 0 "#PWR0134" H 2500 7200 50  0001 C CNN
F 1 "GND" H 2505 7277 50  0000 C CNN
F 2 "" H 2500 7450 50  0001 C CNN
F 3 "" H 2500 7450 50  0001 C CNN
	1    2500 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6400 1700 6350
Wire Wire Line
	1700 7450 1700 7400
$Comp
L power:GND #PWR0135
U 1 1 6078A3EB
P 1250 5950
F 0 "#PWR0135" H 1250 5700 50  0001 C CNN
F 1 "GND" H 1255 5777 50  0000 C CNN
F 2 "" H 1250 5950 50  0001 C CNN
F 3 "" H 1250 5950 50  0001 C CNN
	1    1250 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0136
U 1 1 6079E9A0
P 1250 5300
F 0 "#PWR0136" H 1250 5150 50  0001 C CNN
F 1 "+5V" H 1265 5473 50  0000 C CNN
F 2 "" H 1250 5300 50  0001 C CNN
F 3 "" H 1250 5300 50  0001 C CNN
	1    1250 5300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6079EA07
P 1250 5500
F 0 "#FLG0102" H 1250 5575 50  0001 C CNN
F 1 "PWR_FLAG" V 1250 5628 50  0000 L CNN
F 2 "" H 1250 5500 50  0001 C CNN
F 3 "~" H 1250 5500 50  0001 C CNN
	1    1250 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1250 5500 1250 5300
Wire Wire Line
	1250 5950 1250 5750
NoConn ~ 2500 5500
$Comp
L power:GND #PWR0137
U 1 1 60819812
P 1900 5550
F 0 "#PWR0137" H 1900 5300 50  0001 C CNN
F 1 "GND" H 1905 5377 50  0000 C CNN
F 2 "" H 1900 5550 50  0001 C CNN
F 3 "" H 1900 5550 50  0001 C CNN
	1    1900 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5550 1900 5500
Wire Wire Line
	900  6350 900  6500
Wire Wire Line
	900  7300 900  7450
Wire Wire Line
	2500 6350 2500 6400
Wire Wire Line
	2500 7450 2500 7400
$EndSCHEMATC
