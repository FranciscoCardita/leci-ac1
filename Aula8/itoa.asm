# mapa de registos
# n: 		$a0 -> $s0
# b: 		$a1 -> $s1
# s: 		$a2 -> $s2
# p: 		$s3
# digit: 	$t0
# Sub-rotina intermédia
	.text
	.globl itoa
itoa:	addiu	$sp,$sp,-20	#
	sw	$ra,0($sp)	#
	sw	$s0,4($sp)	#
	sw	$s1,8($sp)	#
	sw	$s2,12($sp)	#
	sw	$s3,16($sp)	#
	move	$s0,$a0		#
	move	$s1,$a1		#
	move	$s2,$a2		#
	move	$s3,$a2		#
do:				# do {
	rem	$t0,$s0,$s1	#	digit = n % b;
	div	$s0,$s0,$s1	#	n = n / b;
	move	$a0,$t0		#	*p++ = toascii(digit);
	jal	toascii		#
	sb	$v0,0($s3)	#
	addiu	$s3,$s3,1	#
while:	bgtz	$s0,do		# } while(n > 0);
	sb	$0,0($s3)	# *p = '\0';
	move	$a0,$s2		#
	jal	strrev		# strrev(s);
	lw	$ra,0($sp)	#
	lw	$s0,4($sp)	#
	lw	$s1,8($sp)	#
	lw	$s2,12($sp)	#
	sw	$s3,16($sp)	#
	addiu	$sp,$sp,20	#
	jr	$ra		#
########
toascii:addi	$t0,$t0,'0'	# v += '0';
if:	ble	$t0,'9',endif	# if(v > '9')
	addi	$t0,$t0,7	#	v += 7;
endif:	move	$v0,$t0		#
	jr	$ra		#