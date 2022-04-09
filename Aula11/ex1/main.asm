	.data
	.eqv	id_number,0
	.eqv	first_name,4
	.eqv	last_name,22
	.eqv	grade,40
stg:	.word	72342
	.asciiz	"Napoleao"
	.space	9
	.asciiz	"Bonaparte"
	.space	5
	.float	5.1
str:	.asciiz	"\nN. Mec: "
str2:	.asciiz	"\nNome: "
str3:	.asciiz	"\nNota: "
	.text
	.globl main
main:	la	$t0,stg
	la	$a0,str
	li	$v0,4
	syscall
	lw	$a0,id_number($t0)
	li	$v0,36
	syscall
	
	la	$a0,str2
	li	$v0,4
	syscall
	addiu	$a0,$t0,last_name
	li	$v0,4
	syscall
	li	$a0,','
	li	$v0,11
	syscall
	addiu	$a0,$t0,first_name
	li	$v0,4
	syscall
	
	la	$a0,str3
	li	$v0,4
	syscall
	l.s	$f12,grade($t0)
	li	$v0,2
	syscall
	li	$v0,0
	jr	$ra