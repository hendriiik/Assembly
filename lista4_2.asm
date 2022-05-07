.text

main:	addi $t0, $zero, 2	#x = t0
	addi $t1, $zero, 3	#y = t1
	addi $t2, $zero, 6	#z = t2
	
	add $a0, $t0, $zero	#a0 <- x
	
	mul $a1, $t0, $t2	#a1 <- x*y
	
	add $a2, $t0, $t1	#a2 <- x+y
	add $a2, $a2, $t2	#a2 <- x+y+z
	
	sub $a3, $t1, $t0	#a3 <- y-x
	add $a3, $a3, $t2	#a3 <- y-x+z
	
	jal f1			#chama a funcao
	
	
	add $a0, $v0, $zero	#imprime o resultado de f1
	li $v0, 1
	syscall
	
	li $v0, 10		#encerra o programa
	syscall
	
	
	
f1:	addi $t0, $zero, 2	#r = t0
	mul $t1, $t0, $a1	#t1 <- r*b
	add $t0, $t1, $a0	#t1 <- a+ r*b
	
	add $t0, $t0, $a2	#r <- r+c
	add $t0, $t0, $a3	#r<-r+c+d
	add $v0, $t0, $zero	#r sera devolvido
	jr $ra
	
	
