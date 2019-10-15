
# declaração de variáveis e alocação de espaço
# sentence: .ascii "Hello World"
.data 
#v: .space 40

.text

main:

# teste a = 1 b = 1
addi $t0, $zero, 4
addi $t1, $zero, 3
addi $t2, $zero, 1

# a = $t0, b = $t1, c = $t2, d = $t3
bne $t0, $t1, Else # if a != b pula pra Else
bne $t1, $t2, else # if b != c pula pra else

add $t0, $t0, $t1 # se a == b e b == c , d = a + b + c
add $t3, $t0, $t2
j Exit

else:
add $t0, $t0, $t1
sub $t3, $t0, $t2
j Exit

Else:
sub $t3, $t0, $t1

Exit:


# f = $t0
# g = $t1
# t = $t2

#addi $t0, $zero, 5
#addi $t1, $zero, 3
#add $t2, $t0, $t1


# g = $t0, h = $t1, i = $t2, j = $t3, f = $t4

#addi $t0, $zero, 3
#addi $t1, $zero, 5
#addi $t2, $zero, 2
#addi $t3, $zero, 1
#add $t0, $t0, $t1
#add $t2, $t2, $t3
#sub $t4, $t0, $t2




