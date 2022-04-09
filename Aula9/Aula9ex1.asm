	.data
k1:	.float 2.59374
k2:	.float 0.0
	.text
	.globl main
main:	l.s	$f0,k1
	l.s	$f1,k2
do:	li	$v0,5
	syscall
	mtc1	$v0,$f2	
	cvt.s.w	$f2,$f2
	mul.s	$f12,$f2,$f0
	li	$v0,2
	syscall
	c.eq.s	$f12,$f1
	bc1f	do
	li	$v0,0
	jr	$ra