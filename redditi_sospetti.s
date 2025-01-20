#Prova intermedia 2023

.data
arrayaddress: .word 0x1c

.text
lw t0, arrayaddress
li a0, 0 #numero di redditi sospetti

li s1, 64 #n
start_loop:
  beqz s1, end_loop       #if n == 0, end loop
  lb t2, 0(t0)
  sltiu t2, t2, 15000     # (array < 15000)
  add a0, a0, t2
  addi s1, s1, -1         #n--
  addi t0, t0, 1          #array++
  j start_loop
end_loop:
  add t0, a0, 0       #tmp
  slli t0, t0, 5      #res * 32
  slli a0, a0, 2      #res * 4
  add a0, a0, t0      #tot
print:
  li a7, 1
  ecall