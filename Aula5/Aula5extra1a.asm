# mapa de registos:
# i		- $t0
# j		- $t1
# aux		- $t2
# lista 	- $t3
# SIZE-1	- $t4
# tmp1		- $t5
# tmp2		- $t6
	.data
	.eqv SIZE,10
	.eqv print_int10,1
	.eqv print_string,4
	.eqv read_int,5
str1:	.asciiz "\nIntroduza um numero: "
str2:	.asciiz "\nArray ordenado: "
str3:	.asciiz "; "
	.align 2
lista:	.space 40
	.text
	.globl main
main:	li	$t0,0		# i = 0
while1: bge	$t0,SIZE,endw1	# while(i < SIZE) {
	la	$a0,str1	#
	li	$v0,print_string#
	syscall			#	print_string(str1);
	li 	$v0,read_int	#
	syscall			#
	sll	$t2,$t0,2	# 	$t2 = i * 4
	la	$t3,lista	#	$t3 = &lista[0]
	addu	$t3,$t3,$t2	#	$t3 = lista[i]
	sw	$v0,0($t3)	#	lista[i] = read_int();
	addi	$t0,$t0,1	# 	i++;
	j	while1		# }
endw1:	li	$t0,0		# i = 0;
	li	$t2,SIZE	#
	sub	$t4,$t2,1	# $t4 = SIZE - 1
while2: bge	$t0,$t4,endw2	# while(i < SIZE - 1) {
	addi	$t1,$t0,1	# j = i + 1;
while3:	bge	$t1,SIZE,endw3	# 	while(j < SIZE) {
	la	$t3,lista	#		$t3 = &lista[0]
	sll	$t5,$t0,2	#		int tmp1 = i*4
	addu	$t5,$t3,$t5	#		tmp1 = lista+i
	sll	$t6,$t1,2	#		int tmp2 = j*4
	addu	$t6,$t3,$t6	#		tmp2 = lista+j
	lw	$t7,0($t5)	#		$t7 = lista[i]
	lw	$t8,0($t6)	#		$t8 = lista[j]
if:	ble	$t7,$t8,endif	# 			if(lista[i] > lista[j])
	sw	$t7,0($t6)	#				$t7 = lista[j]
	sw	$t8,0($t5)	#				$t8 = lista[i]
endif:
	addi	$t1,$t1,1	#		j++;
	j	while3		#	}
endw3:
	addi	$t0,$t0,1	#	i++;
	j	while2		# }
endw2:	li	$t0,0		# i = 0;
	la	$a0,str2	#
	li	$v0,print_string#
	syscall			#	print_string(str2);
while4: bge	$t0,SIZE,endw4	# while(i < SIZE) {
	sll	$t2,$t0,2	#	aux = i * 4;
	la	$t3,lista	#	$t3 = &lista[0]
	addu	$t5,$t3,$t2	#	tmp1 = lista+i
	lw	$a0,0($t5)	#
	li	$v0,print_int10 #
	syscall			#	print_int10(lista[i]);
	la	$a0,str3	#
	li	$v0,print_string#
	syscall			#	print_string(str3);
	addi	$t0,$t0,1	#	i++;
	j	while4		# }
endw4:	jr	$ra		# fim do programa	
