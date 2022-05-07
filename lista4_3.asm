.text

main:	addi $a0, $zero, -2	#a0 <- -2
	addi $a1, $zero, 3	#a1 <- 3
	addi $a2, $zero, 5	#a2 <- 5
	addi $a3, $zero, 7	#a3 <- 7
	
	jal f1			#chama a funcao f1
	
	add $a0, $v0, $zero	#imprime a saida de f1
	li $v0, 1
	syscall
	
	li $v0, 10		#encerra o programa
	syscall

	
f1:	addi $t0, $zero, 2	#r = t0
	mul $t0, $t0, $a1	#r <- r*b	
	add $t0, $t0, $a0	#r <- r + a
	add $t0, $t0, $a2	#r <- r+c
	add $t0, $t0, $a3	#r <- r +d

	addi $t1, $zero, 120	#t1 <- 120
	
	slt  $t2, $t1, $t0	#t2 <- se r< 120
	slt $t3, $t0, $zero	#t3 <- se r < 0
	
	or $t4, $t2, $t3	#t4 <- t2 ou t3
	
	beq $t4, $zero, continua #se t4 for falso, continua no loop
				 #se t4 for verdadeiro, sai da funcao
	add $v0, $t0, $zero	#devolve r
	jr $ra			#volta para onde a funcao foi chamada
	

continua:	addi $sp, $sp, -20	#aloca 5 espacos na pilha
		sw $ra, 0($sp)		#armazena o ra atual
		sw $t0, 4($sp)		#armazena o r atual
		sw $a1, 8($sp)		#armazena o b atual
		sw $a2, 12($sp)		#armazena o c atual
		sw $a3, 16($sp)		#armazena o d atual
		
		sub $a1, $t0, $a1	#b <- r-b
		sub $a2, $t0, $a2	#c <- r-c
		sub $a3, $t0, $a3	#d <- r-d
		
		jal f1			#chama a funcao f1 novamente
		
		lw $ra, 0($sp)		#carrega as variaveis alocadas na pilha
		lw $t0, 4($sp)
		lw $a1, 8($sp)	
		lw $a2, 12($sp)		
		lw $a3, 16($sp)
		
		addi $sp, $sp, 20	#remove o espaco alocado na pilha
		
		jr $ra			#volta para onde a funcao foi chamada

	
	
	
	
