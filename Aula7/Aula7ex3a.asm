# mapa de registos:
# $t0 - i
# $t1 - dst
# $t2 - src
	.data
	.text
	.globl main
strcpy:	la	$t0,0		# i = 0;
do:	addu	$t1,$t1,$t0	# &dst[i]
	addu	$t2,$t2,$t0	# &src[i]
	lb	$t2,0($t2)	# dst[i]
	sb	$t2,0($t1)	# dst[i] = src[i];
while:	