	.data
k0:	.double	5.0
k1:	.double 9.0
k2:	.double	32.0
	.text
	.globl f2c
f2c:	l.d	$f0,k0
	l.d	$f2,k1
	l.d	$f4,k2
	div.d	$f6,$f0,$f2
	sub.d	$f8,$f12,$f4
	mul.d	$f0,$f6,$f8
	jr	$ra