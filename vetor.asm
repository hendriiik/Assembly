.data
vetint:	.word	7 12 10 7 23 4 9 31 19 17
tam:	.word	10


.text
	la $t1, vetint # end base V[0] para o reg $t1
	
	lw $t2, 4($t1) # $t2 <- V[1]
	lw $t3, 8($t1) # $t3 <- V[2]
	sll $t3, $t3, 4 # $t3 <- $t3 * 16
	add $t4, $t2, $t3
	sw $t4, 0($t1) # V[0] <- $t4

	lw $t9, 0($t1)
	# imprimir um numero inteiro
	add $a0, $t9, $zero 	# carrega em $a0 o valor que deve ser impresso
	li $v0, 1 		# codigo 1 significa imprimir inteiro 
	syscall
	
	# Encerrar o programa.
	li   $v0, 10          # system call for exit
	syscall   
