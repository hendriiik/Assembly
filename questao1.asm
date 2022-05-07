.data:
msg: .asciiz "A soma dos inteiros entre 5 e 15 eh: "


.text:
addi $t1, $zero, 5	#t1 serah o numero atual a ser somado (comeca em 5)
add $t2, $t1, $zero	#t2 serah a soma total
addi $t7, $zero, 15	#t7 serah o limite da soma

loop: 	addi $t1, $t1, 1	#comeco do loop, soma 1 em t1 (proximo numero)
	add $t2, $t1, $t2	#adiciona o numero atual de t1 na soma
bne $t1, $t7, loop		#se t1 != 15, continua no loop

la $a0, msg		#imprime a string msg
li $v0, 4
syscall

add $a0, $t2, $zero 	# carrega em a0 a soma total
li $v0, 1		#imprime a soma na tela
syscall

li $v0, 10		#encerra o programa
syscall			
