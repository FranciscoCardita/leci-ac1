# mapa de registos:
# $t0 - p
# $t1 - *p
	.data
	.eqv	SIZE,20
	.eqv	print_string,4
	.eqv	read_string,8
str:	.space	SIZE
str1:	.asciiz "Introduza uma string: "
	.text
	.globl main
main:	la	$a0,str1		#
	li	$v0,print_string	#
	syscall				# print_string(str1);
	la	$a0,str			#
	li	$a1,SIZE		#
	li	$v0,read_string		#
	syscall				# read_string(str,SIZE);
	la	$t0,str			# p = str;
while:	lb	$t1,0($t0)		# while(*p != '\0')
	beqz	$t1,endw		# {
	addi	$t1,$t1,-0x20		# 	*p = *p - 0x20;
	sb	$t1,0($t0)		#
	addi	$t0,$t0,1		#	p++;
	j	while			# }
endw:	la	$a0,str			# 
	li	$v0,print_string	#
	syscall				# print_string(str);
	jr	$ra			# fim do programa