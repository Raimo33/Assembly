#dato un indirizzo arr ed un numero di parole n (>=0), contare per quante volte succede che arr[i] < arr[i+1], con i <= n interpretando la parola puntata da arr[i] come binario puro

.data
arr_address: .word 0x00000000
n: .word 5

.text
lw t0, arr_address #t0 contiene il valore di arr
lw s0, n

li a0, 0 #ret

loop:
  ble s0, zero, end #se n <= 0, break
  lw t2, 0(t0) #carica arr[i] in t2 (NOTA: carica tutti i 4 byte perche' e' lw, non lb)
  lw t3, 4(t0) #carica arr[i+1] in t3 (idem. lw != lb)
  sltu a1, t2, t3
  add a0, a0, a1 #incrementa ret se arr[i] < arr[i+1]
  addi t0, t0, 4 #arr++
  addi s0, s0, -1 #n--
  j loop
end:

print:
  li a7, 1
  ecall