	.data
str:	.asciiz "Introduza uma base com x real: "
str2:	.asciiz "Introduza um expoente com y inteiro: "
str3:	.asciiz "Resultado: "
	.text
	.globl main
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	li	$v0,5
	syscall
	move	$a0,$v0
	li	$v0,5
	syscall
	move	$a1,$v0
	jal	xtoy
	mov.s	$f12,$f0
	li	$v0,2
	syscall
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
