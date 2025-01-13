.data
  arg_c1:   .word 5
  arg_c2:   .word 5
  arg_op_1: .word 1
  arg_op_2: .word 5

.text
  lw s2, arg_c1
  lw s3, arg_c2
  lw s4, arg_op_1
  lw s5, arg_op_2

  if:
    bne s2, s3, else
    add a0, s4, s5
    j end
  else:
    sub a0, s4, s5
  end:

  print:
    li a7, 1
    ecall