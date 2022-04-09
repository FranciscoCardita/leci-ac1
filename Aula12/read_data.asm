	.data
	.eqv	id_number,0
	.eqv	first_name,4
	.eqv	last_name,22
	.eqv	grade,40
str:	.asciiz	"N. Mec: "
str2:	.asciiz	"Primeiro Nome: "
str3:	.asciiz	"Ultimo Nome: "
str4:	.asciiz	"Nota: "
	.text
	.globl read_data
read_data:
	li	$t2,0
	move	$t0,$a0	# st
	move	$t1,$a1	# ns
for:	bge	$t2,$t1,endf
	la	$a0,str
	li	$v0,4
	syscall
	
	mul	$t3,$t2,44
	addu	$t3,$t0,$t3
	li	$v0,5
	syscall
	sw	$v0,id_number($t3)
	
	la	$a0,str2
	li	$v0,4
	syscall
	
	addiu	$a0,$t3,first_name
	li	$a1,18
	li	$v0,8
	syscall
	
	la	$a0,str3
	li	$v0,4
	syscall
	
	addiu	$a0,$t3,last_name
	li	$a1,15
	li	$v0,8
	syscall
	
	la	$a0,str4
	li	$v0,4
	syscall
	
	li	$v0,6
	syscall
	s.s	$f0,grade($t3)
	
	addi	$t2,$t2,1
	j	for
endf:
	jr	$ra
	
