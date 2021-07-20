#include inicio.asm

counter .equ $08
countercant .equ $09
countersuma .equ $0a
resultado .equ $0b
num1 .equ $0c

inicio: mov p0, #0ffh
        mov p1, #0ffh
        mov p2, #0ffh
        mov p3, #0ffh
        mov sp, #5fh
        mov counter ,#00h
        mov countercant ,#00h
        mov resultado ,#00h
        mov countersuma, #00
        mov num1, #00h
        mov r0, #00h
        mov r1, #00h
        mov r2, #00h
        mov r3, #00h
        mov r5, #00h
        ljmp iniciouno

iniciouno: mov a, p0
           mov r5, a

           cjne a, #00h, iniciounob
           ljmp iniciouno

iniciounob:     inc counter
                ljmp iniciodos
                

iniciodos: mov p1, r5
           mov a, countercant
           cjne a, #00h, iniciotres
           inc countercant
           clr c
           mov r1, r5
           mov a, r1
           mov dptr , #tablap
           movc a, @ a + dptr
           mov r2, a
           mov p2, a
           ljmp suma

tablap:  .byte $0
         .byte $3
         .byte $7
         .byte $a
         .byte $c
         .byte $e
         .byte $12
         .byte $15
         .byte $16
         .byte $14
         .byte $f
         .byte $d
         .byte $c
         .byte $a
         .byte $9
         .byte $7

iniciotres: mov a, r1 
            cjne a, r5, iniciotresb
            ljmp retornoporigual

iniciotresb:  mov r0, r1
              mov r1, r5
              mov r3, #00h
              ljmp tablas

retornoporigual:   ljmp iniciouno

tablas:  mov a, r0
         cjne a, #01h, dos
         lcall leertab1

dos: mov a, r0
     cjne a, #02h, tres
     lcall leertab2

tres: mov a, r0
     cjne a, #03h, cuatro
     lcall leertab3

cuatro: mov a, r0
        cjne a, #04h, cinco
        lcall leertab4

cinco: mov a, r0
     cjne a, #05h, seis
     lcall leertab5

seis: mov a, r0
     cjne a, #06h, siete
     lcall leertab6

siete: mov a, r0
     cjne a, #07h, ocho
     lcall leertab7

ocho: mov a, r0
     cjne a, #08h, nueve
     lcall leertab8

nueve: mov a, r0
     cjne a, #09h, diez
     lcall leertab9

diez: mov a, r0
     cjne a, #0ah, once
     lcall leertab10

once: mov a, r0
     cjne a, #0bh, doce
     lcall leertab11

doce: mov a, r0
     cjne a, #0ch, trece
     lcall leertab12

trece: mov a, r0
     cjne a, #0dh, catorce
     lcall leertab13

catorce: mov a, r0
     cjne a, #0eh, quince
     lcall leertab14

quince: lcall leertab15

leertab1: clr c
          mov a, r1
          mov dptr, #tabla1
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab2: clr c
          mov a, r1
          mov dptr, #tabla2
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab3: clr c
          mov a, r1
          mov dptr, #tabla3
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab4: clr c
          mov a, r1
          mov dptr, #tabla4
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab5: clr c
          mov a, r1
          mov dptr, #tabla5
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab6: clr c
          mov a, r1
          mov dptr, #tabla6
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab7: clr c
          mov a, r1
          mov dptr, #tabla7
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab8: clr c
          mov a, r1
          mov dptr, #tabla8
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab9: clr c
          mov a, r1
          mov dptr, #tabla9
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab10: clr c
          mov a, r1
          mov dptr, #tabla10
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab11: clr c
          mov a, r1
          mov dptr, #tabla11
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab12: clr c
          mov a, r1
          mov dptr, #tabla12
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab13: clr c
          mov a, r1
          mov dptr, #tabla13
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab14: clr c
          mov a, r1
          mov dptr, #tabla14
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

leertab15: clr c
          mov a, r1
          mov dptr, #tabla15
          movc a, @ a + dptr
          mov r3, a
          ljmp suma

suma: inc countersuma
      mov a, countercant
      cjne a, #01h, sumb
      mov resultado, r2
      mov r3, #00h
      mov p2, r2
      lcall seg
      inc countercant
      ljmp sumb

sumb: mov a, resultado
      add a, r3
      mov resultado, a
     mov p2, resultado
      mov a, countersuma
      cjne a, #15, retorno
      ljmp vista

retorno: ljmp iniciouno

vista: mov a, resultado
       mov num1, #38h
       clr c     
       subb a, num1
       jz mostrara
       jc mostrare
       ljmp aa
    

aa: mov a, resultado
    mov num1, #40h
    clr c
    subb a, num1
    jz mostrarb
    jc mostrarb
    ljmp bb

   

bb: mov a, resultado
   mov num1, #49h
   clr c
   subb a, num1
   jc mostrarb
   jz mostrarc
   ljmp cc

   mov p3, #38h
   ljmp fin

cc: mov a, resultado
   mov num1, #5dh
   clr c
   subb a, num1
   jc mostrarc
   jz mostrard
   ljmp mostrard


fin: ljmp fin

mostrara: mov p3, #77h
          ljmp fin

mostrarb: mov p3, #7ch
          ljmp fin
          
mostrarc: mov p3, #39h
          ljmp fin

mostrard: mov p3, #5eh
          ljmp fin

mostrare: mov p3, #79h     ; error
          ljmp fin


tabla1:  .byte $0
         .byte $0
         .byte $3
         .byte $7
         .byte $9
         .byte $c
         .byte $10
         .byte $13
         .byte $15
         .byte $14
         .byte $10
         .byte $f
         .byte $e
         .byte $c
         .byte $b
         .byte $a
     
tabla2:  .byte $0
         .byte $0
         .byte $0
         .byte $4
         .byte $6
         .byte $9
         .byte $d
         .byte $12
         .byte $14
         .byte $14
         .byte $12
         .byte $11
         .byte $10
         .byte $f
         .byte $e
         .byte $d

tabla3:  .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $3
         .byte $6
         .byte $10
         .byte $f
         .byte $12
         .byte $13
         .byte $12
         .byte $12
         .byte $11
         .byte $11
         .byte $10
         .byte $f

tabla4:  .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $3
         .byte $8
         .byte $c
         .byte $11
         .byte $12
         .byte $12
         .byte $12
         .byte $12
         .byte $11
         .byte $11
         .byte $11

tabla5:  .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $5
         .byte $11
         .byte $15
         .byte $11
         .byte $11
         .byte $12
         .byte $12
         .byte $13
         .byte $13
         .byte $12
        
tabla6:  .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $6
         .byte $b
         .byte $e
         .byte $11
         .byte $12
         .byte $13
         .byte $14
         .byte $14
         .byte $15

tabla7:  .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $5
         .byte $a
         .byte $f
         .byte $11
         .byte $12
         .byte $14
         .byte $15
         .byte $16

tabla8:  .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $5
         .byte $b
         .byte $e
         .byte $10
         .byte $12
         .byte $14
         .byte $15

tabla9:  .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $0
         .byte $7
         .byte $a
         .byte $c
         .byte $e
         .byte $10
         .byte $12

tabla10:  .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $3
          .byte $5
          .byte $8
          .byte $a
          .byte $c

tabla11:  .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $2
          .byte $5
          .byte $7
          .byte $9

tabla12:  .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $3
          .byte $5
          .byte $7

tabla13:  .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $2
          .byte $4

tabla14:  .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $2


tabla15:  .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0
          .byte $0

.end


















