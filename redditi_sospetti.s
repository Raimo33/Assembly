#Prova intermedia 2023

.data
arrayaddress: .word 0x1c

.text
lw t0, arrayaddress
li a0, 0 #numero di redditi sospetti

li s1, 64 #n
start_loop:
  beqz s1, end_loop  #if n == 0, end loop
  lbu t2, 0(t0)
  sltiu t2, t2, 15   # (*array < 15) ovvero 15000$
  add a0, a0, t2
  addi s1, s1, -1    #n--
  addi t0, t0, 1     #array++
  j start_loop
end_loop:
  mul a0, a0, 25     #si puo scomporre con 3 shift (2^4 + 2^3 + 2^0), ma la moltiplicazione e' gia' ben ottimizzata anche con algoritmo di booth
  srli a0, a0, 4
print:
  li a7, 1
  ecall