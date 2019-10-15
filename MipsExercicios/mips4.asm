.macro printArray (%adress,%size)

li $t0,0 # cont do for para printar o vetor

Loop2: 
slt $t1,$t0,%size  # enquanto contador for < tamanho do vetor
beq $t1,$zero,endloop # se cont >= tamanho do vetor pula para endloop
sll $t2,$t0,2  # ajustando o valor para a próxima posição de memória do vetor
add $t3,$t2,%adress # calculando o endereço do vetor onde vai pegar o num 
lw $t4,0($t3)  # salvando o valor do elemento do vetor[cont]
li $v0,1 # chamando a função de print de int
move $a0,$t4 # $a0 recebe o numero para ser printado
syscall
print_str(" ") 

addi $t0,$t0,1  # incrementando o cont
j Loop2

endloop:
.end_macro

.macro readArray (%adress,%size)

sll $t2,%size,2
move $a0,$t2
li $v0,9
syscall
move %adress,$v0

li $t0,0
read: 
slt $t1,$t0,%size
beq $t1,$zero,endread
print_str("digite o valor: ")
li $v0,5 
syscall 

sll $t2,$t0,2 
add $t3,$t2,$s0 

sw $v0,0($t3) 
addi $t0,$t0,1 
j read
endread:
.end_macro

.macro print_str (%str)
.data
myLabel: .asciiz %str
.text
li $v0, 4
la $a0, myLabel
syscall
.end_macro

.text
# S0 É O ENDEREÇO DO ARRAY

print_str("digite o tamanho do array: ")
li $v0,5
syscall
move $s1,$v0 # S1 É O TAMANHO DO ARRAY 

readArray($s0,$s1)

print_str("Digite 1 para crescente e 0 para decrescente")
li $v0,5
syscall
move $s2,$v0 # S2 É CRESCENTE OU DECRESCENTE

printArray($s0,$s1)