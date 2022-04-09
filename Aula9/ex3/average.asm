	.data
zero:	.double 0.0
	.text
	.globl average
average:move	$t0,$a0
	move	$t1,$a1
	l.d	$f2,zero
for:	blez	$t1,endf
	addi	$t3,$t1,-1
	sll	$t2,$t3,3
	addu	$t2,$t0,$t2
	l.d	$f4,0($t2)
	add.d	$f2,$f2,$f4
	addi	$t1,$t1,-1
	j	for
endf:	mtc1	$a1,$f6
	cvt.d.w	$f6,$f6
	div.d	$f0,$f2,$f6
	jr	$ra