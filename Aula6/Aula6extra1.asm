# mapa de registos:
# $t0 - i
# $t1 - j
# $t2 - k
# $t3 - aux
# $t4 - argc
# $t5 - argv
# $t6 - argv[i]
# $t7 - argv[i][j]
# $t8 - maior
	.data
	.eqv	print_int10,1
	.eqv	print_string,4
str1:	.asciiz	"Nr de caracteres de #"
str2:	.asciiz	": "
str3:	.asciiz "\nMaiusculas: "
str4:	.asciiz	"\nMinusculas: "
str5:	.asciiz	"\nMaior string: "
	.text
	.globl main
main:	li	$t0,0		# i = 0;
	move	$t4,$a0		# $t4 = $a0
	move	$t5,$a1		# $t5 = $a1
while:	bge	$t0,$t4,endw	# while(i < argc) {
	li	$t1,0		# 	j = 0;
while2:	sll	$t3,$t0,2	#	$t3 = i * 4
	addu	$t6,$t5,$t3	#	$t6 = &argv[i]
	lw	$t6,0($t6)	#	$t6 = argv[i]
	addu	$t6,$t6,$t1	#	$t6 = &argv[i][j]
	lb	$t6,0($t6)	#	$t6 = argv[i][j]
	beq	$t6,'\0',endw2	#		while(argv[i][j] != '\0') {
	addi	$t1,$t1,1	#		j++;
	j	while2
endw2:	la	$a0,str1	#
	li	$v0,print_string#
	syscall			# 	print_string(str1);
	move	$a0,$t0		#
	li	$v0,print_int10	#
	syscall			# 	print_int10(i);
	la	$a0,str2	#
	li	$v0,print_string#
	syscall			# 	print_string(str2);
	move	$a0,$t1		#
	li	$v0,print_int10	#
	syscall			#
	addi	$t1,$t1,1	# 	i++;
	#j	while		# }
endw:
	jr	$ra		# fim do programa
