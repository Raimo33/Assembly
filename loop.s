.data
  arg_j: .word 2
  arg_k: .word 5
  arrayaddress: .word 0x00000000

.text
lw t0, arrayaddress
li a0, 0 #indice dell'array
lw t1, arg_j
lw t2, arg_k

while:
  lbu s0, 0(t0) #dereferenzia il byte in posizione t0 + 0 e lo mette in s0 (zero extended), lb e' sign extended
  beq s0, t2, end
  add a0, a0, t1
  add t0, t0, t1
  j while
end:

print:
  li a7, 1
  ecall
    