.include "/home/dileep/m328Pdef.inc"

ldi r16,0b11111100
out DDRD,r16

ldi r16,0b00000001
out DDRD,r16

ldi r17,0b10010000
out PortD,r17

ldi r17,0b00000000
out portB,r17

start:
rjmp start
