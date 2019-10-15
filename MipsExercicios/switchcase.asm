.data
jTable: .word L0,L1,L2,L3 # tabela de Labels

.text
la $s4, jTable # $t4 = endereço base da tabela de desvios
li $s1, 15 # g = $s1 = 15
li $s2, 20 # h = $s2 = 20
li $s3, 10 # i = $s3 = 10
li $s4, 5 # j = $s4 = 5
li $s5, 2 # k = $s5 = 2

# testando se k está entre 0 e 3
slt $t3, $s5, $zero
bne $t3, $zero, Exit
slti $t3, $s5, 4
beq $t3, $zero, Exit

# calculando o endereço correto do label 
sll $t1, $s4, 2
add $t1, $t1, $t4
lw $t0, 0($t1)
jr $t0

# casos

L0: add $t0, $s3, $s4
j Exit
L1: add $t0, $s1, $s2
j Exit
L2: sub $t0, $s1, $s2
j Exit
L3: sub $t0, $s3, $s4
Exit: 