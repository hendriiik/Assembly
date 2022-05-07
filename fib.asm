# define TAM 10
# int fib[TAM];
# fib[0] = 1;
# fib[1] = 1;
# for(i=2; i<TAM; i++){
# fib[2] = fib[1] + fib[0];
# fib++;
# }

.data
fib: .word 0:10 # fib[10] = {0,0,0,0,0,0,0,0,0,0}
TAM: .word 10
.text
la $t0, TAM
lw $t0, 0($t0)

la $t1, fib

addi $t2, $zero, 1
sw $t2, 0($t1) # fib[0] = 1
sw $t2, 4($t1) # fib[1] = 1

addi $t2, $zero, 2 # t2 --> i; t2 = 2
for:
bge $t2, $t0, fimFOR

lw $t3, 0($t1) # FIB[2]
lw $t4, 4($t1) # FIB[3]
add $t5, $t3, $t4 # $t5 = FIB[2]+FIB[3]
sw $t5, 8($t1)# FIB[4] = $t5

addi $t1, $t1, 4 # FIB -> &FIB[2]

addi $t2, $t2, 1 # t2 --> i; t2++
j for
fimFOR:
li $v0, 10
syscall
