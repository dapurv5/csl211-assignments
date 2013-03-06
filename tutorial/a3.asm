	#ASSIGNMENT 3

	.data
A:.word 3,8,4,5,6,9,1,0,7,2
	.text

.globl merge
merge:
	addi $sp,$sp,-44
	sw $t0,0($sp)				# store the temporary registers on the stack
	sw $t1,4($sp)
	sw $t2,8($sp)
	sw $t3,12($sp)
	sw $t4,16($sp)
	sw $t5,20($sp)
	sw $t6,24($sp)
	sw $t7,28($sp)
	sw $t8,32($sp)
	sw $t9,36($sp)
	sw $ra,40($sp)

	sub $t0,$a2,$a1				# t0 corresponds to n1, a1 to p and a2 to q. n1=q-p
	addi $t0,$t0,1				# n1=q-p+1
	sub $t1,$a3,$a2				# t1 corresponds to n2. n2=r-q
	addi $t3,$t0,1				# t3=n1+1
	addi $t4,$t0,1				# t4=n2+1
	addi $t5,$zero,4				# temporarily store 4 in register t5
	mul $t3,$t3,$t5				# t3=t3*4
	mul $t4,$t4,$t5				# t4=t4*4
	add $t3,$t3,$t4				# t3=t3+t4
	addi $t5,$zero,-1				# temporarily store -1 in register t5
	mul $t3,$t5,$t3				# t3=-t3
	add $sp,$sp,$t3				# create space in the stack for the temporary arrays L and R that are created
	

.globl main
main:
	li $v0,10
	syscall