.eqv print_string, 4
.eqv read_integer, 5
.eqv read_string, 8
.eqv read_float, 6

.eqv stidof, 0
.eqv stfnof, 4
.eqv stlnof, 22
.eqv stgrof, 40
.eqv stmxfn, 17
.eqv stmxln, 16
.eqv MAX_STUDENTS, 4

	.data
st_arr:	.space 176	# 44 x 4 elementos
str1:	.asciiz "N. Mec: "
str2:	.asciiz "Primeiro Nome: "
str3:	.asciiz "Ultimo Nome: "
str4:	.asciiz "Nota: "

	.text
	.globl main
read_data:		# $s2 - i	Recebe em $a0 - ponteiro para o início do array de estruturas e no $a1 o numero de elementos desse array

	move $s0,$a0
	move $s1,$a1

	li $s2,0		# i=0
f_rd:	bge $s2,$s1, end_f_rd	# i<ns

	la $a0,str1		# le id
	li $v0,print_string
	syscall
	move $t0,$s0
	li $t2,44		# sizeof(student)
	mul $t2, $s2, $t2	# i * sizeof(student)
	addu $t0, $t0, $t2	# endereco inicial da instancia i do array de estruturas st_arr 
	li $v0, read_integer
	syscall
	sw $v0, stidof($t0)

	la $a0,str2		# le fn
	li $v0,print_string
	syscall
	move $t0,$s0
	li $t2,44		# sizeof(student)
	mul $t2, $s2, $t2	# i * sizeof(student)
	addu $t0, $t0, $t2	# endereco inicial da instancia i do array de estruturas st_arr 
	addiu $a0,$t0,stfnof
	li $a1,stmxfn
	li $v0,read_string
	syscall

	la $a0,str3		# le ln
	li $v0,print_string
	syscall
	move $t0,$s0
	li $t2,44		# sizeof(student)
	mul $t2, $s2, $t2	# i * sizeof(student)
	addu $t0, $t0, $t2	# endereco inicial da instancia i do array de estruturas st_arr 
	addiu $a0,$t0,stlnof
	li $a1,stmxln
	li $v0,read_string
	syscall
	
	la $a0,str4		# le grade
	li $v0,print_string
	syscall
	move $t0,$s0
	li $t2,44		# sizeof(student)
	mul $t2, $s2, $t2	# i * sizeof(student)
	addu $t0, $t0, $t2	# endereco inicial da instancia i do array de estruturas st_arr 
	li $v0, read_float
	syscall
	s.s $f0, stgrof($t0)
				
	addi $s2,$s2,1		# i++
	j f_rd	
end_f_rd:	
	jr $ra

	
#######  MAIN ######		
				
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0, st_arr
	li $a1, MAX_STUDENTS
	jal read_data

	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	
