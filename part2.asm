.data
str1:	.ascii "Numbers:\n"
str2:	.ascii "\n"
x: 		.word 18,12,6,500,54,3,2,122
.text

main:
## print str1
la $a0, str1
ori $v0, $0, 4
syscall

## print numbers

add $t1, $0, $0
la $t4, x

loop:
slti $t3, $t1, 8
bne $t3, 1, branched
lw $t2, 0($t4)

add $a0, $0, $t2
ori $v0, $0, 1
syscall

la $a0, str2
ori $v0, $0, 4
syscall

addi $t4, $t4, 4
addi $t1, $t1, 1
j loop
branched:

ori $v0, $0, 10			# syscall for exit
syscall					# make the call
