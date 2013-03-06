# ASSIGNMENT 1

	.data
string: .space 20			# set aside 10 bytes in the memory for the string
	.text

main:
	la $a0,string			# load the address of the starting of the string in register a0
	li $a1,20				# load the size of the string in register a1
	li $v0,8				# load "read string" code in register v0
	syscall
	la $t0,string			# load the address of the starting of the string in register t0
	

	li $t5,10				# initialize register t5 with value 10
	li $t2,0				# initialize register t2 with the value zero
	li $s0,0				# initialize register s0 with the value zero
	li $t8,0				# initialize t8 with zero so default operation is addition
loop1:
	lb $t1,0($t0)			# load the byte at address t0 into the register t1
	beq $t1,61,exit			# jump to exit if end of the string is encountered
	beq $t1,43,Ladd
	beq $t1,45,Lsub
	mul $t2,$t2,$t5			# multiply the digit in t2 by 10 to form the number	
	addi $t3,$t1,-48			# register t3 contains the digit.
	add $t2,$t3,$t2			# register t2 will contain the number at the first position at the end of this loop1
	addi $t0,$t0,1			# increment t0 to the next character
	j loop1

loop2:
	lb $t1,0($t0)			# load the byte at address t0 into the register t1
	beq $t1,61,exit			# jump to exit if end of the string is encountered
	beq $t1,43,Ladd
	beq $t1,45,Lsub
	mul $t2,$t2,$t5			# multiply the digit in t2 by 10 to form the number
	addi $t3,$t1,-48			# register t3 contains the digit.	
	add $t2,$t2,$t3			# register t2 will contain the next number at the end of this loop2
	addi $t0,$t0,1			# increment t0 to the next character
	j loop2

Ladd:
	addi $t7,$zero,0			# set register t7 to 0 if addition operation is to be performed with the next number
	beq $t8,1,OpSub
	beq $t8,0,OpAdd

	

Lsub:

	addi $t7,$zero,1			# set register t7 to 1 if subtraction operation is to be performed with the next number
	beq $t8,1,OpSub
	beq $t8,0,OpAdd

OpAdd:
	add $s0,$s0,$t2			# add to the result this number
	li $t2,0				# reset register t2 to zero
	addi $t0,$t0,1			# increment t0 to the next character
	move $t8,$t7			# move current sign in register t8 from t7
	j loop2

OpSub:
	sub $s0,$s0,$t2			# subtract from the result this number
	li $t2,0				# reset register t2 to zero
	addi $t0,$t0,1			# increment t0 to the next character	
	move $t8,$t7			# move current sign in register t8 from t7
	j loop2
exit:
	beq $t8,0,Add
	sub $s0,$s0,$t2
	j smallexit
Add:
	add $s0,$s0,$t2
smallexit:
	move $a0,$s0
	li $v0,1				# This will print the contents of register a0 which holds the result
	syscall
	li $v0,10
	syscall
