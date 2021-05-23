EESchema Schematic File Version 4
LIBS:board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "CPU"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR?
U 1 1 60ADF1CF
P 1100 4550
AR Path="/5F7D6FC1/60ADF1CF" Ref="#PWR?"  Part="1" 
AR Path="/60ADF1CF" Ref="#PWR?"  Part="1" 
AR Path="/60ADE4F9/60ADF1CF" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 1100 4400 50  0001 C CNN
F 1 "+5V" V 1100 4750 50  0000 C CNN
F 2 "" H 1100 4550 50  0001 C CNN
F 3 "" H 1100 4550 50  0001 C CNN
	1    1100 4550
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS377 UR?
U 1 1 60ADF1D5
P 1900 4600
AR Path="/5F7D6FC1/60ADF1D5" Ref="UR?"  Part="1" 
AR Path="/60ADF1D5" Ref="UR?"  Part="1" 
AR Path="/60ADE4F9/60ADF1D5" Ref="UB1"  Part="1" 
F 0 "UB1" V 2400 4250 50  0000 R CNN
F 1 "74HC377" V 2300 4300 50  0000 R CNN
F 2 "" H 1900 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS377" H 1900 4600 50  0001 C CNN
	1    1900 4600
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 60ADF1DC
P 2700 4650
F 0 "#PWR0113" H 2700 4400 50  0001 C CNN
F 1 "GND" V 2705 4522 50  0000 R CNN
F 2 "" H 2700 4650 50  0001 C CNN
F 3 "" H 2700 4650 50  0001 C CNN
	1    2700 4650
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60ADF1E2
P 1100 2500
AR Path="/5F7D6FC1/60ADF1E2" Ref="#PWR?"  Part="1" 
AR Path="/60ADF1E2" Ref="#PWR?"  Part="1" 
AR Path="/60ADE4F9/60ADF1E2" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 1100 2350 50  0001 C CNN
F 1 "+5V" V 1100 2700 50  0000 C CNN
F 2 "" H 1100 2500 50  0001 C CNN
F 3 "" H 1100 2500 50  0001 C CNN
	1    1100 2500
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS377 UR?
U 1 1 60ADF1E9
P 1900 2550
AR Path="/5F7D6FC1/60ADF1E9" Ref="UR?"  Part="1" 
AR Path="/60ADF1E9" Ref="UR?"  Part="1" 
AR Path="/60ADE4F9/60ADF1E9" Ref="UA1"  Part="1" 
F 0 "UA1" V 2400 2200 50  0000 R CNN
F 1 "74HC377" V 2300 2250 50  0000 R CNN
F 2 "" H 1900 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS377" H 1900 2550 50  0001 C CNN
	1    1900 2550
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 60ADF1F0
P 2700 2600
F 0 "#PWR0115" H 2700 2350 50  0001 C CNN
F 1 "GND" V 2705 2472 50  0000 R CNN
F 2 "" H 2700 2600 50  0001 C CNN
F 3 "" H 2700 2600 50  0001 C CNN
	1    2700 2600
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60ADF1F6
P 4500 7450
AR Path="/5F7D6FC1/60ADF1F6" Ref="#PWR?"  Part="1" 
AR Path="/60ADF1F6" Ref="#PWR?"  Part="1" 
AR Path="/60ADE4F9/60ADF1F6" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 4500 7300 50  0001 C CNN
F 1 "+5V" V 4500 7650 50  0000 C CNN
F 2 "" H 4500 7450 50  0001 C CNN
F 3 "" H 4500 7450 50  0001 C CNN
	1    4500 7450
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS377 UR?
U 1 1 60ADF1FC
P 4500 6650
AR Path="/5F7D6FC1/60ADF1FC" Ref="UR?"  Part="1" 
AR Path="/60ADF1FC" Ref="UR?"  Part="1" 
AR Path="/60ADE4F9/60ADF1FC" Ref="UOP1"  Part="1" 
F 0 "UOP1" H 4400 5850 50  0000 R CNN
F 1 "74HC377" H 4400 5950 50  0000 R CNN
F 2 "" H 4500 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS377" H 4500 6650 50  0001 C CNN
	1    4500 6650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 60ADF203
P 4500 5850
F 0 "#PWR0117" H 4500 5600 50  0001 C CNN
F 1 "GND" V 4505 5722 50  0000 R CNN
F 2 "" H 4500 5850 50  0001 C CNN
F 3 "" H 4500 5850 50  0001 C CNN
	1    4500 5850
	-1   0    0    1   
$EndComp
Text Label 5150 6250 2    50   ~ 0
CLK
Text Label 3700 5450 0    50   ~ 0
CLK
$Comp
L power:+5V #PWR0118
U 1 1 60ADF214
P 3950 5150
F 0 "#PWR0118" H 3950 5000 50  0001 C CNN
F 1 "+5V" V 3965 5278 50  0000 L CNN
F 2 "" H 3950 5150 50  0001 C CNN
F 3 "" H 3950 5150 50  0001 C CNN
	1    3950 5150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 5150 3950 5150
NoConn ~ 4000 6750
NoConn ~ 4000 6850
$Comp
L Library:IDT71256 UREG1
U 1 1 60ADF252
P 8100 1400
F 0 "UREG1" V 8050 1400 50  0000 L CNN
F 1 "IDT71256" V 8150 1400 50  0000 L CNN
F 2 "" H 8100 1400 50  0001 C CNN
F 3 "" H 8100 1400 50  0001 C CNN
	1    8100 1400
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 60ADF259
P 6700 1800
F 0 "#PWR0119" H 6700 1550 50  0001 C CNN
F 1 "GND" V 6705 1672 50  0000 R CNN
F 2 "" H 6700 1800 50  0001 C CNN
F 3 "" H 6700 1800 50  0001 C CNN
	1    6700 1800
	0    1    -1   0   
$EndComp
$Comp
L power:+5V #PWR0120
U 1 1 60ADF25F
P 8000 1000
F 0 "#PWR0120" H 8000 850 50  0001 C CNN
F 1 "+5V" V 8015 1128 50  0000 L CNN
F 2 "" H 8000 1000 50  0001 C CNN
F 3 "" H 8000 1000 50  0001 C CNN
	1    8000 1000
	0    1    -1   0   
$EndComp
Text Label 7200 750  3    50   ~ 0
CLK
$Comp
L 74xx:74LS138 UDEC?
U 1 1 60ADF26F
P 7350 2600
AR Path="/6088908D/60ADF26F" Ref="UDEC?"  Part="1" 
AR Path="/60ADF26F" Ref="UDEC?"  Part="1" 
AR Path="/60ADE4F9/60ADF26F" Ref="UDEC1"  Part="1" 
F 0 "UDEC1" H 7250 3200 50  0000 R CNN
F 1 "74HC138" H 7250 3100 50  0000 R CNN
F 2 "" H 7350 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 7350 2600 50  0001 C CNN
	1    7350 2600
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 60ADF27D
P 8200 3850
F 0 "#PWR0121" H 8200 3600 50  0001 C CNN
F 1 "GND" V 8200 3650 50  0000 C CNN
F 2 "" H 8200 3850 50  0001 C CNN
F 3 "" H 8200 3850 50  0001 C CNN
	1    8200 3850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 60ADF283
P 8500 4000
F 0 "#PWR0122" H 8500 3850 50  0001 C CNN
F 1 "+5V" V 8500 4200 50  0000 C CNN
F 2 "" H 8500 4000 50  0001 C CNN
F 3 "" H 8500 4000 50  0001 C CNN
	1    8500 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8250 3850 8350 3850
Connection ~ 8250 3850
$Comp
L 74xx:74LS163 UCTR?
U 1 1 60ADF28B
P 10050 5750
AR Path="/60888F9A/60ADF28B" Ref="UCTR?"  Part="1" 
AR Path="/60ADF28B" Ref="UCTR?"  Part="1" 
AR Path="/60ADE4F9/60ADF28B" Ref="UPC1"  Part="1" 
F 0 "UPC1" V 10500 5500 50  0000 R CNN
F 1 "74HC163" V 10400 5500 50  0000 R CNN
F 2 "" H 10050 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 10050 5750 50  0001 C CNN
	1    10050 5750
	0    1    -1   0   
$EndComp
$Comp
L 74xx:74LS163 UCTR?
U 1 1 60ADF292
P 8150 5750
AR Path="/60888F9A/60ADF292" Ref="UCTR?"  Part="1" 
AR Path="/60ADF292" Ref="UCTR?"  Part="1" 
AR Path="/60ADE4F9/60ADF292" Ref="UPC2"  Part="1" 
F 0 "UPC2" V 8600 5500 50  0000 R CNN
F 1 "74HC163" V 8500 5500 50  0000 R CNN
F 2 "" H 8150 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 8150 5750 50  0001 C CNN
	1    8150 5750
	0    1    -1   0   
$EndComp
$Comp
L 74xx:74LS377 UR?
U 1 1 60ADF299
P 7350 4300
AR Path="/5F7D6FC1/60ADF299" Ref="UR?"  Part="1" 
AR Path="/60ADF299" Ref="UR?"  Part="1" 
AR Path="/60ADE4F9/60ADF299" Ref="UPC3"  Part="1" 
F 0 "UPC3" H 7650 3500 50  0000 R CNN
F 1 "74HC377" H 7800 3600 50  0000 R CNN
F 2 "" H 7350 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS377" H 7350 4300 50  0001 C CNN
	1    7350 4300
	1    0    0    1   
$EndComp
Wire Wire Line
	9450 4500 9450 3850
Wire Wire Line
	9550 4600 9550 3850
Wire Wire Line
	9650 4700 9650 3850
Wire Wire Line
	9750 4800 9750 3850
Wire Wire Line
	9850 4900 9850 3850
Wire Wire Line
	9950 4950 9950 3850
Text Label 6500 3900 0    50   ~ 0
CLK
Text Label 7850 6450 1    50   ~ 0
CLK
Wire Wire Line
	7850 6250 7850 6450
Text Label 9750 6450 1    50   ~ 0
CLK
Wire Wire Line
	9750 6250 9750 6450
Wire Wire Line
	10150 3850 10150 5050
Wire Wire Line
	10050 3850 10050 5000
$Comp
L power:GND #PWR0123
U 1 1 60ADF2AD
P 9250 5800
F 0 "#PWR0123" H 9250 5550 50  0001 C CNN
F 1 "GND" H 9255 5627 50  0000 C CNN
F 2 "" H 9250 5800 50  0001 C CNN
F 3 "" H 9250 5800 50  0001 C CNN
	1    9250 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 60ADF2B3
P 7350 5800
F 0 "#PWR0124" H 7350 5550 50  0001 C CNN
F 1 "GND" H 7355 5627 50  0000 C CNN
F 2 "" H 7350 5800 50  0001 C CNN
F 3 "" H 7350 5800 50  0001 C CNN
	1    7350 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0125
U 1 1 60ADF2B9
P 10850 5650
F 0 "#PWR0125" H 10850 5500 50  0001 C CNN
F 1 "+5V" H 10865 5823 50  0000 C CNN
F 2 "" H 10850 5650 50  0001 C CNN
F 3 "" H 10850 5650 50  0001 C CNN
	1    10850 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0126
U 1 1 60ADF2BF
P 8950 5700
F 0 "#PWR0126" H 8950 5550 50  0001 C CNN
F 1 "+5V" H 8965 5873 50  0000 C CNN
F 2 "" H 8950 5700 50  0001 C CNN
F 3 "" H 8950 5700 50  0001 C CNN
	1    8950 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5800 9250 5750
Wire Wire Line
	8950 5750 8950 5700
Wire Wire Line
	7350 5800 7350 5750
$Comp
L power:+5V #PWR0129
U 1 1 60ADF2C8
P 7900 2800
F 0 "#PWR0129" H 7900 2650 50  0001 C CNN
F 1 "+5V" V 7915 2928 50  0000 L CNN
F 2 "" H 7900 2800 50  0001 C CNN
F 3 "" H 7900 2800 50  0001 C CNN
	1    7900 2800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 60ADF2CE
P 7900 2900
F 0 "#PWR0130" H 7900 2650 50  0001 C CNN
F 1 "GND" V 7905 2772 50  0000 R CNN
F 2 "" H 7900 2900 50  0001 C CNN
F 3 "" H 7900 2900 50  0001 C CNN
	1    7900 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7850 2900 7850 3000
Wire Wire Line
	7850 2800 7900 2800
Wire Wire Line
	7850 2900 7900 2900
Connection ~ 7850 2900
$Comp
L power:GND #PWR0131
U 1 1 60ADF2D8
P 10550 6300
F 0 "#PWR0131" H 10550 6050 50  0001 C CNN
F 1 "GND" H 10555 6127 50  0000 C CNN
F 2 "" H 10550 6300 50  0001 C CNN
F 3 "" H 10550 6300 50  0001 C CNN
	1    10550 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 6250 10450 6250
Wire Wire Line
	10450 6250 10550 6250
Connection ~ 10450 6250
Wire Wire Line
	10550 6250 10550 6300
Connection ~ 10550 6250
Text Label 10150 1500 1    50   ~ 0
PAR4
Text Label 10250 1500 1    50   ~ 0
PAR3
Text Label 10350 1500 1    50   ~ 0
PAR2
Text Label 10450 1500 1    50   ~ 0
PAR1
Text Label 10550 1500 1    50   ~ 0
PAR0
Text Label 5200 6650 2    50   ~ 0
PAR0
Text Label 5200 6550 2    50   ~ 0
PAR1
Text Label 5200 6450 2    50   ~ 0
PAR2
Wire Wire Line
	5000 6450 5200 6450
Wire Wire Line
	5000 6550 5200 6550
Wire Wire Line
	5000 6650 5200 6650
$Comp
L power:GND #PWR0138
U 1 1 60ADF2EE
P 5050 7200
F 0 "#PWR0138" H 5050 6950 50  0001 C CNN
F 1 "GND" H 5100 7050 50  0000 R CNN
F 2 "" H 5050 7200 50  0001 C CNN
F 3 "" H 5050 7200 50  0001 C CNN
	1    5050 7200
	1    0    0    -1  
$EndComp
Text Label 10250 6450 1    50   ~ 0
PAR0
Text Label 8650 6450 1    50   ~ 0
PAR1
Text Label 8550 6450 1    50   ~ 0
PAR2
Text Label 8450 6450 1    50   ~ 0
PAR3
Text Label 8350 6450 1    50   ~ 0
PAR4
Wire Wire Line
	8350 6450 8350 6250
Wire Wire Line
	8450 6450 8450 6250
Wire Wire Line
	8550 6450 8550 6250
Wire Wire Line
	8650 6450 8650 6250
Wire Wire Line
	10250 6450 10250 6250
Text Label 6450 2700 0    50   ~ 0
CMDX#
Text Label 6450 2500 0    50   ~ 0
CMDOUT#
Text Label 6450 3000 0    50   ~ 0
CMDJMP#
Text Label 6450 2600 0    50   ~ 0
CMDOP#
Text Label 6450 2300 0    50   ~ 0
CMDSET#
Text Label 6450 2400 0    50   ~ 0
CMDIN#
Text Label 6450 2900 0    50   ~ 0
CMDBRE#
Wire Wire Line
	6450 2300 6850 2300
Wire Wire Line
	6450 2400 6850 2400
Wire Wire Line
	6450 2500 6850 2500
Wire Wire Line
	6450 2600 6850 2600
Wire Wire Line
	6450 2700 6850 2700
Wire Wire Line
	6450 2900 6850 2900
Wire Wire Line
	6450 3000 6850 3000
$Comp
L power:+5V #PWR0139
U 1 1 60ADF30E
P 7300 2000
F 0 "#PWR0139" H 7300 1850 50  0001 C CNN
F 1 "+5V" V 7315 2128 50  0000 L CNN
F 2 "" H 7300 2000 50  0001 C CNN
F 3 "" H 7300 2000 50  0001 C CNN
	1    7300 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 60ADF314
P 7400 3300
F 0 "#PWR0141" H 7400 3050 50  0001 C CNN
F 1 "GND" V 7405 3172 50  0000 R CNN
F 2 "" H 7400 3300 50  0001 C CNN
F 3 "" H 7400 3300 50  0001 C CNN
	1    7400 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0144
U 1 1 60ADF31A
P 7300 3500
F 0 "#PWR0144" H 7300 3350 50  0001 C CNN
F 1 "+5V" V 7300 3650 50  0000 L CNN
F 2 "" H 7300 3500 50  0001 C CNN
F 3 "" H 7300 3500 50  0001 C CNN
	1    7300 3500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0145
U 1 1 60ADF320
P 7450 5100
F 0 "#PWR0145" H 7450 4850 50  0001 C CNN
F 1 "GND" V 7455 4972 50  0000 R CNN
F 2 "" H 7450 5100 50  0001 C CNN
F 3 "" H 7450 5100 50  0001 C CNN
	1    7450 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7350 3300 7400 3300
Wire Wire Line
	7300 2000 7350 2000
Text Label 6500 3800 0    50   ~ 0
CMDJMP#
Text Label 7250 6350 0    50   ~ 0
CMDJMP#
Wire Wire Line
	7250 6350 7650 6350
Wire Wire Line
	7650 6350 7650 6250
Text Label 9150 6350 0    50   ~ 0
CMDJMP#
Wire Wire Line
	9150 6350 9550 6350
Wire Wire Line
	9550 6350 9550 6250
Wire Wire Line
	4000 5450 3700 5450
NoConn ~ 4000 6950
NoConn ~ 4000 7050
NoConn ~ 4000 7150
Wire Wire Line
	5000 7150 5050 7150
Wire Wire Line
	5050 7150 5050 7200
Wire Wire Line
	5050 7150 5050 7050
Wire Wire Line
	5050 7050 5000 7050
Connection ~ 5050 7150
Wire Wire Line
	5050 7050 5050 6950
Wire Wire Line
	5050 6950 5000 6950
Connection ~ 5050 7050
Wire Wire Line
	5050 6950 5050 6850
Wire Wire Line
	5050 6850 5000 6850
Connection ~ 5050 6950
Wire Wire Line
	5050 6850 5050 6750
Wire Wire Line
	5050 6750 5000 6750
Connection ~ 5050 6850
Text Label 8150 6450 1    50   ~ 0
BRA#
Wire Wire Line
	8150 6250 8150 6450
Text Label 10050 6450 1    50   ~ 0
BRA#
Wire Wire Line
	10050 6250 10050 6450
NoConn ~ 8150 5250
Text Label 5300 6150 2    50   ~ 0
CMDOP#
Wire Wire Line
	5000 6150 5300 6150
Wire Wire Line
	5000 6250 5150 6250
Text Label 3700 5350 0    50   ~ 0
CMDSET#
Wire Wire Line
	4000 5350 3700 5350
$Comp
L 74xx:74LS32 UOR1
U 1 1 60ADF3B1
P 4400 1150
F 0 "UOR1" V 4700 950 50  0000 C CNN
F 1 "74HC32" V 4600 950 50  0000 C CNN
F 2 "" H 4400 1150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4400 1150 50  0001 C CNN
	1    4400 1150
	0    -1   -1   0   
$EndComp
Text Label 4300 1750 1    50   ~ 0
CLK
Text Label 4500 1800 1    50   ~ 0
CMDOUT#
Text Label 5100 1750 1    50   ~ 0
CMDIN#
$Comp
L 74xx:74LS32 UOR1
U 5 1 60ADF3BD
P 800 1300
F 0 "UOR1" H 850 1800 50  0000 L CNN
F 1 "74HC32" H 850 1700 50  0000 L CNN
F 2 "" H 800 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 800 1300 50  0001 C CNN
	5    800  1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 60ADF3C4
P 800 1850
F 0 "#PWR0146" H 800 1600 50  0001 C CNN
F 1 "GND" H 805 1677 50  0000 C CNN
F 2 "" H 800 1850 50  0001 C CNN
F 3 "" H 800 1850 50  0001 C CNN
	1    800  1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0147
U 1 1 60ADF3CA
P 800 750
F 0 "#PWR0147" H 800 600 50  0001 C CNN
F 1 "+5V" H 815 923 50  0000 C CNN
F 2 "" H 800 750 50  0001 C CNN
F 3 "" H 800 750 50  0001 C CNN
	1    800  750 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 UOR1
U 3 1 60ADF3D0
P 8700 1450
F 0 "UOR1" V 9000 1250 50  0000 C CNN
F 1 "74HC32" V 8900 1250 50  0000 C CNN
F 2 "" H 8700 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8700 1450 50  0001 C CNN
	3    8700 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0148
U 1 1 60ADF3D7
P 7950 6300
F 0 "#PWR0148" H 7950 6150 50  0001 C CNN
F 1 "+5V" H 7965 6473 50  0000 C CNN
F 2 "" H 7950 6300 50  0001 C CNN
F 3 "" H 7950 6300 50  0001 C CNN
	1    7950 6300
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0149
U 1 1 60ADF3DD
P 9850 6300
F 0 "#PWR0149" H 9850 6150 50  0001 C CNN
F 1 "+5V" H 9865 6473 50  0000 C CNN
F 2 "" H 9850 6300 50  0001 C CNN
F 3 "" H 9850 6300 50  0001 C CNN
	1    9850 6300
	-1   0    0    1   
$EndComp
Wire Wire Line
	9850 6300 9950 6300
Wire Wire Line
	9950 6300 9950 6250
Wire Wire Line
	9850 6250 9850 6300
Connection ~ 9850 6300
Wire Wire Line
	7950 6250 7950 6300
Wire Wire Line
	8350 5250 8350 4900
Wire Wire Line
	8450 5250 8450 4950
Wire Wire Line
	8550 5250 8550 5000
Wire Wire Line
	8650 5250 8650 5050
Wire Wire Line
	8050 6250 8050 6500
Wire Wire Line
	8050 6500 9100 6500
Wire Wire Line
	10050 5150 10050 5250
Wire Wire Line
	9100 5150 9100 6500
Wire Wire Line
	800  800  800  750 
Wire Wire Line
	800  1850 800  1800
Wire Wire Line
	10550 3850 10550 5250
Wire Wire Line
	10350 3850 10350 5250
Wire Wire Line
	10450 3850 10450 5250
Wire Wire Line
	10250 3850 10250 5250
Wire Wire Line
	9100 5150 10050 5150
Wire Wire Line
	8350 4900 9850 4900
Wire Wire Line
	8450 4950 9950 4950
Wire Wire Line
	8550 5000 10050 5000
Wire Wire Line
	8650 5050 10150 5050
Wire Wire Line
	10850 5650 10850 5750
Text Label 8700 4050 0    50   ~ 0
RES#
Wire Wire Line
	8700 4050 8950 4050
Wire Wire Line
	8200 3850 8250 3850
Wire Wire Line
	8500 4000 8550 4000
Wire Wire Line
	8550 3850 8550 4000
Wire Wire Line
	7300 3500 7350 3500
Wire Wire Line
	7850 4100 9050 4100
Wire Wire Line
	7850 4200 9150 4200
Wire Wire Line
	7850 4500 9450 4500
Wire Wire Line
	7850 4600 9550 4600
Wire Wire Line
	7850 4700 9650 4700
Wire Wire Line
	7850 4800 9750 4800
Wire Wire Line
	7350 5100 7450 5100
Wire Wire Line
	6850 4800 6200 4800
Connection ~ 6200 4800
Wire Wire Line
	6850 4700 6100 4700
Connection ~ 6100 4700
Wire Wire Line
	6850 4600 6000 4600
Connection ~ 6000 4600
Wire Wire Line
	6850 4500 5900 4500
Connection ~ 5900 4500
Wire Wire Line
	4300 1750 4300 1450
Text Label 4900 1750 1    50   ~ 0
CLK
Wire Wire Line
	4900 1750 4900 1450
Wire Wire Line
	4500 1800 4500 1450
Wire Wire Line
	5100 1750 5100 1450
Wire Wire Line
	6500 3800 6850 3800
Wire Wire Line
	6500 3900 6850 3900
Wire Wire Line
	1100 4600 1100 4550
Wire Wire Line
	2700 4600 2700 4650
Wire Wire Line
	2700 2600 2700 2550
Wire Wire Line
	1100 2550 1100 2500
$Comp
L 74xx:74LS574 UIR1
U 1 1 60ADF4FC
P 10350 2050
F 0 "UIR1" V 10800 1500 50  0000 L CNN
F 1 "74HC574" V 10700 1450 50  0000 L CNN
F 2 "" H 10350 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 10350 2050 50  0001 C CNN
	1    10350 2050
	0    -1   -1   0   
$EndComp
Text Label 10750 2750 1    50   ~ 0
CLK
$Comp
L power:GND #PWR0151
U 1 1 60ADF504
P 10850 2650
F 0 "#PWR0151" H 10850 2400 50  0001 C CNN
F 1 "GND" H 10855 2477 50  0000 C CNN
F 2 "" H 10850 2650 50  0001 C CNN
F 3 "" H 10850 2650 50  0001 C CNN
	1    10850 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 60ADF50A
P 11100 2250
F 0 "#PWR0152" H 11100 2000 50  0001 C CNN
F 1 "GND" H 11105 2077 50  0000 C CNN
F 2 "" H 11100 2250 50  0001 C CNN
F 3 "" H 11100 2250 50  0001 C CNN
	1    11100 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0153
U 1 1 60ADF510
P 9550 2000
F 0 "#PWR0153" H 9550 1850 50  0001 C CNN
F 1 "+5V" H 9565 2173 50  0000 C CNN
F 2 "" H 9550 2000 50  0001 C CNN
F 3 "" H 9550 2000 50  0001 C CNN
	1    9550 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2300 9150 1300
Wire Wire Line
	7800 1050 7800 750 
Wire Wire Line
	7700 1050 7700 700 
Wire Wire Line
	6700 1050 6700 800 
Wire Wire Line
	6800 1950 6800 1750
Wire Wire Line
	8000 1800 8000 1750
Wire Wire Line
	8000 1800 7900 1800
Wire Wire Line
	7100 1800 7100 1750
Wire Wire Line
	7900 1750 7900 1800
Connection ~ 7900 1800
Wire Wire Line
	7900 1800 7800 1800
Wire Wire Line
	7800 1750 7800 1800
Connection ~ 7800 1800
Wire Wire Line
	7800 1800 7700 1800
Wire Wire Line
	7700 1750 7700 1800
Connection ~ 7700 1800
Wire Wire Line
	7700 1800 7600 1800
Wire Wire Line
	7600 1750 7600 1800
Connection ~ 7600 1800
Wire Wire Line
	7600 1800 7500 1800
Wire Wire Line
	7500 1750 7500 1800
Connection ~ 7500 1800
Wire Wire Line
	7500 1800 7400 1800
Wire Wire Line
	7400 1750 7400 1800
Connection ~ 7400 1800
Wire Wire Line
	7400 1800 7300 1800
Wire Wire Line
	7300 1750 7300 1800
Connection ~ 7300 1800
Wire Wire Line
	7300 1800 7200 1800
Wire Wire Line
	7200 1750 7200 1800
Connection ~ 7200 1800
Wire Wire Line
	7200 1800 7100 1800
Wire Wire Line
	7200 1050 7200 750 
Wire Wire Line
	8800 1750 8800 2500
Connection ~ 8800 2500
Wire Wire Line
	8800 2500 9350 2500
Connection ~ 8600 2400
Wire Wire Line
	8600 2400 9250 2400
Wire Wire Line
	7850 2400 8600 2400
Wire Wire Line
	7850 2500 8800 2500
Wire Wire Line
	7900 1050 7900 850 
Wire Wire Line
	8700 850  8700 1150
$Comp
L power:GND #PWR0154
U 1 1 60ADF576
P 7400 1050
F 0 "#PWR0154" H 7400 800 50  0001 C CNN
F 1 "GND" H 7405 877 50  0000 C CNN
F 2 "" H 7400 1050 50  0001 C CNN
F 3 "" H 7400 1050 50  0001 C CNN
	1    7400 1050
	1    0    0    1   
$EndComp
Wire Wire Line
	10150 750  10150 1550
Wire Wire Line
	10250 700  10250 1550
Wire Wire Line
	10350 650  10350 1550
Wire Wire Line
	10450 600  10450 1550
Wire Wire Line
	10550 550  10550 1550
Text Label 9650 1300 2    50   ~ 0
CMD0
Text Label 9650 1400 2    50   ~ 0
CMD1
Text Label 9650 1500 2    50   ~ 0
CMD2
Wire Wire Line
	9050 3850 9050 4100
Wire Wire Line
	9150 3850 9150 4200
Wire Wire Line
	6850 4400 5800 4400
$Comp
L Memory_Flash:SST39SF040 UALU?
U 1 1 60ADF5A1
P 9350 3250
AR Path="/6064DD84/60ADF5A1" Ref="UALU?"  Part="1" 
AR Path="/60ADF5A1" Ref="UALU?"  Part="1" 
AR Path="/60ADE4F9/60ADF5A1" Ref="UCODE1"  Part="1" 
F 0 "UCODE1" V 9550 2900 50  0000 C CNN
F 1 "SST39SF040" V 9450 3000 50  0000 C CNN
F 2 "" H 9350 3550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25022B.pdf" H 9350 3550 50  0001 C CNN
	1    9350 3250
	0    1    -1   0   
$EndComp
Wire Wire Line
	9350 3850 9350 4400
Wire Wire Line
	9250 3850 9250 4300
Wire Wire Line
	7850 4300 9250 4300
Wire Wire Line
	7850 4400 9350 4400
Connection ~ 5800 4400
Connection ~ 5700 4300
Wire Wire Line
	5700 4300 6850 4300
Connection ~ 5600 4200
Connection ~ 5500 4100
Wire Wire Line
	8850 3850 8750 3850
Connection ~ 8750 3850
$Comp
L 74xx:74LS32 UOR1
U 4 1 60ADF64A
P 5000 1150
F 0 "UOR1" V 5300 950 50  0000 C CNN
F 1 "74HC32" V 5200 950 50  0000 C CNN
F 2 "" H 5000 1150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5000 1150 50  0001 C CNN
	4    5000 1150
	0    -1   -1   0   
$EndComp
NoConn ~ 6850 2800
$Comp
L Memory_Flash:SST39SF040 UALU?
U 1 1 60ADF209
P 4600 4350
AR Path="/6064DD84/60ADF209" Ref="UALU?"  Part="1" 
AR Path="/60ADF209" Ref="UALU?"  Part="1" 
AR Path="/60ADE4F9/60ADF209" Ref="UALU1"  Part="1" 
F 0 "UALU1" H 4600 4550 50  0000 C CNN
F 1 "SST39SF040" H 4700 4650 50  0000 C CNN
F 2 "" H 4600 4650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25022B.pdf" H 4600 4650 50  0001 C CNN
	1    4600 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4800 6200 7350
Wire Wire Line
	6100 4700 6100 7350
Wire Wire Line
	6000 4600 6000 7350
Wire Wire Line
	5900 4500 5900 7350
Wire Wire Line
	5700 4300 5700 7350
Wire Wire Line
	5800 4400 5800 7350
Wire Wire Line
	5500 4100 5500 7350
Wire Wire Line
	5600 4200 5600 7350
Wire Wire Line
	4000 6450 3600 6450
Wire Wire Line
	3600 4950 4000 4950
Wire Wire Line
	4000 6550 3550 6550
Wire Wire Line
	3550 4850 4000 4850
Wire Wire Line
	4000 6650 3500 6650
Wire Wire Line
	3500 4750 4000 4750
Wire Wire Line
	5200 3150 6200 3150
Wire Wire Line
	5200 3250 6100 3250
Wire Wire Line
	5200 3350 6000 3350
Wire Wire Line
	5200 3450 5900 3450
Wire Wire Line
	5200 3550 5800 3550
Wire Wire Line
	5200 3650 5700 3650
Wire Wire Line
	5200 3750 5600 3750
Wire Wire Line
	5200 3850 5500 3850
Wire Wire Line
	5700 4200 5700 4300
Wire Wire Line
	5800 4100 5800 4400
Connection ~ 8550 3850
Wire Wire Line
	8550 3850 8750 3850
Wire Wire Line
	10750 2750 10750 2550
Wire Wire Line
	10850 2650 10850 2550
Wire Wire Line
	11100 2250 11100 2200
Wire Wire Line
	11100 2200 11150 2200
Wire Wire Line
	11150 2200 11150 2050
Wire Wire Line
	9850 1500 9850 1550
Wire Wire Line
	9350 1500 9850 1500
Wire Wire Line
	9950 1400 9950 1550
Wire Wire Line
	9250 1400 9950 1400
Wire Wire Line
	10050 1300 10050 1550
Wire Wire Line
	9150 1300 10050 1300
Wire Wire Line
	9850 2650 9850 2550
Wire Wire Line
	9950 2650 9950 2550
Wire Wire Line
	10050 2650 10050 2550
Wire Wire Line
	10150 2650 10150 2550
Wire Wire Line
	10250 2650 10250 2550
Wire Wire Line
	10350 2650 10350 2550
Wire Wire Line
	10450 2650 10450 2550
Wire Wire Line
	10550 2650 10550 2550
Text HLabel 750  3150 0    50   Input ~ 0
A0
Text HLabel 750  3250 0    50   Input ~ 0
A1
Text HLabel 750  3350 0    50   Input ~ 0
A2
Text HLabel 750  3450 0    50   Input ~ 0
A3
Text HLabel 750  3550 0    50   Input ~ 0
A4
Text HLabel 750  3650 0    50   Input ~ 0
A5
Text HLabel 750  3750 0    50   Input ~ 0
A6
Text HLabel 750  3850 0    50   Input ~ 0
A7
$Comp
L power:+5V #PWR?
U 1 1 616C39E3
P 1100 6600
AR Path="/5F7D6FC1/616C39E3" Ref="#PWR?"  Part="1" 
AR Path="/616C39E3" Ref="#PWR?"  Part="1" 
AR Path="/60ADE4F9/616C39E3" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 1100 6450 50  0001 C CNN
F 1 "+5V" V 1100 6800 50  0000 C CNN
F 2 "" H 1100 6600 50  0001 C CNN
F 3 "" H 1100 6600 50  0001 C CNN
	1    1100 6600
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS377 UR?
U 1 1 616C39E9
P 1900 6650
AR Path="/5F7D6FC1/616C39E9" Ref="UR?"  Part="1" 
AR Path="/616C39E9" Ref="UR?"  Part="1" 
AR Path="/60ADE4F9/616C39E9" Ref="UC1"  Part="1" 
F 0 "UC1" V 2400 6300 50  0000 R CNN
F 1 "74HC377" V 2300 6350 50  0000 R CNN
F 2 "" H 1900 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS377" H 1900 6650 50  0001 C CNN
	1    1900 6650
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0156
U 1 1 616C39F0
P 2700 6700
F 0 "#PWR0156" H 2700 6450 50  0001 C CNN
F 1 "GND" V 2705 6572 50  0000 R CNN
F 2 "" H 2700 6700 50  0001 C CNN
F 3 "" H 2700 6700 50  0001 C CNN
	1    2700 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1100 6650 1100 6600
Wire Wire Line
	2700 6650 2700 6700
Text HLabel 750  5200 0    50   Input ~ 0
B0
Text HLabel 750  5300 0    50   Input ~ 0
B1
Text HLabel 750  5400 0    50   Input ~ 0
B2
Text HLabel 750  5500 0    50   Input ~ 0
B3
Text HLabel 750  5600 0    50   Input ~ 0
B4
Text HLabel 750  5700 0    50   Input ~ 0
B5
Text HLabel 750  5800 0    50   Input ~ 0
B6
Text HLabel 750  5900 0    50   Input ~ 0
B7
Text HLabel 1400 7350 3    50   Input ~ 0
C0
Text HLabel 1500 7350 3    50   Input ~ 0
C1
Text HLabel 1600 7350 3    50   Input ~ 0
C2
Text HLabel 1700 7350 3    50   Input ~ 0
C3
Text HLabel 1800 7350 3    50   Input ~ 0
C4
Text HLabel 1900 7350 3    50   Input ~ 0
C5
Text HLabel 2000 7350 3    50   Input ~ 0
C6
Text HLabel 2100 7350 3    50   Input ~ 0
C7
Wire Wire Line
	1400 5100 1400 5200
Wire Wire Line
	1500 5100 1500 5300
Wire Wire Line
	1600 5100 1600 5400
Wire Wire Line
	1800 5100 1800 5600
Wire Wire Line
	1900 5100 1900 5700
Wire Wire Line
	2000 5100 2000 5800
Wire Wire Line
	2100 5100 2100 5900
Wire Wire Line
	1400 3050 1400 3150
Wire Wire Line
	1500 3050 1500 3250
Wire Wire Line
	1600 3050 1600 3350
Wire Wire Line
	1700 3050 1700 3450
Wire Wire Line
	1800 3050 1800 3550
Wire Wire Line
	1900 3050 1900 3650
Wire Wire Line
	2000 3050 2000 3750
Wire Wire Line
	2100 3050 2100 3850
Wire Wire Line
	1400 7150 1400 7350
Wire Wire Line
	1500 7150 1500 7350
Wire Wire Line
	1600 7150 1600 7350
Wire Wire Line
	1700 7150 1700 7350
Wire Wire Line
	1800 7150 1800 7350
Wire Wire Line
	1900 7150 1900 7350
Wire Wire Line
	2000 7150 2000 7350
Wire Wire Line
	2100 7150 2100 7350
Wire Wire Line
	750  5200 1400 5200
Wire Wire Line
	750  5300 1500 5300
Wire Wire Line
	750  5400 1600 5400
Wire Wire Line
	750  5500 1700 5500
Wire Wire Line
	1700 5100 1700 5500
Wire Wire Line
	750  5600 1800 5600
Wire Wire Line
	750  5700 1900 5700
Wire Wire Line
	750  5800 2000 5800
Wire Wire Line
	750  5900 2100 5900
Text Label 2400 5950 3    50   ~ 0
CMDX#
Text Label 2300 5950 3    50   ~ 0
CLK
Connection ~ 1400 5200
Connection ~ 1500 5300
Connection ~ 1600 5400
Connection ~ 1700 5500
Connection ~ 1800 5600
Connection ~ 1900 5700
Connection ~ 2000 5800
Connection ~ 2100 5900
Wire Wire Line
	1400 5200 1400 6150
Wire Wire Line
	1500 5300 1500 6150
Wire Wire Line
	1600 5400 1600 6150
Wire Wire Line
	1700 5500 1700 6150
Wire Wire Line
	1800 5600 1800 6150
Wire Wire Line
	1900 5700 1900 6150
Wire Wire Line
	2000 5800 2000 6150
Wire Wire Line
	2100 5900 2100 6150
Text Label 2400 3900 3    50   ~ 0
CMDX#
Text Label 2300 3900 3    50   ~ 0
CLK
Wire Wire Line
	2300 4100 2300 3900
Wire Wire Line
	2400 4100 2400 3900
Text Label 2400 1850 3    50   ~ 0
CMDX#
Text Label 2300 1850 3    50   ~ 0
CLK
Wire Wire Line
	2300 2050 2300 1850
Wire Wire Line
	2400 2050 2400 1850
Connection ~ 5500 3850
Connection ~ 5600 3750
Connection ~ 5700 3650
Connection ~ 5800 3550
Connection ~ 5900 3450
Connection ~ 6000 3350
Connection ~ 6100 3250
Connection ~ 6200 3150
Wire Wire Line
	6200 3150 6200 4800
Wire Wire Line
	6100 3250 6100 4700
Wire Wire Line
	6000 3350 6000 4600
Wire Wire Line
	5900 3450 5900 4500
Wire Wire Line
	5800 3550 5800 4100
Wire Wire Line
	5700 3650 5700 4200
Wire Wire Line
	5600 3750 5600 4200
Wire Wire Line
	5500 3850 5500 4100
Wire Wire Line
	3600 4950 3600 6450
Wire Wire Line
	3550 4850 3550 6550
Wire Wire Line
	3500 4750 3500 6650
Wire Wire Line
	750  3150 1400 3150
Connection ~ 1400 3150
Wire Wire Line
	1400 3150 1400 4100
Wire Wire Line
	1400 3150 3150 3150
Wire Wire Line
	750  3250 1500 3250
Connection ~ 1500 3250
Wire Wire Line
	1500 3250 1500 4100
Wire Wire Line
	1500 3250 4000 3250
Wire Wire Line
	750  3350 1600 3350
Connection ~ 1600 3350
Wire Wire Line
	1600 3350 1600 4100
Wire Wire Line
	1600 3350 4000 3350
Wire Wire Line
	750  3450 1700 3450
Connection ~ 1700 3450
Wire Wire Line
	1700 3450 1700 4100
Wire Wire Line
	1700 3450 4000 3450
Wire Wire Line
	750  3550 1800 3550
Connection ~ 1800 3550
Wire Wire Line
	1800 3550 1800 4100
Wire Wire Line
	1800 3550 4000 3550
Wire Wire Line
	750  3650 1900 3650
Connection ~ 1900 3650
Wire Wire Line
	1900 3650 1900 4100
Wire Wire Line
	1900 3650 4000 3650
Wire Wire Line
	750  3750 2000 3750
Connection ~ 2000 3750
Wire Wire Line
	2000 3750 2000 4100
Wire Wire Line
	2000 3750 4000 3750
Wire Wire Line
	750  3850 2100 3850
Connection ~ 2100 3850
Wire Wire Line
	2100 3850 2100 4100
Wire Wire Line
	2100 3850 4000 3850
Wire Wire Line
	3000 5200 3000 3950
Wire Wire Line
	3000 3950 4000 3950
Wire Wire Line
	1400 5200 3000 5200
Wire Wire Line
	1500 5300 3050 5300
Wire Wire Line
	3050 5300 3050 4050
Wire Wire Line
	3050 4050 4000 4050
Wire Wire Line
	1600 5400 3100 5400
Wire Wire Line
	3100 5400 3100 4150
Wire Wire Line
	3100 4150 4000 4150
Wire Wire Line
	1700 5500 3150 5500
Wire Wire Line
	3150 5500 3150 4250
Wire Wire Line
	3150 4250 4000 4250
Wire Wire Line
	1800 5600 3200 5600
Wire Wire Line
	3200 5600 3200 4350
Wire Wire Line
	3200 4350 4000 4350
Wire Wire Line
	1900 5700 3250 5700
Wire Wire Line
	3250 5700 3250 4450
Wire Wire Line
	3250 4450 4000 4450
Wire Wire Line
	2000 5800 3300 5800
Wire Wire Line
	3300 5800 3300 4550
Wire Wire Line
	3300 4550 4000 4550
Wire Wire Line
	2100 5900 3350 5900
Wire Wire Line
	3350 5900 3350 4650
Wire Wire Line
	3350 4650 4000 4650
Text HLabel 5500 7350 3    50   Input ~ 0
D7
Text HLabel 5600 7350 3    50   Input ~ 0
D6
Text HLabel 5700 7350 3    50   Input ~ 0
D5
Text HLabel 5800 7350 3    50   Input ~ 0
D4
Text HLabel 5900 7350 3    50   Input ~ 0
D3
Text HLabel 6000 7350 3    50   Input ~ 0
D2
Text HLabel 6100 7350 3    50   Input ~ 0
D1
Text HLabel 6200 7350 3    50   Input ~ 0
D0
Wire Wire Line
	5500 4100 6850 4100
Wire Wire Line
	5600 4200 6850 4200
Wire Wire Line
	2100 2050 2100 1750
Wire Wire Line
	2100 1750 2850 1750
Wire Wire Line
	2000 2050 2000 1650
Wire Wire Line
	1900 2050 1900 1550
Wire Wire Line
	1900 1550 2950 1550
Wire Wire Line
	1800 2050 1800 1450
Wire Wire Line
	1800 1450 3000 1450
Wire Wire Line
	1700 2050 1700 1350
Wire Wire Line
	1700 1350 3050 1350
Wire Wire Line
	1600 2050 1600 1250
Wire Wire Line
	1500 2050 1500 1150
Wire Wire Line
	1500 1150 3150 1150
Wire Wire Line
	1400 2050 1400 1050
Wire Wire Line
	1400 1050 3200 1050
Wire Wire Line
	9550 2050 9550 2000
Wire Wire Line
	9250 1400 9250 2400
Wire Wire Line
	9350 1500 9350 2500
Wire Wire Line
	8600 1750 8600 2300
Wire Wire Line
	2850 1750 2850 2550
Wire Wire Line
	2850 2550 5500 2550
Connection ~ 5500 2550
Wire Wire Line
	5500 2550 5500 3850
Wire Wire Line
	2900 1650 2900 2450
Wire Wire Line
	2900 2450 5600 2450
Wire Wire Line
	2000 1650 2900 1650
Connection ~ 5600 2450
Wire Wire Line
	5600 2450 5600 3750
Wire Wire Line
	2950 1550 2950 2350
Wire Wire Line
	2950 2350 5700 2350
Connection ~ 5700 2350
Wire Wire Line
	5700 2350 5700 3650
Wire Wire Line
	3000 1450 3000 2250
Wire Wire Line
	3000 2250 5800 2250
Connection ~ 5800 2250
Wire Wire Line
	5800 2250 5800 3550
Wire Wire Line
	3050 1350 3050 2150
Wire Wire Line
	3050 2150 5900 2150
Connection ~ 5900 2150
Wire Wire Line
	5900 2150 5900 3450
Wire Wire Line
	3100 1250 3100 2050
Wire Wire Line
	3100 2050 6000 2050
Wire Wire Line
	1600 1250 3100 1250
Connection ~ 6000 2050
Wire Wire Line
	6000 2050 6000 3350
Wire Wire Line
	3150 1150 3150 1950
Wire Wire Line
	3150 1950 6100 1950
Wire Wire Line
	3200 1050 3200 1850
Wire Wire Line
	3200 1850 6200 1850
Text HLabel 4400 800  1    50   Input ~ 0
WR#
Text HLabel 5000 800  1    50   Input ~ 0
RD#
Wire Wire Line
	4400 850  4400 800 
Wire Wire Line
	5000 850  5000 800 
Text HLabel 3750 800  1    50   Input ~ 0
CLK
Text HLabel 3950 800  1    50   Input ~ 0
RES#
Text Label 3750 1050 1    50   ~ 0
CLK
Text Label 3950 1050 1    50   ~ 0
RES#
Wire Wire Line
	3750 1050 3750 800 
Wire Wire Line
	3950 1050 3950 800 
Wire Wire Line
	2400 5950 2400 6150
Wire Wire Line
	2300 5950 2300 6150
$Comp
L 74xx:74LS32 UOR1
U 2 1 62CEB51D
P 3550 2900
F 0 "UOR1" H 3650 3150 50  0000 L CNN
F 1 "74HC32" H 3650 3050 50  0000 L CNN
F 2 "" H 3550 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3550 2900 50  0001 C CNN
	2    3550 2900
	1    0    0    -1  
$EndComp
Text Label 4100 2900 2    50   ~ 0
BRA#
Wire Wire Line
	4100 2900 3850 2900
Text Label 2850 2800 0    50   ~ 0
CMDBRE#
Wire Wire Line
	2850 2800 3250 2800
Wire Wire Line
	3150 3150 3150 3000
Wire Wire Line
	3150 3000 3250 3000
Connection ~ 3150 3150
Wire Wire Line
	3150 3150 4000 3150
Wire Wire Line
	7900 850  8700 850 
Wire Wire Line
	8000 1050 8000 1000
Wire Wire Line
	7800 750  10150 750 
Wire Wire Line
	7700 700  10250 700 
Wire Wire Line
	7600 650  10350 650 
Wire Wire Line
	7600 650  7600 1050
Wire Wire Line
	7500 600  10450 600 
Wire Wire Line
	7500 600  7500 1050
Wire Wire Line
	10550 550  7300 550 
Wire Wire Line
	7300 550  7300 1050
Wire Wire Line
	7000 2050 6300 2050
Wire Wire Line
	7000 1750 7000 2050
Wire Wire Line
	6800 1950 6400 1950
Wire Wire Line
	6900 2000 6350 2000
Wire Wire Line
	6900 1750 6900 2000
Wire Wire Line
	6700 800  5900 800 
Wire Wire Line
	5900 800  5900 2150
Wire Wire Line
	6800 750  5800 750 
Wire Wire Line
	6800 750  6800 1050
Wire Wire Line
	5800 750  5800 2250
Wire Wire Line
	6900 700  5700 700 
Wire Wire Line
	6900 700  6900 1050
Wire Wire Line
	5700 700  5700 2350
Wire Wire Line
	7000 650  5600 650 
Wire Wire Line
	7000 650  7000 1050
Wire Wire Line
	5600 650  5600 2450
Wire Wire Line
	7100 600  5500 600 
Wire Wire Line
	7100 600  7100 1050
Wire Wire Line
	5500 600  5500 2550
Wire Wire Line
	6000 1450 6400 1450
Wire Wire Line
	6400 1450 6400 1950
Wire Wire Line
	6000 1450 6000 2050
Wire Wire Line
	6100 1950 6100 1500
Connection ~ 6100 1950
Wire Wire Line
	6200 1850 6200 1550
Connection ~ 6200 1850
Wire Wire Line
	6700 1800 6700 1750
Wire Wire Line
	6350 2000 6350 1500
Wire Wire Line
	6350 1500 6100 1500
Wire Wire Line
	6300 2050 6300 1550
Wire Wire Line
	6300 1550 6200 1550
Wire Wire Line
	6200 1850 6200 3150
Wire Wire Line
	6100 1950 6100 3250
Wire Wire Line
	8000 1850 8000 1800
Connection ~ 8000 1800
$Comp
L power:GND #PWR0157
U 1 1 637C537A
P 8000 1850
F 0 "#PWR0157" H 8000 1600 50  0001 C CNN
F 1 "GND" H 8005 1677 50  0000 C CNN
F 2 "" H 8000 1850 50  0001 C CNN
F 3 "" H 8000 1850 50  0001 C CNN
	1    8000 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 2300 8600 2400
Wire Wire Line
	7850 2300 9150 2300
Wire Wire Line
	8950 4050 8950 3850
$Comp
L power:GND #PWR0150
U 1 1 60ADF4ED
P 4600 3050
F 0 "#PWR0150" H 4600 2800 50  0001 C CNN
F 1 "GND" V 4605 2922 50  0000 R CNN
F 2 "" H 4600 3050 50  0001 C CNN
F 3 "" H 4600 3050 50  0001 C CNN
	1    4600 3050
	-1   0    0    1   
$EndComp
$EndSCHEMATC
