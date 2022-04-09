	.data
str:	.space	33
str2:	.asciiz	"\n"
	.text
	.globl main
main:	addiu	$sp,$sp,-8	#
	sw	$ra,0($sp)	#
	sw	$s0,4($sp)	#
do:	li	$v0,5		#
	syscall			# read_int();
	move	$s0,$v0		# val = read_int();
	move	$a0,$s0		#
	li	$a1,2		#
	la	$a2,str		#
	jal	itoa		#
	move	$a0,$v0		#
	li	$v0,4		# print_string(itoa(val,2,str));
	syscall			#
	la	$a0,str2	#
	li	$v0,4		#
	syscall			#
	move	$a0,$s0		#
	li	$a1,8		#
	la	$a2,str		#
	jal	itoa		#
	move	$a0,$v0		#
	li	$v0,4		# print_string(itoa(val,8,str));
	syscall			#
	la	$a0,str2	#
	li	$v0,4		#
	syscall			#
	move	$a0,$s0		#
	li	$a1,16		#
	la	$a2,str		#
	jal	itoa		#
	move	$a0,$v0		#
	li	$v0,4		# print_string(itoa(val,16,str));
	syscall			#
	la	$a0,str2	#
	li	$v0,4		#
	syscall			#
while:	bnez	$s0,do		# while(val != 0);
	li	$v0,0		# return 0;
	lw	$ra,0($sp)	#
	lw	$s0,4($sp)	#
	addiu	$sp,$sp,8	#
	jr	$ra		#