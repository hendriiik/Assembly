.text

main: 	addi $a0, $zero, 3	#x = a0
	addi $a1, $zero, 5	#y = a1
	
	jal f1			#chama a funcao f1
	
	
	add $a0, $v0, $zero	#imprime o resultado da funcao f1
	li $v0, 1
	syscall
	
	li $v0, 10		#encerra o programa
	syscall
	

f1: 	addi $sp, $sp, -8	#aloca espaco na pilha para 2 var
	sw $ra, 0($sp)		#armazena ra na pilha
	sw $a0, 4($sp)		#armazena x na pilha
	jal f2			#chama f2, com a0 (x) como argumento
	
	add $t0, $v0, $zero	#salva em t0 o resultado de f2
	lw $ra 0($sp)		#recebe o valor antigo de ra
	lw $a0, 4($sp)		#recebe o valor antigo de x
	addi $sp, $sp, 8	#devolve o espaco alocado
	
	mul $a0, $a1, $a0	#x= x*y
	add $a0, $a0, $t0	#x=x+f2
	add $v0, $a0, $zero	#devolve x
	jr $ra			#retorna para ra
	
	 
f2:	addi $t0, $zero, 3	#t0 <- 3
	mul $a0, $a0, $t0	#x=x*3
	addi $a0, $a0, 2	#x=x+2
	add $v0, $a0, $zero	#devolve x
	jr $ra			#retorna para ra
	
