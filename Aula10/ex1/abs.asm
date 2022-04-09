	.data
	.text
	.globl abs1
abs1:	move	$v0,$a0
if:	bgez	$v0,endif
	mul	$v0,$v0,-1
endif:	jr	$ra