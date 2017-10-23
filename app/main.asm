/*
 * lab1.asm
 *
 * This is a very simple demo program made for the course DA215A at
 * Malmö University. The purpose of this program is:
 *	-	To test if a program can be transferred to the ATmega32U4
 *		microcontroller.
 *	-	To provide a base for further programming in "Laboration 1".
 *
 * After a successful transfer of the program, while the program is
 * running, the embedded LED on the Arduino board should be turned on.
 * The LED is connected to the D13 pin (PORTC, bit 7).
 *
 * Author:	Mathias Beckius
 *
 * Date:	2014-11-05
 */

;==============================================================================
; Definitions of registers, etc. ("constants")
;==============================================================================
	.EQU RESET		= 0x0000
	.EQU PM_START	= 0x0056 ;0x0000-0x0056 are reserved for IRQ-vector tables

;==============================================================================
; Start of program
;==============================================================================
	.CSEG
	.ORG RESET
	RJMP init

	.ORG PM_START
	.INCLUDE "defines/m2560def.inc"
	.INCLUDE "delay.inc"
;==============================================================================
; Basic initializations of stack pointer, I/O pins, etc.
;==============================================================================
init:
	; Set stack pointer to point at the end of RAM.
	LDI R16, LOW(RAMEND)
	OUT SPL, R16
	LDI R16, HIGH(RAMEND)
	OUT SPH, R16
	; Initialize pins
	CALL init_pins
	; Jump to main part of program
	RJMP main

;==============================================================================
; Initialize I/O pins
;==============================================================================
init_pins:
	LDI R16, 0xFF
	OUT DDRC, R16
	RET

;==============================================================================
; Main part of program
;==============================================================================
main:
	LDI R17, 0xFF
	OUT PORTC, R17
	LDI R24, 250
	RCALL delay_ms

	LDI R17, 0x00
	OUT PORTC, R17
	LDI R24, 250
	RCALL delay_ms

	RJMP main			; 2 cycles







