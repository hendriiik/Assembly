.data:
msg_i: .asciiz "O valor final de i eh: "
msg_j: .asciiz "\nO valor final de j eh: "
msg_s: .asciiz "\nO valor final de s eh: "

.text:

add $t1, $zero, $zero	#i (t1) <- 0
addi $t2, $zero, 5	#j (t2) <- 5
addi $t3, $zero, 1	#s (t3) <- 1

FOR:	add $t3, $t3, $t1	#s <- s + i
	addi $t1, $t1, 1	#i = i + 1
	slt $t4, $t1, $t2	#t4 <- se i < j
	bne $t4, $zero, FOR	#se i < j, continua no loop
	

la $a0, msg_i		#imprime a string msg_i
li $v0, 4
syscall	
			
add $a0, $t1, $zero 	# carrega em $a0 o valor final de i
li $v0, 1 		# imprime esse valor 
syscall
	
la $a0, msg_j		#imprime a string msg_j
li $v0, 4
syscall

add $a0, $t2, $zero	# carrega em $a0 o valor final de j
li $v0, 1		#imprime esse valor
syscall

la $a0, msg_s		#imprime a string msg_s
li $v0, 4
syscall

add $a0, $t3, $zero	# carrega em $a0 o valor final de s
li $v0, 1		#imprime esse valor
syscall
	
li   $v0, 10          	# encerra o programa
syscall   
