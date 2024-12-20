# dichiaro le variabili in memoria (memoria interna al processore ma esterna alla ALU)
.data

a: .word 10
b: .word -2
c: .word 23
d: .word 11
e: .word 3

# scrivo il programma che verra' caricato sul processore
.text

# carico le 5 variabili su 5 registri a mia scelta (MEMORIA -> REGISTRI)
lw s0, a
lw s1, b
lw s2, c
lw s3, d
lw s4, e

# ES_1: (a + b + c) * 8 + d - e

add  a0, s0, s1        #metto il risultato di a + b nel registro a0 (risultato parziale)
add  a0, a0, s2        #sommo c al risultato parziale e lo salvo in a0
slli a0, a0, 3         #shifto di 3 bit a sinistra per moltiplicare per 8 = 2^3
add  a0, a0, s3        #sommo c
sub  a0, a0, s4        #sottraggo e

# stampa a video (solo a scopo di debugging, solo in RIPES)
li a7, 1
ecall
