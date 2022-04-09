	.data
	.eqv	id_number,0
	.eqv	first_name,4
	.eqv	last_name,22
	.eqv	grade,40
	.eqv	MAX_STUDENTS,4
st_arr:	.space	176
str:	.asciiz	"\nMedia: "
	.align 	2
media:	.space	4
	.text
	.globl main
main:	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	la	$a0,st_arr
	li	$a1,MAX_STUDENTS
	jal	read_data
	la	$a0,st_arr
	li	$a1,MAX_STUDENTS
	la	$a2,media
	jal	max
	move	$s0,$v0
	la	$a0,str
	li	$v0,4
	syscall
	la	$t0,media
	l.s	$f12,0($t0)
	li	$v0,2
	syscall
	move	$a0,$s0
	jal	print_student
	li	$v0,0
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	addiu	$sp,$sp,8
	jr	$ra