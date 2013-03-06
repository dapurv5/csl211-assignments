	#ASSIGNMENT 2

	.data
A: .space 10					# set aside space for the array
msg: .asciiz "Enter element at index"			# message to be printed
	.text

main:
	li $t0,0					# 
	la $s0,A
inputArray:
	la $a0,msg				# to print the message
	li $v0,4
	syscall
	move $a0,$t0				# to print the index
	li $v0,1
	syscall
	li $v0,5					# for inputting the value
	syscall					
	move $t1,$v0				# placing the inputted value in register t1
	sw $t1,0($s0)
	addi $t0,$t0,1				# increment the value of the index
	addu $s0,$s0,1				# make s0 point to the next index of the array
	blt $t0,10,inputArray			# jump to inputArray if 10 elements have not been inputted
	
	li $v0,10					# exit
	syscall