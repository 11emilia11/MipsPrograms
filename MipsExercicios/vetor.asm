.data
vetor: .space 20 # criando um vetor com 5 espaços

.text
la $s1, vetor
addi $t0, $t0, 0 # inicializando o iterador $t0 =0

read:
slti $t1, $t0, 5 # enquanto $t0 < 5 
beq $t1, 0, Endloop # se $t0 >= 5 pula para o final

addi $v0, $zero, 5  #lendo um inteiro
syscall

sll $t2, $t0, 2
add $t3, $t2, $s0

sw $s0, 0($t3)
addi $t0, $t0, 1
j read

Endloop:
Exit:





