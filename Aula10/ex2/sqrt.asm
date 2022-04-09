# mapa de registos:
# $f2 - 0.0
# $f4 - xn
# $f6 - aux
	.data
xn:	.double 1.0
zero:	.double 0.0
h:	.double 0.5
	.text
	.globl sqrt
sqrt:	li	$t0,0
	l.d	$f2,zero
	l.d	$f4,xn
	l.d	$f8,h
if:	c.le.d	$f12,$f2
	bc1t	else
do:	mov.d	$f6,$f4
	div.d	$f4,$f12,$f6
	add.d	$f4,$f6,$f4
	mul.d	$f4,$f8,$f4
	addi	$t0,$t0,1
	c.eq.d	$f6,$f4
	bc1t	endif
	blt	$t0,25,do
	j	endif
else:	l.d	$f4,zero
endif:	mov.d	$f0,$f4
	jr	$ra