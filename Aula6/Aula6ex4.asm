# mapa de registos:
# $t0 - i
# $t1 - argc
# $t2 - argv
# $t3 - argv[i]
# $t4 - aux
	.data
str1:	.asciiz "Nr de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "
	.eqv	print_int10,1
	.eqv	print_string,4
	.text
	.globl main
main:	move	$t1,$a0		# $t1 = argc
	move	$t2,$a1		# $t2 = &argv[0]
	la	$a0,str1	#
	li	$v0,print_string#
	syscall			# print_string(str1);
	move	$a0,$t1		# $a0 = $t1
	li	$v0,print_int10#
	syscall			# print_int10(argc);
	li	$t0,0		# i = 0;
while:	bge	$t0,$t1,endw	# while(i < argc) {
	la	$a0,str2	#
	li	$v0,print_string#
	syscall			# 	print_string(str2);
	move	$a0,$t0		#	$a0 = $t0
	li	$v0,print_int10	#
	syscall			#	print_int10(i);
	la	$a0,str3	#
	li	$v0,print_string#
	syscall			#	print_string(str3);
	sll	$t4,$t0,2	#	$t4 = i * 4
	addu	$t3,$t2,$t4	#	$t3 = &argv[i]
	lw	$t3,0($t3)	#	$t3 = argv[i]
	move	$a0,$t3		#
	li	$v0,print_string#	
	syscall			#	print_string(argv[i]);
	addi	$t0,$t0,1	#	i++;
	j	while
endw:	li	$v0,0		# }
	jr	$ra		# fim do programa
