.data
vetor: .space 60  # n = 15
newline: .asciiz " " # ESPAÇO PARA PRINTAR VALORES

.macro print_int (%x)
li $v0,1
move $a0,%x
syscall
.end_macro

.text
addi $t0, $zero, 0
la $s0, vetor

Loop:
slti $t1, $t0, 15 # se i < 15
beq $t1, $zero, EndLoop # se i >= 15 pula

sll $t1, $t0, 2  
add $t2, $t1, $s0

li $v0, 5
syscall

sw $v0, 0($t2)

addi $t0, $t0, 1
j Loop


EndLoop:

addi $t0, $zero, 1 # k

For1:
slti $t2, $t0, 15
beq $t2, $zero, EndFor1

addi $t1, $zero, 0 # j

j For2

For2:
slti $t2, $t1, 14
beq $t2, $zero, EndFor2

sll $t3,$t1, 2 # j * 4
add $t4, $t3, $s0 # j + end base do vetor
lw $t2, 0($t4)

addi $t6, $t1, 1
sll $t3, $t6, 2
add $t5, $t3, $s0 # endereço
lw $t3, 0($t5) # valor

slt $t7, $t3, $t2
beq $t7, $zero, EndIf
add $t6, $zero, $t2
sw $t3, 0($t4)

sw $t6, 0($t5)
j EndIf


EndIf:
addi $t1, $t1, 1
j For2

EndFor2:
addi $t0, $t0, 1
j For1

EndFor1:


addi $t0, $zero, 0

Print:
slti $t1, $t0, 15 
beq $t1, $zero, EndPrint

sll $t1, $t0, 2
add $t2, $t1, $s0

lw $t3, 0($t2)
print_int($t3)
li $v0, 4 # COMANDO DE PRINT DE STRING
la $a0, newline # CARREGA A STRING EM a0
syscall

addi $t0, $t0, 1
j Print

EndPrint:
