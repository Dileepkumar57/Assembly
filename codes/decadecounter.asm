.include "/home/dileep/m328Pdef.inc"


  ldi r16 , 0b000000000 

  out SREG , r16
  ldi r16 , low(RAMEND)
  out SPL , r16
  ldi r16 , high(RAMEND)
  out SPH , r16 


  ldi r31, 0b00111100                   ;defining the pins 2,3,4,5
  out DDRD, r31                         ;declaring pins as output

  ldi r16, 0b00000001                   ;W           
  ldi r17, 0b00000000                   ;X
  ldi r18, 0b00000000                   ;Y
  ldi r19, 0b00000001                   ;Z   
  ldi r20, 0b00000001 


mainloop:  


  mov r21,r16
  eor r21,r20                           ; complementing W
  mov r22,r17
  eor r22,r20                           ; complementing X
  mov r23,r18
  eor r23,r20                           ; complementing Y
  mov r24,r19 
  eor r24,r20                           ; complementing Z

  mov r25,r16
  and r25,r22
  and r25,r24                     
  mov r26,r21
  and r26,r17
  or r26,r25                            ; logic for B in r26

  mov r25,r16
  and r25,r17
  and r25,r23
  mov r27,r22
  and r27,r18
  mov r28,r21
  and r28,r18
  or r27,r25
  or r27,r28                            ; logic for C in r27

  mov r25,r16
  and r25,r17
  and r25,r18

  mov r28,r21
  and r28,r19
  or r28,r25 
  mov r29,r28                           ; logic for D in r28

  lsl r28                               ; shifting the bit D by 1
  or r28,r27                            ; D or C
  lsl r28                               ; shifting the DC by 1 
  or r28,r26                            ; D or C or B
  lsl r28                               ; shifting the DCB by 1 
  or r28,r21                            ; D or C or B or A
  lsl r28
  lsl r28
  out PORTD, r28

  mov r16,r21
  mov r17,r26
  mov r18,r27
  mov r19,r29

  call wait

  rjmp mainloop

wait:
     push r16
     push r17
     push r18
     ldi r16,0x40
     ldi r17,0x00
     ldi r18,0x00

w0:
		dec r18
		brne w0
		dec r17
		brne w0
		dec r16
		brne w0
	  pop r18
	  pop r17
	  pop r16
	  ret 
