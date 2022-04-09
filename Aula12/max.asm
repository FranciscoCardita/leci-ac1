	.data
	.eqv	id_number,0
	.eqv	first_name,4
	.eqv	last_name,22
	.eqv	grade,40
max_gr:	.float	-20.0
sum:	.float	0.0
	.text
	.globl max
max:	l.s	$f2,max_gr
	l.s	$f4,sum
	move	$t0,$a0
	move	$t1,$a1
	mov.s	$f1,$f12
	mul	$t1,$t1,44
	addu	$t1,$t0,$t1
for:	bge	$t0,$t1,endf
	l.s	$f6,grade($t0)
	add.s	$f4,$f4,$f6
if:	c.le.s	$f6,$f2
	bc1t	endif
	mov.s	$f2,$f6
	move	$v0,$t0
	j	endif
endif:
	addiu	$t0,$t0,44
	j	for
endf:	mtc1	$a1,$f3
	cvt.s.w	$f3,$f3
	div.s	$f5,$f4,$f3
	s.s	$f5,0($a2)
	jr	$ra
