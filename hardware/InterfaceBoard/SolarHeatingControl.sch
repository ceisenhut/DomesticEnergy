EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 2
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
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY7
U 1 1 5DFFD0AB
P 11950 8650
F 0 "RLY7" H 12278 8696 50  0000 L CNN
F 1 "?" H 12278 8605 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 12150 8850 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 8950 60  0001 L CNN
F 4 "Z1011-ND" H 12150 9050 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 12150 9150 60  0001 L CNN "MPN"
F 6 "Relays" H 12150 9250 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 12150 9350 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 9450 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 12150 9550 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 12150 9650 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 12150 9750 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12150 9850 60  0001 L CNN "Status"
	1    11950 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  950  4600 950 
Wire Wire Line
	950  1100 3600 1100
Wire Wire Line
	950  1250 3450 1250
Text Label 1100 950  0    60   ~ 0
PE
Text Label 1100 1250 0    60   ~ 0
L1
Text Label 1100 1100 0    60   ~ 0
N
$Comp
L power:GND #PWR07
U 1 1 5E010F54
P 11750 8950
AR Path="/5E010F54" Ref="#PWR07"  Part="1" 
AR Path="/5DFCE2AC/5E010F54" Ref="#PWR?"  Part="1" 
AR Path="/5E04B915/5E010F54" Ref="#PWR?"  Part="1" 
F 0 "#PWR07" H 11750 8700 50  0001 C CNN
F 1 "GND" H 11750 8800 50  0000 C CNN
F 2 "" H 11750 8950 50  0000 C CNN
F 3 "" H 11750 8950 50  0000 C CNN
	1    11750 8950
	1    0    0    -1  
$EndComp
Text Label 11350 8350 0    60   ~ 0
AA0
$Comp
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY6
U 1 1 5E01531C
P 11950 7650
F 0 "RLY6" H 12278 7696 50  0000 L CNN
F 1 "?" H 12278 7605 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 12150 7850 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 7950 60  0001 L CNN
F 4 "Z1011-ND" H 12150 8050 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 12150 8150 60  0001 L CNN "MPN"
F 6 "Relays" H 12150 8250 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 12150 8350 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 8450 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 12150 8550 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 12150 8650 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 12150 8750 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12150 8850 60  0001 L CNN "Status"
	1    11950 7650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E015322
P 11750 7950
AR Path="/5E015322" Ref="#PWR06"  Part="1" 
AR Path="/5DFCE2AC/5E015322" Ref="#PWR?"  Part="1" 
AR Path="/5E04B915/5E015322" Ref="#PWR?"  Part="1" 
F 0 "#PWR06" H 11750 7700 50  0001 C CNN
F 1 "GND" H 11750 7800 50  0000 C CNN
F 2 "" H 11750 7950 50  0000 C CNN
F 3 "" H 11750 7950 50  0000 C CNN
	1    11750 7950
	1    0    0    -1  
$EndComp
Text Label 11350 7350 0    60   ~ 0
AA1
$Comp
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY5
U 1 1 5E01660C
P 11950 6600
F 0 "RLY5" H 12278 6646 50  0000 L CNN
F 1 "?" H 12278 6555 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 12150 6800 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 6900 60  0001 L CNN
F 4 "Z1011-ND" H 12150 7000 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 12150 7100 60  0001 L CNN "MPN"
F 6 "Relays" H 12150 7200 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 12150 7300 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 7400 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 12150 7500 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 12150 7600 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 12150 7700 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12150 7800 60  0001 L CNN "Status"
	1    11950 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E016612
P 11750 6900
AR Path="/5E016612" Ref="#PWR05"  Part="1" 
AR Path="/5DFCE2AC/5E016612" Ref="#PWR?"  Part="1" 
AR Path="/5E04B915/5E016612" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 11750 6650 50  0001 C CNN
F 1 "GND" H 11750 6750 50  0000 C CNN
F 2 "" H 11750 6900 50  0000 C CNN
F 3 "" H 11750 6900 50  0000 C CNN
	1    11750 6900
	1    0    0    -1  
$EndComp
Text Label 11350 6300 0    60   ~ 0
AA2
$Comp
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY4
U 1 1 5E02368C
P 11950 5550
F 0 "RLY4" H 12278 5596 50  0000 L CNN
F 1 "?" H 12278 5505 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 12150 5750 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 5850 60  0001 L CNN
F 4 "Z1011-ND" H 12150 5950 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 12150 6050 60  0001 L CNN "MPN"
F 6 "Relays" H 12150 6150 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 12150 6250 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 6350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 12150 6450 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 12150 6550 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 12150 6650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12150 6750 60  0001 L CNN "Status"
	1    11950 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E023692
P 11750 5850
AR Path="/5E023692" Ref="#PWR04"  Part="1" 
AR Path="/5DFCE2AC/5E023692" Ref="#PWR?"  Part="1" 
AR Path="/5E04B915/5E023692" Ref="#PWR?"  Part="1" 
F 0 "#PWR04" H 11750 5600 50  0001 C CNN
F 1 "GND" H 11750 5700 50  0000 C CNN
F 2 "" H 11750 5850 50  0000 C CNN
F 3 "" H 11750 5850 50  0000 C CNN
	1    11750 5850
	1    0    0    -1  
$EndComp
Text Label 11350 5250 0    60   ~ 0
AA3
$Comp
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY3
U 1 1 5E0236A3
P 11950 4550
F 0 "RLY3" H 12278 4596 50  0000 L CNN
F 1 "?" H 12278 4505 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 12150 4750 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 4850 60  0001 L CNN
F 4 "Z1011-ND" H 12150 4950 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 12150 5050 60  0001 L CNN "MPN"
F 6 "Relays" H 12150 5150 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 12150 5250 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 5350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 12150 5450 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 12150 5550 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 12150 5650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12150 5750 60  0001 L CNN "Status"
	1    11950 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E0236A9
P 11750 4850
AR Path="/5E0236A9" Ref="#PWR03"  Part="1" 
AR Path="/5DFCE2AC/5E0236A9" Ref="#PWR?"  Part="1" 
AR Path="/5E04B915/5E0236A9" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 11750 4600 50  0001 C CNN
F 1 "GND" H 11750 4700 50  0000 C CNN
F 2 "" H 11750 4850 50  0000 C CNN
F 3 "" H 11750 4850 50  0000 C CNN
	1    11750 4850
	1    0    0    -1  
$EndComp
Text Label 11350 4250 0    60   ~ 0
AA4
$Comp
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY2
U 1 1 5E0236BA
P 11950 3500
F 0 "RLY2" H 12278 3546 50  0000 L CNN
F 1 "?" H 12278 3455 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 12150 3700 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 3800 60  0001 L CNN
F 4 "Z1011-ND" H 12150 3900 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 12150 4000 60  0001 L CNN "MPN"
F 6 "Relays" H 12150 4100 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 12150 4200 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 4300 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 12150 4400 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 12150 4500 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 12150 4600 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12150 4700 60  0001 L CNN "Status"
	1    11950 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E0236C0
P 11750 3800
AR Path="/5E0236C0" Ref="#PWR02"  Part="1" 
AR Path="/5DFCE2AC/5E0236C0" Ref="#PWR?"  Part="1" 
AR Path="/5E04B915/5E0236C0" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 11750 3550 50  0001 C CNN
F 1 "GND" H 11750 3650 50  0000 C CNN
F 2 "" H 11750 3800 50  0000 C CNN
F 3 "" H 11750 3800 50  0000 C CNN
	1    11750 3800
	1    0    0    -1  
$EndComp
Text Label 11350 3200 0    60   ~ 0
AA5
$Comp
L dk_Power-Relays-Over-2-Amps:G5LE-14_DC5 RLY1
U 1 1 5E03A163
P 11950 2450
F 0 "RLY1" H 12278 2496 50  0000 L CNN
F 1 "?" H 12278 2405 50  0000 L CNN
F 2 "digikey-footprints:Relay_THT_G5LE-14" H 12150 2650 50  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 2750 60  0001 L CNN
F 4 "Z1011-ND" H 12150 2850 60  0001 L CNN "Digi-Key_PN"
F 5 "G5LE-14 DC5" H 12150 2950 60  0001 L CNN "MPN"
F 6 "Relays" H 12150 3050 60  0001 L CNN "Category"
F 7 "Power Relays, Over 2 Amps" H 12150 3150 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-g5le.pdf" H 12150 3250 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/G5LE-14-DC5/Z1011-ND/280371" H 12150 3350 60  0001 L CNN "DK_Detail_Page"
F 10 "RELAY GEN PURPOSE SPDT 10A 5V" H 12150 3450 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 12150 3550 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12150 3650 60  0001 L CNN "Status"
	1    11950 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E03A169
P 11750 2750
AR Path="/5E03A169" Ref="#PWR01"  Part="1" 
AR Path="/5DFCE2AC/5E03A169" Ref="#PWR?"  Part="1" 
AR Path="/5E04B915/5E03A169" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 11750 2500 50  0001 C CNN
F 1 "GND" H 11750 2600 50  0000 C CNN
F 2 "" H 11750 2750 50  0000 C CNN
F 3 "" H 11750 2750 50  0000 C CNN
	1    11750 2750
	1    0    0    -1  
$EndComp
Text Label 11350 2150 0    60   ~ 0
AA5
Text Notes 14650 2250 0    98   ~ 20
Pumpe P3
Text Notes 14650 4000 0    98   ~ 20
Ventil V2
Text Notes 14650 6050 0    98   ~ 20
Ventil V3
Text Notes 14650 8100 0    98   ~ 20
Ventil V1
Wire Wire Line
	13000 1250 13000 2750
Wire Wire Line
	13000 9150 12050 9150
Wire Wire Line
	12050 9150 12050 8950
Connection ~ 13000 1250
Wire Wire Line
	13000 1250 15450 1250
Wire Wire Line
	12050 7950 13000 7950
Connection ~ 13000 7950
Wire Wire Line
	12050 6900 13000 6900
Connection ~ 13000 6900
Wire Wire Line
	13000 6900 13000 7950
Wire Wire Line
	12050 5850 13000 5850
Connection ~ 13000 5850
Wire Wire Line
	13000 5850 13000 6900
Wire Wire Line
	12050 3850 12050 3800
Wire Wire Line
	13000 3850 12050 3850
Wire Wire Line
	13000 3850 13000 4850
Wire Wire Line
	12050 2750 13000 2750
Wire Wire Line
	13000 2750 13000 3850
Connection ~ 13000 2750
Connection ~ 13000 3850
Wire Wire Line
	12050 4850 13000 4850
Connection ~ 13000 4850
Wire Wire Line
	13000 4850 13000 5850
Wire Wire Line
	11950 2150 11950 2050
Wire Wire Line
	11950 2050 14500 2050
Wire Wire Line
	11950 3200 11950 3100
Wire Wire Line
	11950 4250 11950 4100
Wire Wire Line
	11950 4100 14500 4100
Wire Wire Line
	11950 6300 11950 6150
Wire Wire Line
	11950 6150 14500 6150
Wire Wire Line
	11950 8350 11950 8200
Wire Wire Line
	11950 8200 14500 8200
Wire Wire Line
	13150 1100 13150 2200
Connection ~ 13150 1100
Wire Wire Line
	13150 1100 15450 1100
Wire Wire Line
	14500 3950 13150 3950
Connection ~ 13150 3950
Wire Wire Line
	13150 3950 13150 6000
Wire Wire Line
	14500 6000 13150 6000
Wire Wire Line
	13000 7950 13000 9150
Wire Wire Line
	13150 6000 13150 8050
Wire Wire Line
	13150 8050 14500 8050
Connection ~ 13150 6000
Wire Wire Line
	14500 7900 13300 7900
Wire Wire Line
	13300 7900 13300 7200
Wire Wire Line
	13300 7200 11950 7200
Wire Wire Line
	11950 7200 11950 7350
Wire Wire Line
	13300 5850 13300 5100
Wire Wire Line
	13300 5100 11950 5100
Wire Wire Line
	11950 5100 11950 5250
Wire Wire Line
	13300 5850 14500 5850
Wire Wire Line
	13300 3800 13300 3100
Wire Wire Line
	13300 3100 11950 3100
Wire Wire Line
	13300 3800 14500 3800
Wire Wire Line
	14500 2200 13150 2200
Connection ~ 13150 2200
Wire Wire Line
	13150 2200 13150 3950
Wire Wire Line
	13300 950  13300 2350
Wire Wire Line
	13300 2350 14500 2350
Connection ~ 13300 950 
Wire Wire Line
	13300 950  15450 950 
$Comp
L MCU_Module:RaspberryPi-CM1 U1
U 1 1 5E052D4B
P 4750 9700
F 0 "U1" H 4750 6219 50  0000 C CNN
F 1 "RaspberryPi-CM1" H 4750 6310 50  0000 C CNN
F 2 "" H 4150 13100 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/computemodule/datasheets/rpi_DATA_CM_1p0.pdf" H 4150 13100 50  0001 C CNN
	1    4750 9700
	0    1    1    0   
$EndComp
Text Notes 8050 2150 0    98   ~ 20
Elektroeinsatz E1
Text Notes 5700 2150 0    98   ~ 20
Thyristorsteller
Wire Wire Line
	950  1400 6250 1400
Wire Wire Line
	6250 1400 6250 1900
Wire Wire Line
	950  1550 6100 1550
Wire Wire Line
	6100 1550 6100 1900
Wire Wire Line
	6400 1250 6400 1900
Connection ~ 6400 1250
Wire Wire Line
	6400 1250 13000 1250
Text Label 1100 1400 0    60   ~ 0
L2
Text Label 1100 1550 0    60   ~ 0
L3
Wire Wire Line
	6900 1950 8000 1950
Wire Wire Line
	6900 2250 8000 2250
Wire Wire Line
	6900 2100 8000 2100
Text Label 7250 1950 0    60   ~ 0
T1
Text Label 7250 2100 0    60   ~ 0
T2
Text Label 7250 2250 0    60   ~ 0
T3
Entry Wire Line
	2550 8700 2450 8600
Entry Wire Line
	2650 8700 2550 8600
Entry Wire Line
	2750 8700 2650 8600
Entry Wire Line
	2850 8700 2750 8600
Entry Wire Line
	2950 8700 2850 8600
Entry Wire Line
	3050 8700 2950 8600
Entry Wire Line
	3150 8700 3050 8600
Entry Wire Line
	3250 8700 3150 8600
Entry Wire Line
	3350 8700 3250 8600
Entry Wire Line
	3450 8700 3350 8600
Entry Wire Line
	3550 8700 3450 8600
Entry Wire Line
	3650 8700 3550 8600
Entry Wire Line
	3750 8700 3650 8600
Entry Wire Line
	3850 8700 3750 8600
Entry Wire Line
	3950 8700 3850 8600
Entry Wire Line
	4050 8700 3950 8600
Entry Wire Line
	4150 8700 4050 8600
Entry Wire Line
	4250 8700 4150 8600
Entry Wire Line
	4350 8700 4250 8600
Entry Wire Line
	4450 8700 4350 8600
Entry Wire Line
	4550 8700 4450 8600
Entry Wire Line
	4650 8700 4550 8600
Entry Wire Line
	4750 8700 4650 8600
Entry Wire Line
	4850 8700 4750 8600
Entry Wire Line
	4950 8700 4850 8600
Entry Wire Line
	5050 8700 4950 8600
Entry Wire Line
	5150 8700 5050 8600
Entry Wire Line
	5250 8700 5150 8600
Entry Wire Line
	5350 8700 5250 8600
Entry Wire Line
	5450 8700 5350 8600
Entry Wire Line
	5550 8700 5450 8600
Entry Wire Line
	5650 8700 5550 8600
Entry Wire Line
	5750 8700 5650 8600
Entry Wire Line
	5850 8700 5750 8600
Entry Wire Line
	5950 8700 5850 8600
Entry Wire Line
	6050 8700 5950 8600
Entry Wire Line
	6150 8700 6050 8600
Entry Wire Line
	6250 8700 6150 8600
Entry Wire Line
	6350 8700 6250 8600
Entry Wire Line
	6450 8700 6350 8600
Wire Wire Line
	10900 5700 10900 8350
Wire Wire Line
	10900 8350 11750 8350
Wire Wire Line
	11000 5600 11000 7350
Wire Wire Line
	11000 7350 11750 7350
Wire Wire Line
	11100 5500 11100 6300
Wire Wire Line
	11100 6300 11750 6300
Wire Wire Line
	11100 5400 11100 5250
Wire Wire Line
	11100 5250 11750 5250
Wire Wire Line
	11000 5300 11000 4250
Wire Wire Line
	11000 4250 11750 4250
Wire Wire Line
	10900 5200 10900 3200
Wire Wire Line
	10900 3200 11750 3200
Wire Wire Line
	10800 5100 10800 2150
Wire Wire Line
	10800 2150 11750 2150
Entry Wire Line
	2450 8700 2350 8600
Wire Bus Line
	2300 6450 2300 8600
Wire Bus Line
	5850 6450 2300 6450
Wire Wire Line
	9750 5100 10800 5100
Wire Wire Line
	9750 5200 10900 5200
Wire Wire Line
	9750 5300 11000 5300
Wire Wire Line
	9750 5400 11100 5400
Wire Wire Line
	9750 5500 11100 5500
Wire Wire Line
	9750 5600 11000 5600
Wire Wire Line
	9750 5700 10900 5700
Text Notes 2550 4000 0    98   ~ 20
T1
Text Notes 3100 3650 0    98   ~ 20
Netzteil
Text Notes 3350 4150 0    98   ~ 20
S0 Schnittstelle A
Text Notes 3350 4400 0    98   ~ 20
S0 Schnittstelle B
Text Notes 2000 4000 0    98   ~ 20
T2\n
Text Notes 1500 4000 0    98   ~ 20
T3\n
Text Notes 950  4000 0    98   ~ 20
T4\n
Text Notes 1000 6100 0    98   ~ 0
Switch Sommer / Winter
$Sheet
S 5850 3150 3900 4100
U 5E04B915
F0 "InterfaceBoard" 60
F1 "InterfaceBoard.sch" 60
F2 "AA0" I R 9750 5700 60 
F3 "AA1" I R 9750 5600 60 
F4 "AA2" I R 9750 5500 60 
F5 "AA3" I R 9750 5400 60 
F6 "AA4" I R 9750 5300 60 
F7 "AA5" I R 9750 5200 60 
F8 "AA6" I R 9750 5100 60 
F9 "RPI_GPIO" I L 5850 6450 60 
F10 "+12V" I L 5850 3450 60 
F11 "GND" I L 5850 3800 60 
F12 "+5V" I L 5850 3650 60 
F13 "CH0" I L 5850 4750 60 
F14 "CH0_GND" I L 5850 4850 60 
F15 "CH7" I L 5850 6950 60 
F16 "CH7_GND" I L 5850 7050 60 
F17 "CH1" I L 5850 5000 60 
F18 "CH1_GND" I L 5850 5100 60 
F19 "CH2" I L 5850 5250 60 
F20 "CH2_GND" I L 5850 5350 60 
F21 "CH3" I L 5850 5500 60 
F22 "CH3_GND" I L 5850 5600 60 
F23 "CH4" I L 5850 5750 60 
F24 "CH4_GND" I L 5850 5850 60 
F25 "CH5" I L 5850 6000 60 
F26 "CH5_GND" I L 5850 6100 60 
F27 "CH6" I L 5850 6650 60 
F28 "CH6_GND" I L 5850 6750 60 
F29 "S0+_A" I L 5850 4050 60 
F30 "S0-_A" I L 5850 4150 60 
F31 "S0+_B" I L 5850 4300 60 
F32 "S0-_B" I L 5850 4400 60 
F33 "+B1" I R 9750 3300 60 
F34 "-A2_B2" I R 9750 3400 60 
F35 "+A1" I R 9750 3500 60 
$EndSheet
Text Notes 3150 8050 0    98   ~ 20
T7\n
Text Notes 3850 8050 0    98   ~ 20
T8\n
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5EAF0F4F
P 3000 6050
F 0 "SW1" V 2954 6180 50  0000 L CNN
F 1 "?" V 3045 6180 50  0000 L CNN
F 2 "" H 3000 6050 50  0001 C CNN
F 3 "~" H 3000 6050 50  0001 C CNN
	1    3000 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 5750 5850 5750
Wire Wire Line
	3950 5850 3950 6350
Wire Wire Line
	3950 6350 3000 6350
Wire Wire Line
	3950 5850 5850 5850
Wire Wire Line
	5850 3450 3800 3450
Wire Wire Line
	5850 3650 3800 3650
Wire Wire Line
	5850 3800 4600 3800
Wire Wire Line
	4600 3800 4600 950 
Connection ~ 4600 3800
Wire Wire Line
	4600 3800 3800 3800
Connection ~ 4600 950 
Wire Wire Line
	4600 950  13300 950 
Wire Wire Line
	3600 1100 3600 3400
Connection ~ 3600 1100
Wire Wire Line
	3600 1100 13150 1100
Wire Wire Line
	3450 1250 3450 3400
Connection ~ 3450 1250
Wire Wire Line
	3450 1250 6400 1250
Wire Wire Line
	9750 3300 9900 3300
Wire Wire Line
	9900 3300 9900 2850
Wire Wire Line
	9900 2850 6100 2850
Wire Wire Line
	6100 2850 6100 2300
Wire Wire Line
	9750 3400 10000 3400
Wire Wire Line
	10000 3400 10000 2750
Wire Wire Line
	10000 2750 6250 2750
Wire Wire Line
	6250 2750 6250 2300
Wire Wire Line
	9750 3500 10100 3500
Wire Wire Line
	10100 3500 10100 2650
Wire Wire Line
	10100 2650 6400 2650
Wire Wire Line
	6400 2650 6400 2300
Wire Wire Line
	5850 4400 4850 4400
Wire Wire Line
	5850 4300 4850 4300
Wire Wire Line
	5850 4150 4850 4150
Wire Wire Line
	5850 4050 4850 4050
Wire Notes Line
	3000 3200 3950 3200
Wire Notes Line
	3950 3200 3950 3900
Wire Notes Line
	3950 3900 3000 3900
Wire Notes Line
	3000 3900 3000 3200
Wire Notes Line
	5550 1750 7050 1750
Wire Notes Line
	7050 1750 7050 2450
Wire Notes Line
	7050 2450 5550 2450
Wire Notes Line
	5550 2450 5550 1750
Wire Notes Line
	14400 1950 15500 1950
Wire Notes Line
	15500 1950 15500 2500
Wire Notes Line
	15500 2500 14400 2500
Wire Notes Line
	14400 1950 14400 2500
Wire Notes Line
	14400 4200 14400 3700
Wire Notes Line
	14400 3700 15500 3700
Wire Notes Line
	15500 3700 15500 4200
Wire Notes Line
	14400 4200 15500 4200
Wire Notes Line
	14400 6250 14400 5750
Wire Notes Line
	14400 5750 15450 5750
Wire Notes Line
	15450 5750 15450 6250
Wire Notes Line
	15450 6250 14400 6250
Wire Notes Line
	14400 8300 14400 7750
Wire Notes Line
	14400 7750 15450 7750
Wire Notes Line
	15450 7750 15450 8300
Wire Notes Line
	15450 8300 14400 8300
$Comp
L Sensor_Temperature:PT1000 TH?
U 1 1 5EC941C1
P 2650 4200
F 0 "TH?" H 2748 4246 50  0000 L CNN
F 1 "PT1000" H 2748 4155 50  0000 L CNN
F 2 "" H 2650 4250 50  0001 C CNN
F 3 "https://www.heraeus.com/media/media/group/doc_group/products_1/hst/sot_to/de_15/to_92_d.pdf" H 2650 4250 50  0001 C CNN
	1    2650 4200
	0    1    1    0   
$EndComp
$Comp
L Sensor_Temperature:PT1000 TH?
U 1 1 5ECB93EB
P 2100 4200
F 0 "TH?" H 2198 4246 50  0000 L CNN
F 1 "PT1000" H 2198 4155 50  0000 L CNN
F 2 "" H 2100 4250 50  0001 C CNN
F 3 "https://www.heraeus.com/media/media/group/doc_group/products_1/hst/sot_to/de_15/to_92_d.pdf" H 2100 4250 50  0001 C CNN
	1    2100 4200
	0    1    1    0   
$EndComp
$Comp
L Sensor_Temperature:PT1000 TH?
U 1 1 5ECBF3A0
P 1600 4200
F 0 "TH?" H 1698 4246 50  0000 L CNN
F 1 "PT1000" H 1698 4155 50  0000 L CNN
F 2 "" H 1600 4250 50  0001 C CNN
F 3 "https://www.heraeus.com/media/media/group/doc_group/products_1/hst/sot_to/de_15/to_92_d.pdf" H 1600 4250 50  0001 C CNN
	1    1600 4200
	0    1    1    0   
$EndComp
$Comp
L Sensor_Temperature:PT1000 TH?
U 1 1 5ECCC84F
P 1050 4200
F 0 "TH?" H 1148 4246 50  0000 L CNN
F 1 "PT1000" H 1148 4155 50  0000 L CNN
F 2 "" H 1050 4250 50  0001 C CNN
F 3 "https://www.heraeus.com/media/media/group/doc_group/products_1/hst/sot_to/de_15/to_92_d.pdf" H 1050 4250 50  0001 C CNN
	1    1050 4200
	0    1    1    0   
$EndComp
$Comp
L Sensor_Temperature:PT1000 TH?
U 1 1 5ECD2592
P 3950 7450
F 0 "TH?" H 4048 7496 50  0000 L CNN
F 1 "PT1000" H 4048 7405 50  0000 L CNN
F 2 "" H 3950 7500 50  0001 C CNN
F 3 "https://www.heraeus.com/media/media/group/doc_group/products_1/hst/sot_to/de_15/to_92_d.pdf" H 3950 7500 50  0001 C CNN
	1    3950 7450
	0    1    1    0   
$EndComp
$Comp
L Sensor_Temperature:PT1000 TH?
U 1 1 5ECD8281
P 3250 7450
F 0 "TH?" H 3348 7496 50  0000 L CNN
F 1 "PT1000" H 3348 7405 50  0000 L CNN
F 2 "" H 3250 7500 50  0001 C CNN
F 3 "https://www.heraeus.com/media/media/group/doc_group/products_1/hst/sot_to/de_15/to_92_d.pdf" H 3250 7500 50  0001 C CNN
	1    3250 7450
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 6650 3100 7450
Wire Wire Line
	3100 6650 5850 6650
Wire Wire Line
	3400 6750 5850 6750
Wire Wire Line
	3400 6750 3400 7450
Wire Wire Line
	3800 7450 3800 6950
Wire Wire Line
	3800 6950 5850 6950
Wire Wire Line
	4100 7050 4100 7450
Wire Wire Line
	4100 7050 5850 7050
Wire Wire Line
	2800 4750 2800 4200
Wire Wire Line
	2800 4750 5850 4750
Wire Wire Line
	2500 4200 2500 4850
Wire Wire Line
	2500 4850 5850 4850
Wire Wire Line
	2250 5000 2250 4200
Wire Wire Line
	2250 5000 5850 5000
Wire Wire Line
	1950 4200 1950 5100
Wire Wire Line
	1950 5100 5850 5100
Wire Wire Line
	1750 5250 1750 4200
Wire Wire Line
	1750 5250 5850 5250
Wire Wire Line
	1450 4200 1450 5350
Wire Wire Line
	1450 5350 5850 5350
Wire Wire Line
	1200 5500 1200 4200
Wire Wire Line
	1200 5500 5850 5500
Wire Wire Line
	900  4200 900  5600
Wire Wire Line
	900  5600 5850 5600
Wire Notes Line
	7900 2450 7900 1750
Wire Notes Line
	7900 1750 9450 1750
Wire Notes Line
	9450 1750 9450 2450
Wire Notes Line
	9450 2450 7900 2450
Wire Bus Line
	2300 8600 6350 8600
$EndSCHEMATC
