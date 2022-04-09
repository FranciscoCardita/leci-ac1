# mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
	.data
	.eqv	print_string,4
str:	.asciiz	"ITED - orievA ed edadisrevinU"
	.text
	.globl main
main:	addiu	$sp,$sp,-4		# reserva espaço na stack
	sw	$ra,0($sp)		#
	la	$a0,str			#
	jal	strrev			#
	move	$a0,$v0			#
	li	$v0,print_string	#
	syscall				# print_string(strrev(str));
	li	$v0,0			# return 0;
	lw	$ra,0($sp)		#
	addiu	$sp,$sp,4		#
	jr	$ra
strrev:	addiu	$sp,$sp,-16		# reserva espaço na stack
	sw	$ra,0($sp)		# guarda endereço de retorno
	sw	$s0,4($sp)		# guarda valor dos registos $s0
	sw	$s1,8($sp)		# $s1
	sw	$s2,12($sp)		# $s2
	move	$s0,$a0			# registo "callee-saved"
	move	$s1,$a0			# p1 = str
	move	$s2,$a0			# p2 = str
while:	lb	$t0,0($s2)		# while(*p2 != '\0')
	beq	$t0,'\0',endw		# {
	addiu	$s2,$s2,1		# 	p2++;
	j	while			# }
endw:	addiu	$s2,$s2,-1		# p2--;
while2:	bge	$s1,$s2,endw2		# while(p1 < p2) {
	move	$a0,$s1			#
	move	$a1,$s2			#
	jal	exchange		#
	addiu	$s1,$s1,1		# 	p1++;
	addiu	$s2,$s2,-1		#	p2--;
	j	while2			# }
endw2:	move	$v0,$s0			# return str;
	lw	$ra,0($sp)		# repõe endereço de retorno
	lw	$s0,4($sp)		# repõe o valor dos registos $s0
	lw	$s1,8($sp)		# $s1
	lw	$s2,12($sp)		# $s2
	addiu	$sp,$sp,16		# liberta espaço na stack
	jr	$ra			# termina sub-rotina
exchange:
	lb	$t0,0($a0)		# $t0 = *c1
	lb	$t1,0($a1)		# $t1 = *c2
	sb	$t0,0($a1)		# 
	sb	$t1,0($a0)		#
	jr	$ra			#