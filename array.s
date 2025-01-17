#dato un indirizzo arr ed un numero di byte n (>=0), contare per quante volte succede che arr[i] == 00000000, con i <= n

.data
arr_address: .byte 0x00000000
n: .word 3


.text
lb t0 arr_address
lw s0 n

li t1, 0 #i
li t3, 0 #tmp
li a0, 0 #ret

loop:
    bgt t1, s0, stop #if i > n
    lbu t2, 0(t0) #t2 contiene arr[i]
    slti t3, t2, 1 #se e' minore di 1 e' per forza 0
    add a0, a0, t3 #aggiungo al ret +1 o 0 a seconda se t3 == 1 o 0
    addi t1, t1, 1 #incrementa i
    addi t0, t0, 1 #incrementa arr
    j loop

stop:

print:
    li a7 1
    ecall
    
