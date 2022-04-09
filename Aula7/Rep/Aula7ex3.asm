# mapa de registos:
# $t0 - exit_value
	.data
	.eqv	print_int10,1
	.eqv	print_string,4
str1:	.asciiz	"I serodatupmoC ed arutetiuqrA"
str2:	.space	31
str3:	.asciiz	"\n"
str4:	.asciiz	"String too long: "
	.text
	.globl main
main:	addiu	$sp,$sp,-4		#
	sw	$ra,0($sp)		#
	la	$a0,str1		#
	jal	strlen			#
if:	bgt	$v0,30,else		# if(strlen(str1) <= STR_MAX_SIZE) {
	la	$a0,str2		# $a0 = &str2
	la	$a1,str1		# $a1 = &str1
	jal	strcpy			#	strcpy(str2, str1);
	move	$a0,$v0			#
	li	$v0,print_string	#
	syscall				#	print_string(str2);
	la	$a0,str3		#
	li	$v0,print_string	#
	syscall				#	print_string("\n");
	la	$a0,str2		#
	jal	strrev			#
	move	$a0,$v0			#
	li	$v0,print_string	#
	syscall				#	print_string(strrev(str2));
	li	$t0,0			#	exit_value = 0;
	j	endif			#
else:	la	$a0,str4		#
	li	$v0,print_string	#
	syscall				#	print_string("String too long: ");
	la	$a0,str1		#
	jal	strlen			#
	move	$a0,$v0			#
	li	$v0,print_int10		#
	syscall				#	print_int10(strlen(str1));
	addi	$t0,$t0,-1
endif:	move	$v0,$t0			#
	lw	$ra,0($sp)		#
	addiu	$sp,$sp,4		#
	jr	$ra			#
########
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
########	
strlen:	li	$t1,0		# len = 0;
while3:	lb	$t0,0($a0)	# while(*s++ != '\0')
	addiu	$a0,$a0,1	#
	beq	$t0,'\0',endw3	# {
	addi	$t1,$t1,1	# 	len++;
	j	while3		# }
endw3:	move	$v0,$t1		# return len;
	jr	$ra		#
########
strcpy:	li	$t0,0		# int i=0;
do:	addu	$t1,$a1,$t0	# &src[i]
	lb	$t2,0($t1)	# $t2 = src[i]
	addu	$t3,$a0,$t0	# &dst[i]
	sb	$t2,0($t3)	# dst[i] = src[i];
while4:	beq	$t2,'\0',endw4	# while(src[i++] != '\0')
	addi	$t0,$t0,1	#
	j	do		#
endw4:	move	$v0,$a0		#
	jr	$ra		#
