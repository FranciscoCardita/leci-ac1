	.data
	.eqv	print_int10,1
str:	.asciiz	"101101"
#str:	.asciiz	"2020 e 2024 sao anos bissextos"
	.text
#	.globl	main
#main:	addiu	$sp,$sp,-4	#
	sw	$ra,0($sp)	#
	la	$a0,str		#
	jal	atoi		#
	move	$a0,$v0		#
	li	$v0,print_int10	#
	syscall			# print_int10( atoi(str) );
	li	$v0,0		#
	lw	$ra,0($sp)	#
	addiu	$sp,$sp,4	#
	jr	$ra		# return 0
