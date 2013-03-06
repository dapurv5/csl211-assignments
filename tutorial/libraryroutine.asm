	# This program demonstrates the use of library routine printf but will  not work

	.data
int_str: .asciiz "%d"
	.text
.globl main
main:
	li $7,5
	la $a0,int_str
	move $a1,$7
	jal printf
	li $v0,10
	syscall