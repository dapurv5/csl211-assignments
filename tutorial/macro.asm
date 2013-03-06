	# THIS PROGRAM ILLUSTRATES THE USE OF MACROS but will not work

	.data
int_str:.asciiz "%d"
	.text

.macro print_int($arg)		# Creating the macro
la $a0,int_str			# load the address of int_str in register a0
move $a1, $arg			# load macro parameter in second argument
jal printf
.end_macro

li $7,5				# load the value 5 in $7
print_int($7)
li $v0,10
syscall

	