# This program demonstrates how to take a string input from the user.

	.data
string: .space 10			# set aside 10 bytes in the memory for the string
	.text

main:
la $a0,string			# load the address of the starting of the string in register a0
li $a1,10				# load the size of the string in register a1
li $v0,8				# load "read string" code in register v0
syscall

li $v0,10
syscall
