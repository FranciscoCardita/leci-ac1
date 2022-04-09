	.data
result:	.float 1.0
	.text
	.globl xtoy
xtoy:	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	li	$t0,0
	l.s	$f1,result
	move	$s0,$a0
	move	$a0,$a1
	jal	abs1
	move	$t1,$v0
	mtc1	$s0,$f2
	cvt.s.w	$f2,$f2
for:	bge	$t0,$t1,endf
if:	blez	$a1,else
	mul.s	$f1,$f1,$f2
	j	endif
else:	div.s	$f1,$f1,$f2
endif:	mov.s	$f0,$f1
	addi	$t0,$t0,1
	j	for
endf:
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	addiu	$sp,$sp,8
	jr	$ra
