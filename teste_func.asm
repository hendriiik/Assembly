.data

.text

main:	addi $a1, $zero, 500
	addi $a2, $zero, 100
	
	jal soma
	li $v0, 1
	add $a0, $v1, $zero
	syscall
	
	li $v0, 10
	syscall
	

soma:	add $v1, $a1, $a2
	jr $ra
