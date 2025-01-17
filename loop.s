#dato un indirizzo arr ed un numero di byte n (>=0), contare per quante volte succede che arr[i] == 00000000, con i <= n

.data
arr_address: .byte 0x00000000
n: .word 5


.text
lb t0 arr_address
lw s0 n

li t1, 0 #i
li a0, 0 #ret

loop:
    bgt t1, s0, stop #if i > n
    lbu t2, 0(t0) #t2 contiene arr[i]
    beq t2, zero, count #if t2 == 0
increment:
    addi t1, t1, 1 #incrementa i
    addi t0, t0, 1 #incrementa arr
    j loop    
count:
    addi a0, a0, 1
    j increment

stop:

print:
    li a7 1
    ecall
    
