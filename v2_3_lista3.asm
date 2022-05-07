addi $t0, $zero, 5	#j = t0
addi $t1, $zero, 1	#s = t1
add $t2, $zero, $zero	#i = t2

for:	bge  $t2, $t0, fim
	add $t1, $t1, $t2
	addi $t2, $t2, 1
	j for
	
fim:	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	li $v0, 10
	syscall
