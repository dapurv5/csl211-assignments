	#This program demonstrates how to input an array from the user.

	.data
A:.space 1024
	.text

.globl main
main:
	la $a0,A
	li $a1,10
	li $a2,1024
	li $v0,14
	syscall
	la $t0,A
	move $a0,0($t0)
	li $v0,5
	syscall
	li $v0,10
	syscall
