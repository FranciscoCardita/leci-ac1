# mapa de registos:
# $t0 - *s
# $t1 - len
	.data
str:	.asciiz	"Arquitetura de computadores I"
	.eqv	print_int10,1
	.text
	.globl main
main:				# int main(void) {
	addiu	$sp,$sp,-4	# 	fazer espaco na pilha
	sw	$ra,0($sp)	# 	salvaguardar o $ra
	la	$a0,str		# 	arg1 de strlen = str
	jal	strlen		# 	strlen(str)
	move	$a0,$v0		# 	$a0 = retorno de strlen
	li	$v0,1		#
	syscall			# 	print_int10(strlen(str));
	li	$v0,0		# 	return 0;
	lw	$ra,0($sp)	#
	addiu	$sp,$sp,4	# 	repor stack
	jr	$ra		# } fim do programa
strlen:	li	$t1,0		# len = 0;
while:	lb	$t0,0($a0)	# while(*s++ != '\0')
	addiu	$a0,$a0,1	#
	beq	$t0,'\0',endw	# {
	addi	$t1,$t1,1	#	len++;
	j	while		# }
endw:	move	$v0,$t1		# return len;
	jr	$ra		# fim do programa