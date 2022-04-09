# mapa de registos:
# $t0 - SIZE
# $t1 - p
# $t2 - pultimo
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
main:	la	$t1,array	# p = array;
	li	$t0,SIZE	# $t0 = SIZE
	sll	$t0,$t0,2	# $t0 = SIZE * 4
	addu	$t2,$t1,$t0	# pultimo = array + SIZE;
while:	bge	$t1,$t2,endw	# while(p < pultimo) {
	lw	$a0,0($t1)	#	$a0 = *p
	li	$v0,print_string#
	syscall			#	print_string(*p);
	li	$a0,'\n'	#
	li	$v0,print_char	#
	syscall			#	print_char('\n');
	addiu	$t1,$t1,4	#	p++;
	j	while		# }
endw:	jr	$ra		# fim do programa
