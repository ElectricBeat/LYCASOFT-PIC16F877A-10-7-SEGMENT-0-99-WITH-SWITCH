opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 4 "E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
	dw 0X3F3A ;#
	FNCALL	_main,_Segment_Runner
	FNCALL	_Segment_Runner,___awmod
	FNCALL	_Segment_Runner,___awdiv
	FNROOT	_main
	global	_Data
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
	line	6

;initializer for _Data
	retlw	0C0h
	retlw	0F9h
	retlw	0A4h
	retlw	0B0h
	retlw	099h
	retlw	092h
	retlw	082h
	retlw	0F8h
	retlw	080h
	retlw	090h
	global	_Count
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"7 SEGMENT 0-99 WITH SWITCH.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_Count:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
_Data:
       ds      10

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+10)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Segment_Runner
?_Segment_Runner:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	??_Segment_Runner
??_Segment_Runner:	; 0 bytes @ 0x9
	ds	2
	global	Segment_Runner@Disp1_Data
Segment_Runner@Disp1_Data:	; 1 bytes @ 0xB
	ds	1
	global	Segment_Runner@Disp2_Data
Segment_Runner@Disp2_Data:	; 1 bytes @ 0xC
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xD
;;Data sizes: Strings 0, constant 0, data 10, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      13
;; BANK0           80      0      12
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_Segment_Runner
;;   _Segment_Runner->___awdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     642
;;                     _Segment_Runner
;; ---------------------------------------------------------------------------------
;; (1) _Segment_Runner                                       6     6      0     642
;;                                              9 COMMON     4     4      0
;;                            ___awmod
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Segment_Runner
;;     ___awmod
;;     ___awdiv
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1B      12        0.0%
;;ABS                  0      0      19       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      0       C       5       15.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      D       D       1       92.9%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 38 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Segment_Runner
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
	line	38
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	39
	
l2769:	
;7 SEGMENT 0-99 WITH SWITCH.c: 39: TRISB=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	40
;7 SEGMENT 0-99 WITH SWITCH.c: 40: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	41
	
l2771:	
;7 SEGMENT 0-99 WITH SWITCH.c: 41: TRISC=0X04;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	42
	
l2773:	
;7 SEGMENT 0-99 WITH SWITCH.c: 42: PORTC=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	goto	l695
	line	44
;7 SEGMENT 0-99 WITH SWITCH.c: 44: while(1)
	
l694:	
	line	46
;7 SEGMENT 0-99 WITH SWITCH.c: 45: {
;7 SEGMENT 0-99 WITH SWITCH.c: 46: while(RC2==1)
	goto	l695
	
l696:	
	line	48
	
l2775:	
;7 SEGMENT 0-99 WITH SWITCH.c: 47: {
;7 SEGMENT 0-99 WITH SWITCH.c: 48: Count++;
	movlw	low(01h)
	addwf	(_Count),f
	skipnc
	incf	(_Count+1),f
	movlw	high(01h)
	addwf	(_Count+1),f
	line	49
	
l2777:	
;7 SEGMENT 0-99 WITH SWITCH.c: 49: if(Count>=100)
	movf	(_Count+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2445
	movlw	low(064h)
	subwf	(_Count),w
u2445:

	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l698
u2440:
	line	51
	
l2779:	
;7 SEGMENT 0-99 WITH SWITCH.c: 50: {
;7 SEGMENT 0-99 WITH SWITCH.c: 51: Count=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_Count)
	clrf	(_Count+1)
	goto	l698
	line	52
	
l697:	
	line	53
;7 SEGMENT 0-99 WITH SWITCH.c: 52: }
;7 SEGMENT 0-99 WITH SWITCH.c: 53: while(RC2==1);
	goto	l698
	
l699:	
	
l698:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(58/8),(58)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l698
u2450:
	goto	l695
	
l700:	
	line	54
	
l695:	
	line	46
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(58/8),(58)&7
	goto	u2461
	goto	u2460
u2461:
	goto	l2775
u2460:
	goto	l2781
	
l701:	
	line	55
	
l2781:	
;7 SEGMENT 0-99 WITH SWITCH.c: 54: }
;7 SEGMENT 0-99 WITH SWITCH.c: 55: Segment_Runner();
	fcall	_Segment_Runner
	goto	l695
	line	56
	
l702:	
	line	44
	goto	l695
	
l703:	
	line	57
	
l704:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Segment_Runner
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _Segment_Runner *****************
;; Defined at:
;;		line 19 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Temp_Data       2    0        int 
;;  Disp2_Data      1   12[COMMON] unsigned char 
;;  Disp1_Data      1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awmod
;;		___awdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text129
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\10-7 SEGMENT 0-99 WITH SWITCH       XXX\CODE\7 SEGMENT 0-99 WITH SWITCH.c"
	line	19
	global	__size_of_Segment_Runner
	__size_of_Segment_Runner	equ	__end_of_Segment_Runner-_Segment_Runner
	
_Segment_Runner:	
	opt	stack 6
; Regs used in _Segment_Runner: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	23
	
l2751:	
;7 SEGMENT 0-99 WITH SWITCH.c: 20: char Disp1_Data,Disp2_Data;
;7 SEGMENT 0-99 WITH SWITCH.c: 21: int Temp_Data;
;7 SEGMENT 0-99 WITH SWITCH.c: 23: Disp1_Data = Count%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Count+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(_Count),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(??_Segment_Runner+0)+0
	movf	(??_Segment_Runner+0)+0,w
	movwf	(Segment_Runner@Disp1_Data)
	line	24
;7 SEGMENT 0-99 WITH SWITCH.c: 24: Disp2_Data = Count/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Count+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_Count),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	movwf	(??_Segment_Runner+0)+0
	movf	(??_Segment_Runner+0)+0,w
	movwf	(Segment_Runner@Disp2_Data)
	line	26
	
l2753:	
;7 SEGMENT 0-99 WITH SWITCH.c: 26: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	27
	
l2755:	
;7 SEGMENT 0-99 WITH SWITCH.c: 27: PORTB = Data[Disp2_Data];
	movf	(Segment_Runner@Disp2_Data),w
	addlw	_Data&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(6)	;volatile
	line	28
	
l2757:	
;7 SEGMENT 0-99 WITH SWITCH.c: 28: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_Segment_Runner+0)+0+1),f
	movlw	238
movwf	((??_Segment_Runner+0)+0),f
u2477:
	decfsz	((??_Segment_Runner+0)+0),f
	goto	u2477
	decfsz	((??_Segment_Runner+0)+0+1),f
	goto	u2477
	clrwdt
opt asmopt_on

	line	29
	
l2759:	
;7 SEGMENT 0-99 WITH SWITCH.c: 29: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	31
	
l2761:	
;7 SEGMENT 0-99 WITH SWITCH.c: 31: RC1 = 1;
	bsf	(57/8),(57)&7
	line	32
	
l2763:	
;7 SEGMENT 0-99 WITH SWITCH.c: 32: PORTB = Data[Disp1_Data];
	movf	(Segment_Runner@Disp1_Data),w
	addlw	_Data&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(6)	;volatile
	line	33
	
l2765:	
;7 SEGMENT 0-99 WITH SWITCH.c: 33: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_Segment_Runner+0)+0+1),f
	movlw	238
movwf	((??_Segment_Runner+0)+0),f
u2487:
	decfsz	((??_Segment_Runner+0)+0),f
	goto	u2487
	decfsz	((??_Segment_Runner+0)+0+1),f
	goto	u2487
	clrwdt
opt asmopt_on

	line	34
	
l2767:	
;7 SEGMENT 0-99 WITH SWITCH.c: 34: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	35
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_Segment_Runner
	__end_of_Segment_Runner:
;; =============== function _Segment_Runner ends ============

	signat	_Segment_Runner,88
	global	___awmod
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Segment_Runner
;; This function uses a non-reentrant model
;;
psect	text130
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2717:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2351
	goto	u2350
u2351:
	goto	l2721
u2350:
	line	10
	
l2719:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2721
	line	12
	
l1595:	
	line	13
	
l2721:	
	btfss	(___awmod@divisor+1),7
	goto	u2361
	goto	u2360
u2361:
	goto	l2725
u2360:
	line	14
	
l2723:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2725
	
l1596:	
	line	15
	
l2725:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2371
	goto	u2370
u2371:
	goto	l2743
u2370:
	line	16
	
l2727:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2733
	
l1599:	
	line	18
	
l2729:	
	movlw	01h
	
u2385:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2385
	line	19
	
l2731:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2733
	line	20
	
l1598:	
	line	17
	
l2733:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l2729
u2390:
	goto	l2735
	
l1600:	
	goto	l2735
	line	21
	
l1601:	
	line	22
	
l2735:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2405
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2405:
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l2739
u2400:
	line	23
	
l2737:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2739
	
l1602:	
	line	24
	
l2739:	
	movlw	01h
	
u2415:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2415
	line	25
	
l2741:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2421
	goto	u2420
u2421:
	goto	l2735
u2420:
	goto	l2743
	
l1603:	
	goto	l2743
	line	26
	
l1597:	
	line	27
	
l2743:	
	movf	(___awmod@sign),w
	skipz
	goto	u2430
	goto	l2747
u2430:
	line	28
	
l2745:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2747
	
l1604:	
	line	29
	
l2747:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1605
	
l2749:	
	line	30
	
l1605:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Segment_Runner
;; This function uses a non-reentrant model
;;
psect	text131
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2677:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2251
	goto	u2250
u2251:
	goto	l2681
u2250:
	line	11
	
l2679:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2681
	line	13
	
l1527:	
	line	14
	
l2681:	
	btfss	(___awdiv@dividend+1),7
	goto	u2261
	goto	u2260
u2261:
	goto	l2687
u2260:
	line	15
	
l2683:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2685:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2687
	line	17
	
l1528:	
	line	18
	
l2687:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2689:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2271
	goto	u2270
u2271:
	goto	l2709
u2270:
	line	20
	
l2691:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2697
	
l1531:	
	line	22
	
l2693:	
	movlw	01h
	
u2285:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2285
	line	23
	
l2695:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2697
	line	24
	
l1530:	
	line	21
	
l2697:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l2693
u2290:
	goto	l2699
	
l1532:	
	goto	l2699
	line	25
	
l1533:	
	line	26
	
l2699:	
	movlw	01h
	
u2305:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2305
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2315
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2315:
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l2705
u2310:
	line	28
	
l2701:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2703:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2705
	line	30
	
l1534:	
	line	31
	
l2705:	
	movlw	01h
	
u2325:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2325
	line	32
	
l2707:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2331
	goto	u2330
u2331:
	goto	l2699
u2330:
	goto	l2709
	
l1535:	
	goto	l2709
	line	33
	
l1529:	
	line	34
	
l2709:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2340
	goto	l2713
u2340:
	line	35
	
l2711:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2713
	
l1536:	
	line	36
	
l2713:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1537
	
l2715:	
	line	37
	
l1537:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
