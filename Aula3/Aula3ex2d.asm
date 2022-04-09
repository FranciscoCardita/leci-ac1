# mapa de registos:
# $t0 - value
# $t1 - bit
# $t2 - i
	.data
str1:	.asciiz		"Introduza um numero: "
str2:	.asciiz		"\nO valor em binario e': "
	.eqv		print_string,4
	.eqv		read_int,5
	.eqv		print_char,11
	.text
	.globl main
main:	la	$a0,str1		#
	li	$v0,print_string	#
	syscall				# print_string(str1)
	li	$v0,read_int		#
	syscall				#
	move	$t0,$v0			# value = read_int();
	la	$a0,str2		#
	li	$v0,print_string	#
	syscall				# print_string(str2);
	li	$t2,0			# i = 0
for:	bge	$t2,32,endfor		# while(i < 32) {
	andi	$t1,$t0,0x80000000	# 	bit = value & 0x80000000 //isola bit 31
	srl	$t1,$t1,31		#	(bit = value & 0x80000000) >> 31
	rem	$t3,$t2,4		#	$t3 = i % 4
if:	bne	$t3,0,endif		#	if(i%4 == 0)
	li	$a0,0x20		#
	li	$v0,print_char		#
	syscall				#		print_char(' ')
	j	endif			#
endif:	addi	$a0,$t1,0x30		#	print_char(0x30 + bit)
	li	$v0,print_char		#
	syscall				#
	sll	$t0,$t0,1		#	value = value << 1;
	addi	$t2,$t2,1		#	i++;
	j	for			# }
endfor:					#
	jr	$ra			# fim do programa
	
	
