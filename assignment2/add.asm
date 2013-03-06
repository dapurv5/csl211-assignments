# Adds two numbers assuming that no carry bit is obtained
main:
li $s0,213416	#First half of 1st number
li $s1,433767	#second half of 1st number
li $s3,4584578 #First half of 2nd number
li $s4,4584578 #Second half of 2nd number
add $t0,$s0,$s3
add $t1,$s1,$s4
move $a0,$t0
li $v0,1
syscall
move $a0,$t1
li $v0,1
syscall
li $v0,10
syscall