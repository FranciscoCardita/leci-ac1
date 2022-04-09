# mapa de registos:
# i:		$t0
# *p:		$t1
# *(p+1):	$t2
# SIZE:		$t3
# houveTroca:	$t4
# p:		$t5
# pUltimo:	$t6
	.data
	.eqv	SIZE,10
	.eqv	print_int10,1
	.eqv	print_string,4
	.eqv	read_int,5
	.eqv	FALSE,0
	.eqv	TRUE,1
str1:	.asciiz "\nIntroduza um numero: "
str2:	.asciiz "; "
str3:	.asciiz	"Conteudo do array ordenado: "
	.align	2
lista:	.space	40
	.text
	.globl main
main:	li	$t0,0		# i = 0;
while1:	bge	$t0,SIZE,endw1	# while(i < SIZE) {
	la	$a0,str1	#
	li	$v0,print_string#
	syscall			#	print_string(str1);
	li	$v0,read_int	#
	syscall			#	read_int()
	la	$t1,lista	#	$t1 = lista
	sll	$t2,$t0,2	#	$t2 = i * 4
	addu	$t2,$t2,$t1	#	$t2 = &lista[i]
	sw	$v0,0($t2)	#	lista[i] = read_int();
	addi	$t0,$t0,1	#	i++;
	j	while1		# }
endw1:	la	$t5,lista	# p = lista;
	li	$t6,SIZE	# $t6 = SIZE
	subu	$t6,$t6,1	# $t6 = SIZE - 1
	sll	$t6,$t6,2	# $t6 = (SIZE - 1)*4
	addu	$t6,$t6,$t5	# pUltimo = lista + (SIZE - 1)*4;
do:				# do {
	la	$t5,lista	#	p = lista;
	li	$t4,FALSE	#	houveTroca = FALSE;
while2:	bge	$t5,$t6,endw2	#	while(p < pUltimo) {
	lw	$t1,0($t5)	#		$t1 = *p
	lw	$t2,4($t5)	#		$t2 = *(p+1)
if:	ble	$t1,$t2,endif	#			if(*p > *(p+1))
	sw	$t1,4($t5)	#				*(p+1) = $t1
	sw	$t2,0($t5)	#				*p = $t2
	li	$t4,TRUE	#				houveTroca = FALSE;
endif:
	addiu	$t5,$t5,4	#		p++;
	j	while2		#	}
endw2:
enddo:	beq	$t4,TRUE,do	# } while(houveTroca == TRUE);
	li	$t0,0		# i = 0;
	la	$t5,lista	# p = lista;
	li	$t3,SIZE	# $t3 = SIZE
	sll	$t3,$t3,2	# $t3 = SIZE * 4
	addu	$t3,$t5,$t3	# $t3 = lista + SIZE*4
	la	$a0,str3	#
	li	$v0,print_string#
	syscall			#	print_string(str3);
while3:	bge	$t5,$t3,endw3	# while(p < lista + SIZE) {
	lw	$t1,0($t5)	#	$t1 = *p
	move	$a0,$t1		#	$a0 = $t1 = *p
	li	$v0,print_int10	#
	syscall			#	print_int10(*p);
	la	$a0,str2	#
	li	$v0,print_string#
	syscall			#	print_string(str2);
	addiu	$t5,$t5,4	#	p++
	j	while3		# }
endw3:	jr	$ra		# fim do programa
