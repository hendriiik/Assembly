.text

main:	addi $t0, $zero, 2	#x = t0
	addi $t1, $zero, 3	#y= t1
	addi $t2, $zero, 4	#z= t2
	addi $t3, $zero, 38	#w= t3
	
	add $a0, $t0, $zero	#a0 <- x
	add $a1, $t1, $zero	#a1 <- y
	add $a2, $t0, $t1	#a2 <- x+y
	sub $a2, $a2, 2		#a2 <- x+y-2
	add $a3, $t2, $t3	#a3 <- z + w
	sub $a3, $a3, $t1	#a3 <- z + w - y
	
	jal fun			#entra na funcao
	
	add $a0, $v0, $zero	#imprime a saida da funcao
	li $v0, 1
	syscall
	
	li $v0, 10		#encerra o programa
	syscall
	
	
	
fun:	bgt $a0, $a1, if	#se x>y vai para o if
				#senao vai para o else

else:	sll $t0, $a3, 2		#t0 <- d*4
	add $a2, $t0, $a1	#c <- 4*d + b
	j fim			#sai do else

if:	sll $t0, $a3, 1		#t0 <- d*2
	add $a2, $t0, $a0	# c <- d*2 + a
	j fim			#sai do if
	
fim:	mul $a2, $a2, $a3	#c <- c*d
	add $a2, $a2, 8		#c <- c*d + 8
	
	add $v0, $a2, $zero	#devolve c
	jr $ra			#volta para onde a funcao foi chamada
