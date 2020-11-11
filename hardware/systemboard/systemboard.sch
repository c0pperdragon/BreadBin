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
F 0 "J1" V 7500 800 50  0000 L CNN
F 1 "Conn_01x06" V 7400 600 50  0000 L CNN
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
L 74xx:74HC245 UDBUS1
U 1 1 5FA115D2
P 6250 3850
F 0 "UDBUS1" V 6750 3350 50  0000 C CNN
F 1 "74HC245" V 6650 3350 50  0000 C CNN
F 2 "" H 6250 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 6250 3850 50  0001 C CNN
	1    6250 3850
	0    -1   1    0   
$EndComp
$Comp
L 74xx:74HC245 UABUS1
U 1 1 5FA9F853
P 4400 3850
F 0 "UABUS1" V 4900 3450 50  0000 C CNN
F 1 "74HC245" V 4800 3350 50  0000 C CNN
F 2 "" H 4400 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 4400 3850 50  0001 C CNN
	1    4400 3850
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74HC04 UINV1
U 1 1 5FAD80A3
P 8850 5050
F 0 "UINV1" H 8850 5367 50  0000 C CNN
F 1 "74HC04" H 8850 5276 50  0000 C CNN
F 2 "" H 8850 5050 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 8850 5050 50  0001 C CNN
	1    8850 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 UINV1
U 2 1 5FAD8137
P 9600 5050
F 0 "UINV1" H 9650 4750 50  0000 R CNN
F 1 "74HC04" H 9750 4850 50  0000 R CNN
F 2 "" H 9600 5050 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 9600 5050 50  0001 C CNN
	2    9600 5050
	1    0    0    1   
$EndComp
$Comp
L 74xx:74HC04 UINV1
U 3 1 5FAD8190
P 10300 5050
F 0 "UINV1" H 10300 5367 50  0000 C CNN
F 1 "74HC04" H 10300 5276 50  0000 C CNN
F 2 "" H 10300 5050 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 10300 5050 50  0001 C CNN
	3    10300 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 UINV1
U 4 1 5FAD81F1
P 7150 3200
F 0 "UINV1" H 7300 3350 50  0000 C CNN
F 1 "74HC04" H 7300 3450 50  0000 C CNN
F 2 "" H 7150 3200 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 7150 3200 50  0001 C CNN
	4    7150 3200
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC04 UINV1
U 5 1 5FAD8258
P 10250 3600
F 0 "UINV1" H 10250 3917 50  0000 C CNN
F 1 "74HC04" H 10250 3826 50  0000 C CNN
F 2 "" H 10250 3600 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 10250 3600 50  0001 C CNN
	5    10250 3600
	0    1    1    0   
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
P 8500 6050
F 0 "C1" H 8592 6096 50  0000 L CNN
F 1 "33pF" H 8592 6005 50  0000 L CNN
F 2 "" H 8500 6050 50  0001 C CNN
F 3 "~" H 8500 6050 50  0001 C CNN
	1    8500 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5FB5E325
P 9200 6050
F 0 "C2" H 9292 6096 50  0000 L CNN
F 1 "33pF" H 9292 6005 50  0000 L CNN
F 2 "" H 9200 6050 50  0001 C CNN
F 3 "~" H 9200 6050 50  0001 C CNN
	1    9200 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5FB5E3B7
P 8500 6200
F 0 "#PWR0105" H 8500 5950 50  0001 C CNN
F 1 "GND" H 8505 6027 50  0000 C CNN
F 2 "" H 8500 6200 50  0001 C CNN
F 3 "" H 8500 6200 50  0001 C CNN
	1    8500 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FB5E40B
P 9200 6200
F 0 "#PWR0106" H 9200 5950 50  0001 C CNN
F 1 "GND" H 9205 6027 50  0000 C CNN
F 2 "" H 9200 6200 50  0001 C CNN
F 3 "" H 9200 6200 50  0001 C CNN
	1    9200 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5FB713E9
P 8850 5850
F 0 "Y1" H 8850 6118 50  0000 C CNN
F 1 "Crystal" H 8850 6027 50  0000 C CNN
F 2 "" H 8850 5850 50  0001 C CNN
F 3 "~" H 8850 5850 50  0001 C CNN
	1    8850 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5FB714AA
P 8850 5450
F 0 "R1" V 8654 5450 50  0000 C CNN
F 1 "220k" V 8745 5450 50  0000 C CNN
F 2 "" H 8850 5450 50  0001 C CNN
F 3 "~" H 8850 5450 50  0001 C CNN
	1    8850 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5FB71512
P 9200 5650
F 0 "R2" H 9259 5696 50  0000 L CNN
F 1 "22" H 9259 5605 50  0000 L CNN
F 2 "" H 9200 5650 50  0001 C CNN
F 3 "~" H 9200 5650 50  0001 C CNN
	1    9200 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5450 8500 5450
Wire Wire Line
	8500 5450 8500 5850
Wire Wire Line
	8500 6150 8500 6200
Wire Wire Line
	8700 5850 8500 5850
Connection ~ 8500 5850
Wire Wire Line
	8500 5850 8500 5950
Wire Wire Line
	9200 5750 9200 5850
Wire Wire Line
	9200 6150 9200 6200
Wire Wire Line
	9200 5550 9200 5450
Wire Wire Line
	9200 5450 8950 5450
Wire Wire Line
	9200 5450 9200 5050
Wire Wire Line
	9200 5050 9150 5050
Connection ~ 9200 5450
Wire Wire Line
	8500 5450 8500 5050
Wire Wire Line
	8500 5050 8550 5050
Connection ~ 8500 5450
Wire Wire Line
	9000 5850 9200 5850
Connection ~ 9200 5850
Wire Wire Line
	9200 5850 9200 5950
Wire Wire Line
	9200 5050 9300 5050
Connection ~ 9200 5050
$Comp
L 74xx:74LS32 UOR2
U 1 1 601611CB
P 7100 2700
F 0 "UOR2" H 7100 3025 50  0000 C CNN
F 1 "74HC32" H 7100 2934 50  0000 C CNN
F 2 "" H 7100 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7100 2700 50  0001 C CNN
	1    7100 2700
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS32 UOR2
U 2 1 60161252
P 3300 6850
F 0 "UOR2" H 3300 7175 50  0000 C CNN
F 1 "74HC32" H 3300 7084 50  0000 C CNN
F 2 "" H 3300 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3300 6850 50  0001 C CNN
	2    3300 6850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 UOR2
U 3 1 601612C7
P 3100 5000
F 0 "UOR2" H 3100 5250 50  0000 C CNN
F 1 "74HC32" H 3100 5350 50  0000 C CNN
F 2 "" H 3100 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3100 5000 50  0001 C CNN
	3    3100 5000
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS32 UOR2
U 4 1 60161340
P 2450 5000
F 0 "UOR2" H 2550 5350 50  0000 R CNN
F 1 "74HC32" H 2600 5250 50  0000 R CNN
F 2 "" H 2450 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2450 5000 50  0001 C CNN
	4    2450 5000
	0    -1   1    0   
$EndComp
$Comp
L 74xx:74LS32 UOR2
U 5 1 601613CB
P 900 6900
F 0 "UOR2" H 1130 6946 50  0000 L CNN
F 1 "74HC32" H 1130 6855 50  0000 L CNN
F 2 "" H 900 6900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 900 6900 50  0001 C CNN
	5    900  6900
	1    0    0    -1  
$EndComp
$Comp
L Timer:NE555 URESET1
U 1 1 602470C7
P 9850 1550
F 0 "URESET1" H 9850 2128 50  0000 C CNN
F 1 "NE555" H 9850 2037 50  0000 C CNN
F 2 "" H 9850 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ne555.pdf" H 9850 1550 50  0001 C CNN
	1    9850 1550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7300 1050 7300 1450
NoConn ~ 9350 1550
NoConn ~ 10350 1550
NoConn ~ 10350 1750
$Comp
L power:GND #PWR0107
U 1 1 602A1B4C
P 9800 2000
F 0 "#PWR0107" H 9800 1750 50  0001 C CNN
F 1 "GND" H 9805 1827 50  0000 C CNN
F 2 "" H 9800 2000 50  0001 C CNN
F 3 "" H 9800 2000 50  0001 C CNN
	1    9800 2000
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 602A1BBF
P 9900 1150
F 0 "#PWR0108" H 9900 1000 50  0001 C CNN
F 1 "+5V" V 9915 1278 50  0000 L CNN
F 2 "" H 9900 1150 50  0001 C CNN
F 3 "" H 9900 1150 50  0001 C CNN
	1    9900 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 1150 9900 1150
Wire Wire Line
	9850 2000 9850 1950
Wire Wire Line
	9350 1750 9300 1750
Wire Wire Line
	9300 1750 9300 2150
Wire Wire Line
	9300 2150 10550 2150
Wire Wire Line
	10550 2150 10550 1350
Wire Wire Line
	10550 1350 10350 1350
$Comp
L Device:C_Small C3
U 1 1 602D8ABF
P 10550 1100
F 0 "C3" H 10642 1146 50  0000 L CNN
F 1 "100nF" H 10642 1055 50  0000 L CNN
F 2 "" H 10550 1100 50  0001 C CNN
F 3 "~" H 10550 1100 50  0001 C CNN
	1    10550 1100
	1    0    0    -1  
$EndComp
Connection ~ 10550 2150
$Comp
L power:GND #PWR0109
U 1 1 602D8B6A
P 10550 2400
F 0 "#PWR0109" H 10550 2150 50  0001 C CNN
F 1 "GND" H 10555 2227 50  0000 C CNN
F 2 "" H 10550 2400 50  0001 C CNN
F 3 "" H 10550 2400 50  0001 C CNN
	1    10550 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 602EBB8E
P 10550 2250
F 0 "R3" H 10609 2296 50  0000 L CNN
F 1 "1M" H 10609 2205 50  0000 L CNN
F 2 "" H 10550 2250 50  0001 C CNN
F 3 "~" H 10550 2250 50  0001 C CNN
	1    10550 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 602EBC0B
P 10550 900
F 0 "#PWR0110" H 10550 750 50  0001 C CNN
F 1 "+5V" H 10565 1073 50  0000 C CNN
F 2 "" H 10550 900 50  0001 C CNN
F 3 "" H 10550 900 50  0001 C CNN
	1    10550 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1200 10550 1350
Connection ~ 10550 1350
Wire Wire Line
	10550 1000 10550 900 
Text Label 3100 5600 1    50   ~ 0
IORD#
$Comp
L Library:IS61C1024AL UFASTRAM1
U 1 1 5F9B5E59
P 3800 2200
F 0 "UFASTRAM1" V 3900 2600 50  0000 R CNN
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
	2950 1050 2950 2650
Wire Wire Line
	2850 1050 2850 2700
Wire Wire Line
	2750 1050 2750 2750
Wire Wire Line
	2650 1050 2650 2800
Wire Wire Line
	2550 1050 2550 2850
Wire Wire Line
	2450 1050 2450 2900
Wire Wire Line
	2350 1050 2350 2950
Wire Wire Line
	2250 1050 2250 3000
Wire Wire Line
	2150 1050 2150 3050
Wire Wire Line
	2050 1050 2050 3100
$Comp
L power:GND #PWR0111
U 1 1 5FB1A5DE
P 3750 2500
F 0 "#PWR0111" H 3750 2250 50  0001 C CNN
F 1 "GND" H 3755 2327 50  0000 C CNN
F 2 "" H 3750 2500 50  0001 C CNN
F 3 "" H 3750 2500 50  0001 C CNN
	1    3750 2500
	0    1    1    0   
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
Text Label 4700 1550 3    50   ~ 0
RD#
Text Label 4200 1550 3    50   ~ 0
WR#
Wire Wire Line
	4700 1800 4700 1550
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
	4200 1550 4200 1800
$Comp
L power:+5V #PWR0116
U 1 1 601EC503
P 8400 3550
F 0 "#PWR0116" H 8400 3400 50  0001 C CNN
F 1 "+5V" H 8415 3723 50  0000 C CNN
F 2 "" H 8400 3550 50  0001 C CNN
F 3 "" H 8400 3550 50  0001 C CNN
	1    8400 3550
	1    0    0    -1  
$EndComp
NoConn ~ 9200 3100
Wire Wire Line
	8700 2300 10250 2300
Wire Wire Line
	8700 2300 8700 3100
Wire Wire Line
	10250 3900 10250 4150
Wire Wire Line
	10250 4150 9700 4150
Wire Wire Line
	9700 4150 9700 4100
Wire Wire Line
	9800 2000 9850 2000
$Comp
L power:GND #PWR0117
U 1 1 6029060E
P 10000 3650
F 0 "#PWR0117" H 10000 3400 50  0001 C CNN
F 1 "GND" H 10005 3477 50  0000 C CNN
F 2 "" H 10000 3650 50  0001 C CNN
F 3 "" H 10000 3650 50  0001 C CNN
	1    10000 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 3650 10000 3600
Connection ~ 8700 2300
$Comp
L power:+5V #PWR0118
U 1 1 6033980A
P 9400 4150
F 0 "#PWR0118" H 9400 4000 50  0001 C CNN
F 1 "+5V" H 9415 4323 50  0000 C CNN
F 2 "" H 9400 4150 50  0001 C CNN
F 3 "" H 9400 4150 50  0001 C CNN
	1    9400 4150
	-1   0    0    1   
$EndComp
Text Label 9200 4450 1    50   ~ 0
IORD#
Wire Wire Line
	9400 4100 9400 4150
Text Label 6450 6750 1    50   ~ 0
RES#
Wire Wire Line
	6450 6750 6450 6350
Wire Wire Line
	9200 4100 9200 4450
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
Text Label 6000 6750 1    50   ~ 0
IOWR#
Text Label 4100 1550 3    50   ~ 0
IORD#
Wire Wire Line
	4100 1800 4100 1550
Wire Wire Line
	9900 5050 10000 5050
Wire Wire Line
	10600 5050 10650 5050
$Comp
L 74xx:74HC04 UINV1
U 7 1 5FAD8334
P 1700 6900
F 0 "UINV1" H 1930 6946 50  0000 L CNN
F 1 "74HC04" H 1930 6855 50  0000 L CNN
F 2 "" H 1700 6900 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/74HC_HCT04.pdf" H 1700 6900 50  0001 C CNN
	7    1700 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 4400 10650 5050
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60700E5A
P 2600 7200
F 0 "#FLG0101" H 2600 7275 50  0001 C CNN
F 1 "PWR_FLAG" V 2600 7328 50  0000 L CNN
F 2 "" H 2600 7200 50  0001 C CNN
F 3 "~" H 2600 7200 50  0001 C CNN
	1    2600 7200
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
P 900 6350
F 0 "#PWR0133" H 900 6200 50  0001 C CNN
F 1 "+5V" H 915 6523 50  0000 C CNN
F 2 "" H 900 6350 50  0001 C CNN
F 3 "" H 900 6350 50  0001 C CNN
	1    900  6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 60714320
P 900 7450
F 0 "#PWR0134" H 900 7200 50  0001 C CNN
F 1 "GND" H 905 7277 50  0000 C CNN
F 2 "" H 900 7450 50  0001 C CNN
F 3 "" H 900 7450 50  0001 C CNN
	1    900  7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 7450 1700 7400
$Comp
L power:GND #PWR0135
U 1 1 6078A3EB
P 2600 7250
F 0 "#PWR0135" H 2600 7000 50  0001 C CNN
F 1 "GND" H 2605 7077 50  0000 C CNN
F 2 "" H 2600 7250 50  0001 C CNN
F 3 "" H 2600 7250 50  0001 C CNN
	1    2600 7250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0136
U 1 1 6079E9A0
P 2400 6900
F 0 "#PWR0136" H 2400 6750 50  0001 C CNN
F 1 "+5V" H 2415 7073 50  0000 C CNN
F 2 "" H 2400 6900 50  0001 C CNN
F 3 "" H 2400 6900 50  0001 C CNN
	1    2400 6900
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6079EA07
P 2400 6950
F 0 "#FLG0102" H 2400 7025 50  0001 C CNN
F 1 "PWR_FLAG" V 2400 7078 50  0000 L CNN
F 2 "" H 2400 6950 50  0001 C CNN
F 3 "~" H 2400 6950 50  0001 C CNN
	1    2400 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 6950 2400 6900
Wire Wire Line
	2600 7250 2600 7200
Wire Wire Line
	900  7450 900  7400
Wire Wire Line
	900  6400 900  6350
Wire Wire Line
	1700 6400 1700 6350
Wire Wire Line
	9400 4150 9300 4150
Connection ~ 9400 4150
Wire Wire Line
	9300 4150 9300 4100
$Comp
L 74xx:74LS163 UCLK1
U 1 1 600F6923
P 9200 3600
F 0 "UCLK1" V 9700 3350 50  0000 R CNN
F 1 "74HC163" V 9600 3400 50  0000 R CNN
F 2 "" H 9200 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 9200 3600 50  0001 C CNN
	1    9200 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9500 4400 10650 4400
Wire Wire Line
	8400 3600 8400 3550
Wire Wire Line
	8800 3100 8800 2950
Wire Wire Line
	8200 4250 8800 4250
Wire Wire Line
	8800 4250 8800 4100
Wire Wire Line
	8900 2850 8200 2850
Wire Wire Line
	8200 2850 8200 4250
Wire Wire Line
	8300 2950 8300 4150
Wire Wire Line
	8300 4150 8700 4150
Wire Wire Line
	8700 4150 8700 4100
Wire Wire Line
	8900 2850 8900 3100
Wire Wire Line
	8300 2950 8800 2950
NoConn ~ 9000 3100
Wire Wire Line
	10550 2400 10550 2350
Wire Wire Line
	10250 2300 10250 3300
Wire Wire Line
	9500 4400 9500 4100
Wire Wire Line
	7300 1450 7800 1450
Wire Wire Line
	7800 1450 7800 1350
$Comp
L 74xx:74LS688 UZERO1
U 1 1 5FA2813B
P 1850 3850
F 0 "UZERO1" V 2250 3100 50  0000 L CNN
F 1 "74HC688" V 2350 3100 50  0000 L CNN
F 2 "" H 1850 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS688" H 1850 3850 50  0001 C CNN
	1    1850 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 3350 2350 2950
Connection ~ 2350 2950
Wire Wire Line
	2450 3350 2450 2900
Connection ~ 2450 2900
Wire Wire Line
	2550 3350 2550 2850
Connection ~ 2550 2850
Wire Wire Line
	2650 3350 2650 2800
Connection ~ 2650 2800
$Comp
L power:GND #PWR0103
U 1 1 5FA8A5D4
P 650 3900
F 0 "#PWR0103" H 650 3650 50  0001 C CNN
F 1 "GND" H 655 3727 50  0000 C CNN
F 2 "" H 650 3900 50  0001 C CNN
F 3 "" H 650 3900 50  0001 C CNN
	1    650  3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  3900 650  3850
Wire Wire Line
	1150 3300 1150 3350
Wire Wire Line
	1150 3300 1250 3300
Wire Wire Line
	1250 3300 1250 3350
Connection ~ 1150 3300
Wire Wire Line
	1250 3300 1350 3300
Wire Wire Line
	1350 3300 1350 3350
Connection ~ 1250 3300
Wire Wire Line
	1350 3300 1450 3300
Wire Wire Line
	1450 3300 1450 3350
Connection ~ 1350 3300
Wire Wire Line
	1450 3300 1550 3300
Wire Wire Line
	1550 3300 1550 3350
Connection ~ 1450 3300
Wire Wire Line
	1550 3300 1650 3300
Wire Wire Line
	1650 3300 1650 3350
Connection ~ 1550 3300
Wire Wire Line
	1650 3300 1750 3300
Wire Wire Line
	1750 3300 1750 3350
Connection ~ 1650 3300
Wire Wire Line
	1750 3300 1850 3300
Wire Wire Line
	1850 3300 1850 3350
Connection ~ 1750 3300
Text Label 3200 4500 3    50   ~ 0
RD#
Text Label 6100 6750 1    50   ~ 0
IORD#
Wire Wire Line
	6100 6350 6100 6750
Wire Wire Line
	7200 1050 7200 2300
Wire Wire Line
	7200 2300 8700 2300
Text Label 7700 2700 2    50   ~ 0
IORD#
Wire Wire Line
	6450 4350 6450 4750
Text Label 2350 4500 3    50   ~ 0
WR#
Wire Wire Line
	3100 5600 3100 5300
Text Label 2450 5600 1    50   ~ 0
IOWR#
Wire Wire Line
	2450 5600 2450 5300
Wire Wire Line
	6000 6350 6000 6750
$Comp
L power:+5V #PWR0114
U 1 1 5FF45AC3
P 8900 4150
F 0 "#PWR0114" H 8900 4000 50  0001 C CNN
F 1 "+5V" H 8915 4323 50  0000 C CNN
F 2 "" H 8900 4150 50  0001 C CNN
F 3 "" H 8900 4150 50  0001 C CNN
	1    8900 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	8900 4150 8900 4100
Wire Wire Line
	8900 4150 9000 4150
Connection ~ 8900 4150
Wire Wire Line
	9000 4150 9000 4100
Wire Wire Line
	650  3850 650  3300
Connection ~ 650  3850
$Comp
L power:+5V #PWR0119
U 1 1 60391471
P 3050 3800
F 0 "#PWR0119" H 3050 3650 50  0001 C CNN
F 1 "+5V" H 3065 3973 50  0000 C CNN
F 2 "" H 3050 3800 50  0001 C CNN
F 3 "" H 3050 3800 50  0001 C CNN
	1    3050 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3850 3050 3800
$Comp
L power:GND #PWR0120
U 1 1 603BBE30
P 4900 1700
F 0 "#PWR0120" H 4900 1450 50  0001 C CNN
F 1 "GND" H 4905 1527 50  0000 C CNN
F 2 "" H 4900 1700 50  0001 C CNN
F 3 "" H 4900 1700 50  0001 C CNN
	1    4900 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 1700 4900 1800
Wire Wire Line
	2350 4700 2350 4500
Wire Wire Line
	3200 4700 3200 4500
Wire Wire Line
	650  3300 950  3300
Wire Wire Line
	2550 4500 2750 4500
Wire Wire Line
	2550 4500 2550 4700
Wire Wire Line
	3000 4500 3000 4700
Wire Wire Line
	2750 4350 2750 4500
Connection ~ 2750 4500
Wire Wire Line
	2750 4500 3000 4500
$Comp
L power:GND #PWR0121
U 1 1 5FAEA082
P 2950 7100
F 0 "#PWR0121" H 2950 6850 50  0001 C CNN
F 1 "GND" H 2955 6927 50  0000 C CNN
F 2 "" H 2950 7100 50  0001 C CNN
F 3 "" H 2950 7100 50  0001 C CNN
	1    2950 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 6750 3000 6750
Wire Wire Line
	3000 6950 2950 6950
Connection ~ 2950 6950
Wire Wire Line
	2950 6950 2950 6750
NoConn ~ 3600 6850
Wire Wire Line
	7800 1350 9350 1350
Text Label 7700 3200 2    50   ~ 0
RES#
Wire Wire Line
	6650 2700 6800 2700
Wire Wire Line
	6650 2700 6650 3350
Wire Wire Line
	6850 3200 6750 3200
Wire Wire Line
	6750 3200 6750 3350
Wire Wire Line
	7400 2800 7400 2700
Wire Wire Line
	7400 2700 7400 2600
Connection ~ 7400 2700
Wire Wire Line
	7400 2700 7700 2700
Wire Wire Line
	7450 3200 7700 3200
Wire Wire Line
	2950 6950 2950 7100
Wire Wire Line
	5000 2600 5000 3100
Wire Wire Line
	2050 3100 5000 3100
Wire Wire Line
	4900 3050 4900 2600
Wire Wire Line
	2150 3050 4900 3050
Wire Wire Line
	4800 3000 4800 2600
Wire Wire Line
	2250 3000 4800 3000
Wire Wire Line
	4700 2950 4700 2600
Wire Wire Line
	2350 2950 4700 2950
Wire Wire Line
	4600 2900 4600 2600
Wire Wire Line
	2450 2900 4600 2900
Wire Wire Line
	4500 2850 4500 2600
Wire Wire Line
	2550 2850 4500 2850
Wire Wire Line
	4400 2800 4400 2600
Wire Wire Line
	2650 2800 4400 2800
Wire Wire Line
	4300 2750 4300 2600
Wire Wire Line
	2750 2750 4300 2750
Wire Wire Line
	4200 2700 4200 2600
Wire Wire Line
	2850 2700 4200 2700
Wire Wire Line
	4100 2650 4100 2600
Wire Wire Line
	2950 2650 4100 2650
Wire Wire Line
	3750 2600 3750 2500
Wire Wire Line
	3750 2600 4000 2600
Wire Wire Line
	950  3350 950  3300
Connection ~ 950  3300
Wire Wire Line
	950  3300 1150 3300
$Comp
L power:GND #PWR0104
U 1 1 5FCBE6A8
P 2800 3350
F 0 "#PWR0104" H 2800 3100 50  0001 C CNN
F 1 "GND" V 2805 3222 50  0000 R CNN
F 2 "" H 2800 3350 50  0001 C CNN
F 3 "" H 2800 3350 50  0001 C CNN
	1    2800 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 3350 2800 3350
Text Label 3900 3200 3    50   ~ 0
A7
Wire Wire Line
	3900 3350 3900 3200
$Sheet
S 3700 4750 2850 1600
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
F9 "D0" I T 6450 4750 50 
F10 "D1" I T 6350 4750 50 
F11 "D2" I T 6250 4750 50 
F12 "D4" I T 6050 4750 50 
F13 "D5" I T 5950 4750 50 
F14 "D6" I T 5850 4750 50 
F15 "D7" I T 5750 4750 50 
F16 "D3" I T 6150 4750 50 
F17 "IOWR#" I B 6000 6350 50 
F18 "IORD#" I B 6100 6350 50 
F19 "RES#" I B 6450 6350 50 
F20 "A7" I T 3900 4750 50 
F21 "A8" I T 3800 4750 50 
$EndSheet
Wire Wire Line
	3900 4750 3900 4350
Text Label 3800 4500 3    50   ~ 0
A8
Wire Wire Line
	3800 4750 3800 4500
$EndSCHEMATC
