# mapa de registos
# $t0 - i
# $t1 - soma
# $t2 - arr
# $t3 - arr[i]
# $t4 - arr[ultimo]
# $t5 - size-1
	.data
array:	.word	7692,23,5,234
	.eqv	print_int10,1
	.eqv	SIZE,4
	.text
	.globl main
main:	li	$t0,0		# i = 0;
	li	$t1,0		# soma = 0;
	li	$t5,SIZE	#
	sub	$t5,$t5,1	# $t4 = 3
	sll	$t5,$t5,2	#
	la	$t2,array	# $t2 = array;
	addu	$t4,$t2,$t5	# array[ultimo] = array + SIZE-1;
while:	la	$t2,array	# $t2 = array;
	add	$t2,$t2,$t0	# &arr[i] = arr + 1
	lw	$t3,0($t2)	# $t3 = array[i];
	bgtu 	$t2,$t4,endw	# while(array[i] <= array[ultimo]) {
	add	$t1,$t1,$t3	#	soma = soma + array[i];
	addiu	$t0,$t0,4	# 	i++;
	j	while		#
endw:				# }
	move	$a0,$t1		#
	li	$v0,print_int10	#
	syscall			# print_int10(soma);
	jr	$ra		# fim do programa