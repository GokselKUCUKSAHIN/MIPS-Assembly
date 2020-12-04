fibo:
 addi $sp, $sp, -12 # Adjust stack for 3 byte push.
 sw $s0, 8($sp) # Push $s0 (For fibo(n - 1))
 sw $ra, 4($sp) # Push $ra (Return Address Register)
 sw $a0, 0($sp) # Push $a0 (First Argument Register)
 slti $t0, $a0, 1 # Check if n < 1
 # if $a0 < 1 then $t0 = 1 otherwise(n >= 1) $t0 = 0
 bne $t0, $zero, L0 # if n < 1 jump L0
 # n >= 1 region
 slti $t0, $a0, 3 # Check if n < 3
 # if $a0 < 3 then $t0 = 1 otherwise(n >= 3) $t0 = 0
 bne $t0, $zero, L1 # if n < 3 and n >= 1 jump L1
 # n >= 3 region
 # Recursive return
 # return fibo(n - 1) + fibo(n - 2);
 addi $a0, $a0, -1 # $a0 = $a0 - 1
 jal fibo # fibo(n - 1);
 addi $s0, $zero, $v0# $s0 holds result of fibo(n - 1)
 addi $a0, $a0, -1 # $a0 = $a0 - 1. $a0 holds already ($a0 - 1)
 jal fibo # fibo(n - 2);
 add $v0, $v0, $s0 # fibo(n - 1) + fibo(n - 2)
 j RETURN # jump to return
L0:
# return 0
 addi $v0, $zero, 0 # Set $v0 = 0
 j RETURN
L1:
# return 1
 addi $v0, $zero, 1 # Set $v0 = 1
 # j RETURN # No need for jump.
RETURN:
 lw $a0, 0($sp) # Return from jal:restore argument n
 lw $ra, 4($sp) # Restore the return address
 lw $s0, 8($sp) # Restore $s0
 addi $sp, $sp, 12 # Pop 3 item off stack
 jr $ra # Returns
