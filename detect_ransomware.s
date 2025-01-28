.data
arrayaddress: .word 1600

.text
lw t0, arrayaddress

li t1, 20 #n = 20, non uso i per risparmiare un registro
start_loop:
  beqz t1, end_loop
  lb a0, 0(t0)
  xori s1, a0, 4 #se a0 = 4, s1 = 0 altrimenti qualsiasi altro valore
  sltiu s1, s1, 1 #inverto il risultato
  add s0, s0, s1
  addi t0, t0, 1 #arr++
  addi t1, t1, -1 #n--
  j start_loop
end_loop:
  slt s0, s0, 3 #se ho trovato meno di 3 '4' allora s0 = 1
  xori s0, s0, 1 #inverto il bit 