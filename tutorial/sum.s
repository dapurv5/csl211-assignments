	.data
n1:	.word 10	        #Maximum value to sum to.

result:	.space 4

	.text
	.globl main
main:	lw $s0, n1($0)	        #s0 contains the maxium sum.
	add $s1,$zero,$zero	#set $s1 to zero which
		                #hold the partial sum.
loop:	beq $s0,$zero,exit
	add $s1,$s0,$s1
	sub $s0,$s0,1
	j loop
exit:	sw $s1, result($0)
	jr $31       # store result in memory.


