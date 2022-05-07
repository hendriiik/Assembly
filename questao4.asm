.data:
msg_i: .asciiz "O valor final de i eh: "
msg_s: .asciiz "\nO valor final de s eh: "

.text:
addi $t1, $zero, -5	#i (t1) <- -5
addi $t2, $zero, 1	#s (t2) <- 1
addi $t3, $zero, 120	#t3 <- 120 (serah o registrador "limite")

WHILE: addi $t1, $t1, 1		#i <- i + 1
	add $t2, $t2, $t1	#s <- s + i
	slt $t4, $t2, $t3	#t4 <- se s < 120
	bne $t4, $zero, WHILE	#enquanto t4 for diferente de 0, continua

la $a0, msg_i		#imprime a string msg_i
li $v0, 4
syscall

add $a0, $t1, $zero 	# carrega em $a0 o valor final de i
li $v0, 1 		# imprime esse valor 
syscall
	
la $a0, msg_s		#imprime a string msg_s
li $v0, 4		
syscall 
	
add $a0, $t2, $zero	# carrega em $a0 o valor final de s
li $v0, 1		#imprime esse valor
syscall

li $v0, 10		# encerra o programa
syscall
 
