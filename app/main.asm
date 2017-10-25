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
	.INCLUDE "defines/m2560def.inc" ;NOTE: Must be included in all Assembler-projects
									;outside Atmel Studio
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
	OUT DDRB, R16
	RET

;==============================================================================
; Main part of program
;==============================================================================
main:
	LDI R17, 0xFF
	OUT PORTB, R17
	LDI R24, 100
	RCALL delay_ms

	LDI R17, 0x00
	OUT PORTB, R17
	LDI R24, 100
	RCALL delay_ms

	RJMP main			; 2 cycles







