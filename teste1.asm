#    int total_teste1 = 0; // Contar quantas vezes realizou o teste
#    int contagem_t1 = 0; // Contar quantas delas entrou realmente no if / while

#    for (int i = 0; i < 100; i++) {
#        if (i mod 2 == 0) // Entra no if se par
#            contagem_t1++;
#        total_teste1++;
#    }	

.text
		
              add $t0, $zero, $zero # i
              addi $t1, $zero, 100 # registrador com conteúdo = 100 para comparar no loop
              addi $t2, $zero, 2 # registrador com conteúdo = 2 para fazer mod
              add $t3, $zero, $zero # Contagem de quantas vezes realizou teste inicia em 0
              add $t4, $zero, $zero # Contagem de quantas vezes entrou no if/ while inicia em 0
          
for:          addi $t4, $zero, 1 # total_teste++
              div $t0, $t2 # divide i por 2 
              mfhi $t6 # pega resto da divisão (mod)
              beq $t6, 0, if # if mod 2 == 0 (for par)
              j nao_entra_if
if:           addi $t3, $zero, 1
nao_entra_if: addi $t0, $zero, 1 # i++
              blt $t0, $t1, for # Se i < 100 volta no for
