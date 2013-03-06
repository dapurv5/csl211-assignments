#Assignment 2
.data
array: .word 5,7,2,1,-7,-9,5
msgmin: .asciiz "The minimum number is"
msgmax: .asciiz "The maximum number is"
.text
main:
la $s2,array		#s2 contains the base address of the array
lw $s0,array($zero)	#s0 contains the first element of the array, as default minimum
lw $s1,array($zero)	#s1 contains the first element of the array, as default maximum
li $s3,6		#s3 contains the length of the array
li $t2,-1		#t2=0 is used for variable i
li $t3,0		#t3=0 is used for variable A[i]
li $t4,-4		#t4=0 used for storing 4*i
loop:
addi $t2,1		#i++
bgt $t2,$s3,endLoop	#if i==4
addi $t4,$t4,4		#t4=t4+4
lw $t3,array($t4)	#t3=A[i]
blt $t3,$s0,swapmin	#if A[i]<min goto swapmin
bgt $t3,$s1,swapmax
j loop			#goto loop
swapmin:
move $s0,$t3		#else max=A[i]
j loop			#goto loop
swapmax:
move $s1,$t3		#else max=A[i]
j loop			#goto loop
endLoop:
la $a0,msgmin
li $v0,4
syscall
move $a0,$s0
li $v0,1
syscall
la $a0,msgmax
li $v0,4
syscall
move $a0,$s1
li $v0,1
syscall
li $v0,10
syscall
