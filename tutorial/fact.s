#Compute the factorial of a number

n:	.word 5

result:	.space 4

	.text
	.globl main

main:	#Save the return address
	addi $sp,$sp,-4
	sw $ra,0($sp)
	lw $a0, n($0)

	jal fact
	sw $v0, n($0)
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra


fact:	#First thing we do is save the return address on the stack.
	#How do we make this more efficient? Only use the stack for
	#$ra when we need it.
	addi $sp,$sp,-4
	sw $ra,0($sp) #push $ra on the stack
	#fact of 0 is 1
	bne $a0,$zero,not_zero
	#Set $v0 to be 1
	addi $v0,$zero,1
	#Restore $ra from the stack	
	lw $ra,0($sp) #Read $ra from the stack
	addi $sp,$sp,4 #restore the stack pointer.
	jr $ra
not_zero: 
	#Here we must compute n*fact(n-1).
	#So we will push n on the stack call fact(n-1) pop
	#recover n from the stack and multiply it by the answer.
	addi $sp,$sp,-4
	#remember $a0 is n
	sw $a0,0($sp)
	addi $a0,$a0,-1
	#So call fact with our new parameter
	jal fact
	#Now if all has gone well $v0 should contain the result of fact(n-1)
	#But n is on the stack.
	lw $t0,0($sp)
	#Why did we push n on the stack, we didn't we use $t0?
	addi $sp,$sp,4
	mul $v0,$v0,$t0
	#$v0 = fact(n-1) ($v0) * n ($t0)
	#Restore the stack for $ra
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
