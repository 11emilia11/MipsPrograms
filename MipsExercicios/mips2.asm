.data
# msg: .asciiz "Hello World!\n" # variável 'msg' do tipo string ascii

.data

# criando as variáveis num1 e num2
num1: .word
num2: .word

.text
main:

la $s0, num1 # salvando em $s0 o endereço base de num1
la $s1, num2 # salvando em $s1 o endereço base de num2

# lendo do teclado um inteiro
li $v0, 5
syscall 

addi $s0, $v0, 0 # salvando em $s0 o valor do inteiro do teclado (que estava em v0)


# lendo outro inteiro do teclado
li $v0, 5
syscall 

addi $s1, $v0, 0 # salvando em $s1 o valor do inteiro do teclado (v0)

add $s2, $s0, $s1

#escrevendo o valor da soma 
li $v0, 1
move $a0, $s2
syscall

#li $v0, 1    # passando o parâmetro de "imprimir int" para v0
#li $a0, 15  # salvando no parametro a0 o int que será impresso
#syscall # chamada do sistema para imprimir

# para printar string
# li $v0, 5
# li $a0, msg
