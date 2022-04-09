	.data
	.eqv	print_string,4
str1:	.asciiz	"Arquitetura de "
str2:	.space	50
str3:	.asciiz	"\n"
str4:	.asciiz	"Computadores I"
	.text
	.globl main
main:	addiu	$sp,$sp,-4	#
	sw	$ra,0($sp)	#
	la	$a0,str2	#
	la	$a1,str1	#
	jal	strcpy		#
	move	$a0,$v0		#
	li	$v0,print_string#
	syscall			#
	la	$a0,str3	#
	li	$v0,print_string#
	syscall			#
	la	$a0,str2	#
	la	$a1,str4	#
	jal	strcat		#
	move	$a0,$v0		#
	li	$v0,print_string#
	syscall			#
	li	$v0,0		#
	lw	$ra,0($sp)	#
	addiu	$sp,$sp,4	#
	jr	$ra		#
########
strcat:	addiu	$sp,$sp,-8	#
	sw	$ra,0($sp)	#
	sw	$s0,4($sp)	#
	move	$s0,$a0		#
while:	lb	$t0,0($a0)	#
	beq	$t0,'\0',endw	#
	addiu	$a0,$a0,1	#
	j	while		#
endw:	jal	strcpy		#
	move	$v0,$s0		#
	lw	$ra,0($sp)	#
	lw	$s0,4($sp)	#
	addiu	$sp,$sp,8	#
	jr	$ra		#
########
strcpy:	li	$t0,0		# int i=0;
do:	addu	$t1,$a1,$t0	# &src[i]
	lb	$t2,0($t1)	# $t2 = src[i]
	addu	$t3,$a0,$t0	# &dst[i]
	sb	$t2,0($t3)	# dst[i] = src[i];
while2:	beq	$t2,'\0',endw2	# while(src[i++] != '\0')
	addi	$t0,$t0,1	#
	j	do		#
endw2:	move	$v0,$a0		#
	jr	$ra		#
