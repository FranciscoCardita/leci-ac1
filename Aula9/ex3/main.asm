# mapa de registos:
# $t0 - i
# $t1 - SIZE
	.data
	.eqv SIZE,10
a:	.space 80
	.text
	.globl main
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	li	$t0,0
	li	$t1,SIZE
	la	$t2,a
for:	bge	$t0,$t1,endf
	li	$v0,5
	syscall
	mtc1.d	$v0,$f0
	cvt.d.w	$f0,$f0
	sll	$t3,$t0,3
	addu	$t3,$t2,$t3
	s.d	$f0,0($t3)
	addi	$t0,$t0,1
	j	for
endf:	la	$a0,a
	li	$a1,SIZE
	jal	average
	mov.d	$f12,$f0
	li	$v0,3
	syscall
	li	$v0,0
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra