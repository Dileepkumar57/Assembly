.include "/home/dileep/m328Pdef.inc"

	ldi r16, 0b00111100 ;identifying output pins 2,3,4,5
	out DDRD,r16		;declaring pins as output
	ldi r16,0b00010000	;loading the number 5 in binary
	out PORTD,r16		;writing output to pins 2,3,4,5
	
Start:
	rjmp Start