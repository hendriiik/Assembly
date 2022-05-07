.data:
recebe_i: .asciiz "Insira o valor de i: "
recebe_j: .asciiz "Insira o valor de j: "
imprime_i: .asciiz "O valor final de i eh: "
imprime_j: .asciiz "\nO valor final de j eh: "

.text:

la $a0, recebe_i	#avisa para o usuario que ele deve digitar i
li $v0, 4
syscall

li $v0, 5		#le o valor de i
syscall
add $t1, $zero, $v0	#t1 <- i


la $a0, recebe_j	#avisa para o usuario que ele deve digitar j
li $v0, 4
syscall

li $v0, 5		#le o valor de j
syscall
add $t2, $zero, $v0	#t2 <- j


slt $t3, $t1, $t2	#t3 recebe se t1 < t2 (i<j)
bne $t3, $zero, IF	#se t3 for diferente de zero (1), vai para o IF
beq $t3, $zero, ELSE	#se t3 for falso, desvia para o ELSE

IF: 	addi $t4, $zero, 8	#t4 <- 8
	sll $t5, $t1, 1		#t5 <- i*2
	add $t2, $t4, $t5	#j<- 8 + i*2
	j FIM			#pula para FIM, para desviar do ELSE

ELSE:	addi $t4, $zero, 12	#t4 <- 12
	sll $t5, $t1, 3		#t5 <- i*8
	addi $t6, $zero, 6	#t6 <- 6
	mul $t7, $t2, $t6	#t7 <- j*6
	add $t8, $t4, $t5	#t8 <- 12 + i*8
	add $t2, $t8, $t7	#j <- t7 + j*6

FIM:	la $a0, imprime_i	#imprime a string imprime_i
	li $v0, 4
	syscall
	
	add $a0, $t1, $zero 	# carrega em $a0 o valor final de i
	li $v0, 1 		# imprime esse valor 
	syscall
	
	la $a0, imprime_j	#imprime a string imprime_j
	li $v0, 4
	syscall 
	
	add $a0, $t2, $zero	# carrega em $a0 o valor final de j
	li $v0, 1		#imprime esse valor
	syscall
	
	li   $v0, 10          	# encerra o programa
	syscall   
 
