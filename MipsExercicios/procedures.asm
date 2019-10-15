exemplo:
addi $sp, $sp, -12 # ajustando sp para empilhar 3 valores
sw $sp, 8($sp) # salva o reg $t1 na pilha
sw $sp, 4($sp) # salva o reg $to na pilha
sw $sp, 0($sp) # salva o reg $s0 na pilha

# corpo do procedimento
add $t0, $a0, $a1
add $t1, $a2, $a3
sub $s0, $t0, $t1

 # coloca o valor de retorno do procedimento no reg $v0
add $v0, $s0, $zero

# restaurar valores dos registradores salvos na pilha 
lw $s0, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
add $sp, $sp, 12 # atualiza sp (pop três palavras)

#retorna 
jr $ra
