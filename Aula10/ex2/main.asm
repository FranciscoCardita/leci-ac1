	.data
str:	.asciiz "Introduza um valor: "
str2:	.asciiz "A raiz quadrada de "
str3:	.asciiz " e': "
	.text
	.globl main
main:	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	la	$a0,str
	li	$v0,4
	syscall
	li	$v0,7
	syscall
	mov.d	$f12,$f0
	mov.d	$f20,$f0
	s.d	$f20,4($sp)
	jal	sqrt
	l.d	$f20,4($sp)
	mov.d	$f2,$f0
	la	$a0,str2
	li	$v0,4
	syscall
	mov.d	$f12,$f20
	li	$v0,3
	syscall
	la	$a0,str3
	li	$v0,4
	syscall
	mov.d	$f12,$f2
	li	$v0,3
	syscall
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
