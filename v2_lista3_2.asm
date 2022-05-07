addi $t0, $zero, 2
addi $t1, $zero, 1

blt $t0, $t1, if

else:	sll $t0, $t0, 3
	mul $t1, $t1, 6
	add $t1, $t0, $t1
	addi $t1, $t1, 12
	j fim

if:	sll $t0, $t0, 1
	addi $t1, $t0, 8
	
fim:	li $v0, 1
	add $a0, $t1, $zero
	syscall

	li $v0, 10
	syscall