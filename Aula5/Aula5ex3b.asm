# mapa de registos
# p - $t0
# *p - $t1
# aux - $t2
# SIZE-1 - $t3
# houveTroca - $t4
# i - $t5
# lista - $t6
# lista + i - $t7
	.data
	.eqv	SIZE,10
	.eqv	TRUE,1
	.eqv	FALSE,0
	.eqv	read_int,5
	.eqv	print_string,4
	.eqv	print_int10,1
str1:	.asciiz "\nIntroduza um numero: "
str2:	.asciiz "; "
	.align 	2
lista:	.space	40
	.text
	.globl main
main:	li	$t5,0			# i = 0;
while1:	bge	$t5,SIZE,endw1		# while(i < SIZE) {
	la	$a0,str1		#
	li	$v0,print_string	#
	syscall				# 	print_string(str1);
	li	$v0,read_int		#
	syscall				# 	read_int()
	la	$t6,lista		# 	$t6 = lista
	sll	$t7,$t5,2		#
	addu	$t7,$t7,$t6		#
	sw	$v0,0($t7)		#	lista[i] = read_int();
	addi	$t5,$t5,1		# 	i++;
	j	while1			# }
endw1:	la	$t6,lista		#	
do:					# do {
	li	$t4,FALSE		#	houveTroca = FALSE;
	li	$t5,0			# 	i = 0;
while2:	bge	$t5,9,endw2		#	while(i < SIZE-1) {
	sll	$t7,$t5,2		#		$t7 = i * 4
	addu	$t7,$t7,$t6		#		$t7 = &lista[i]
	lw	$t8,0($t7)		#		$t8 = lista [i]
	lw	$t9,4($t7)		#		$t9 = lista [i+1]
if:	ble	$t8,$t9,endif		#		if(lista[i] > lista[i+1])
	sw	$t8,4($t7)		#			lista[i] = lista[i+1];
	sw	$t9,0($t7)		#			lista[i+1] = aux;
	li	$t4,TRUE		#			houveTroca = TRUE;
endif:	addi	$t5,$t5,1		#		i++;
	j	while2			# }
endw2:					#
enddo:	beq	$t4,TRUE,do		#  while(houveTroca == TRUE);
	li	$t5,0			# i = 0;
	la	$t0,lista		# p = lista;
	li	$t2,SIZE		# $t2 = SIZE
	sll	$t2,$t2,2		# 
	addu	$t2,$t2,$t0		# $t2 = lista + SIZE
while3: bgeu	$t0,$t2,endw3		# while(p < lista+SIZE) {
	lw	$t1,0($t0)		#	$t1 = *p
	move	$a0,$t1			#	$a0 = $t1
	li	$v0,print_int10		#
	syscall				#	print_int10(*p);
	la	$a0,str2		#
	li	$v0,print_string	#
	syscall				#	print_string(str2);
	addiu	$t0,$t0,4		#	p++;
	j	while3			# }
endw3:	jr	$ra			# fim do programa
