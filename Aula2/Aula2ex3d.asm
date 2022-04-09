	.data
str1:	.asciiz "Introduza 2 numeros\n"
str2:	.asciiz "A soma dos dois numeros e: "
	.eqv	print_string,4
	.eqv	read_int,5
	.eqv	print_int10,1
	
	.text
	.globl main
main:	la	$a0,str1
	ori	$v0,$0,print_string
	syscall			# print_string(str1)
	li	$v0,read_int
	syscall			# ler valor do teclado
	or	$t0,$v0,$0	# $t0 = a
	li	$v0,read_int
	syscall			# ler valor do teclado
	or	$t1,$v0,$0	# $t1 = b
	add	$t2,$t0,$t1	# $t2 = $t0 + $t1 = a + b
	la	$a0,str2
	li	$v0,print_string
	syscall			# print_string(str2)
	or	$a0,$0,$t2
	li	$v0,print_int10
	syscall			# print_int10(a + b)
	jr	$ra		# fim do programa