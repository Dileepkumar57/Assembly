

.include "/home/dileep/m328Pdef.inc"

  ldi r16,0b11111100
  out DDRD,r16

  ldi r16,0b00000001
  out DDRB,r16

  ldi r17,0b11000000
  out PortD,r17
  
  ldi r17,0b00000000
  out PortB,r17
Start:
  rjmp Start
