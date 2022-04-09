	.data
	.text
	.globl main
main:	ori $v0,$0,5		# read_int()
	syscall
	or  $t0,$0,$v0		# $t0 = $v0 = valor lido
	ori $t2,$0,8		# $t2 = 8
	add $t1,$t0,$t0		# $t1 = $t0 + $t0 
	sub $t1,$t1,$t2
	or  $a0,$0,$t1
	ori $v0,$0,1
	syscall
	ori $a0,$0,'\n'
	ori $v0,$0,11
	syscall
	ori $v0,$0,34
	syscall
	ori $a0,$0,'\n'
	ori $v0,$0,11
	syscall
	ori $v0,$0,36
	syscall
	ori $a0,$0,'\n'
	ori $v0,$0,11
	syscall
	jr $ra
