;simplify the following functions and impliment them with two level NAND gate circuits
;F(A,B,C,D)=AC'D' + A'C + ABC + AB'C + A'C'D'

;CODE:
.include "/home/dileep/m328Pdef.inc"


  ldi r16 , 0b000000000 

  out SREG , r16
  ldi r16 , low(RAMEND)
  out SPL , r16
  ldi r16 , high(RAMEND)
  out SPH , r16 


  ldi r31, 0b00111100                   ;defining the pins 2,3,4,5
  out DDRD, r31                         ;declaring pins as output

  ldi r16, 0b00000001     ;W                            
  ldi r17, 0b00000000     ;X            
  ldi r18, 0b00000000     ;Y              
  ldi r19, 0b00000001     ;Z            
  ldi r20, 0b00000001 


  mov r21,r16
  eor r21,r20 
                            ; complementing W
  mov r22,r17
  eor r22,r20
                             ; complementing X
  mov r23,r18
  eor r23,r20
                             ; complementing Y
  mov r24,r19 
  eor r24,r20
                             ; complementing Z

  and r23,r24
  or r23,r18
  
  mov r16,r23 

  
  lsl r16
  lsl r16
  
  out PORTD,r16
  Start:
  rjmp Start
