	# Insertion Sort

	.data
array:.word 2,1,6,4,5
	.text

main:
	la $t1,array		# t1=array
	addi $s0,$t1,19		#s0 is Size of the array is five, so last word is at an offset of 19
	addi $t1,$t1,4		#t1 stores the address of the first word of the array
	jal outer
	li $v0,10
	syscall

outer:
	bgt $t1,$s0,ExitOuter
	lw $t0,0($t1)
	addi $t2,$t1,-4
	lw $t3,0($t2)
	j inner
	addi $t2,$t2,4
	sw $t0,0($t2)
	addi $t1,$t1,4
	j outer

inner:
	bgt $t0,$t3,outer
	move $t4,$t2
	addi $t4,$t4,4
	sw $t3,0($t4)
	addi $t2,$t2,-4
	j inner

ExitOuter:
	jr $ra