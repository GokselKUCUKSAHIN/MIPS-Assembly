ADDI $s0, $zero, 10
ADDI $t7, $zero, 1
LOOP:
	BEQ $s0, $zero, EX
    SUB $s0, $s0, $t7
    J LOOP
EX:
	ADDI $t0, $zero, 42
