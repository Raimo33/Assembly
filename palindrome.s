.data
headaddr: .word 1768
tailaddr: .word 1864

.text
lw t0, headaddr
lw t1, tailaddr

sub s0, t1, t0 #lunghezza stringa
srli s1, s0, 1 #n = lunghezza meta' stringa

loop_start:
  beqz s1, loop_end #while n > 0
  lb a0, 0(t0) #carico il carattere in testa
  lb a1, 0(t1) #carico il carattere in coda
  bneq a0, a1, not_palindrome #early exit se i caratteri sono diversi
  addi t0, t0, 1 #head++
  addi t1, t1, -1 #tail--
  addi s1, s2, -1 #n--
  j loop_start
loop_end:
  add a1, zero, s0 #stampo la lunghezza della stringa
  j print
not_palindrome:
  add a1, zero, -1 #stampo -1
print:
  li a7, 1
  ecall