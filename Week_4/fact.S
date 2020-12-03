fact:
  addi $sp, $sp, -8    # adjust stack for 2 times
  sw	 $ra, 4($sp)     # save the return address
  sw   $a0, 0($sp)     # save the argument n 

  slti $t0, $a0, 1     # test for n < 1
  beq	 $t0, $zero, L1	# if $t0 == zero L1

  addi $v0, $zero, 1   # return 1
  addi $sp, $sp, 8     # pop 2 items off stack
  jr	 $ra             # return to after jal

L1: 
  addi $a0, $a0, -1    # n >= 1: argument gets (n - 1)
  jal  fact            # call fact with (n - 1)

  lw		$a0, 0($sp)     # return from jal:restore argument n 
  lw		$ra, 4($sp)     # restore the return address
  addi  $sp, $sp, 8     # adjust stack point to pop 2 item

  mul   $v0, $a0, $v0   # return n * fact(n - 1)

  jr $ra
