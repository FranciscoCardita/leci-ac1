# mapa de registos:
# $v0: res
# $a0: s
# $t0: *s
# $t1: digit
	.globl atoi
atoi:	li	$v0,0		# res = 0;
while:	lb	$t0,0($a0)	# while( (*s >= '0') && (*s <= '9') )
	blt	$t0,'0',endw	#
	bgt	$t0,'1',endw	# {
	#bgt	$t0,'9',endw	# {
	sub	$t1,$t0,'0'	#	digit = *s - '0';
	addiu	$a0,$a0,1	#	s++;
	mul	$v0,$v0,2	#	res = res * 10(2 bin);
	add	$v0,$v0,$t1	#	res = res * 10(2 bin) + digit;
	j 	while		# }
endw:	jr	$ra		#