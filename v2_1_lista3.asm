.text

addi $t0, $zero, 5	#inicio
addi $t1, $zero, 15	#fim
add $t2, $zero, $zero

for: 	add $t2, $t2, $t0	#soma=soma+t0
	addi $t0, $t0, 1
	ble $t0, $t1, for

	
li $v0, 1	
add $a0, $t2, $zero
syscall

li $v0, 10
syscall
	
	