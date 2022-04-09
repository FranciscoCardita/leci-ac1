	.data
	.eqv	id_number,0
	.eqv	first_name,4
	.eqv	last_name,22
	.eqv	grade,40
	.text
	.globl print_student
print_student:
	move	$t0,$a0
	lw	$a0,id_number($t0)
	li	$v0,36
	syscall
	
	addi	$a0,$t0,first_name
	li	$v0,4
	syscall
	
	addi	$a0,$t0,last_name
	li	$v0,4
	syscall
	
	l.s	$f12,grade($t0)
	li	$v0,2
	syscall
	
	jr	$ra
