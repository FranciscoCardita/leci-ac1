# mapa de resgistos:
# i		- $t0
# array 	- $t1
# array[i]	- $t2
	.data
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
array:	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
	.text
	.globl main
main:	li	$t0,0	# i = 0;
while:	bge	$t0,SIZE,endw	# while(i < SIZE) {
	la	$t1,array	#	$t1 = &array[0]
	sll	$t2,$t0,2	#	$t2 = i * 4
	addu	$t2,$t1,$t2	#	$t2 = &array[i]
	lw	$a0,0($t2)	# 	$a0 = array[i]
	li	$v0,print_string#
	syscall			#	print_string(array[i]);
	li	$a0,'\n'	#
	li	$v0,print_char	#
	syscall			#	print_char('\n');
	addi	$t0,$t0,1	#	i++;
	j	while		# }
endw:	jr	$ra		# fim do programa