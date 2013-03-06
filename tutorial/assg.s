.data
no: .asciiz "Enter the number"
str: .asciiz "Sum="
.text
.globl main
main:
la $a0,no
li $v0,4
syscall
move $s0,$v0
li $v0,5
syscall
move $s1,$v0
li $v0,5
syscall
move $s2,$v0
add $s3,$s0,$s1
add $s4,$s3,$s2
la $a0,str
li $v0,4
syscall
move $a0,$s4
li $v0,1
syscall