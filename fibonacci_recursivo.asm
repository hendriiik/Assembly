
.text
main:	li $v0, 5
	syscall

	add $a0, $zero, $v0
	addi $a1, $zero, 1
	jal fat
	add $s0, $v0, $zero
	
	add $a0, $v0, $zero
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	



fat:	#n = a0, i = a1
	bne $a1, $a0, continua
	add $v0, $a0, $zero
	jr $ra
	
continua:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	
	addi $a1, $a1, 1
	jal fat
	
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	addi $sp, $sp, 8
	
	mul $t0, $a1, $v0
	add $v0, $t0, $zero
	jr $ra
	
