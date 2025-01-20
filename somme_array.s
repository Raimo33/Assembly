.data
arrayaddress: .word 0x00000000
arg_n: .word 42

.text
lw a0, arrayaddress
lw a2, arg_n

li s0, 0 #somma pari
li t0, 0 #i
loop1_start:
  bge t0, a2, loop1_end     #if i > n
  slli t1, t0, 2            #t1 = i*4
  add t1, a0, t1            #t1 = base_addr + (i*4)
  lw t3, 0(t1)              #carico in t3 il valore che sta nell'inidirizzo contenuto in t1
  add s0, s0, t3            #aggiungo il valore di t3 alla somma
  addi t0, t0, 2
  j loop1_start
loop1_end:

li s1, 0 #somma dispari
li t0, 1 #i
loop2_start:
  bge t0, a2, loop2_end
  slli t1, t0, 2
  add t1, a0, t1
  lw t3, 0(t1)
  add s1, s1, t3
  addi t0, t0, 2
  j loop2_start
loop2_end:
    
print:
  li a7, 1
  addi a0, s0, 0
  ecall