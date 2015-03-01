.data
x:	.space 40
str1:	.ascii "Enter numbers:\n\0"
str2:	.ascii "Enter search number:\n\0"
str3:	.ascii "Occurance indexes are:\n\0"
str4:	.ascii "Number of occurances:\n\0"
str5:	.ascii "\n\0"
.text

## print str1
la $a0, str1
ori $v0, $0, 4			## print string
syscall				## do it

## using t0 as x and t1 for counter
la $t0, x
and $t1, $0, $0

enter_loop:
slti $t2, $t1, 10
beq $t2, 0, enter_done

ori $v0, $0, 5
syscall

sw $v0, ($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
j enter_loop

enter_done:

## print str2
la $a0, str2
ori $v0, $0, 4			## print string
syscall				## do it

ori $v0, $0, 5
syscall				## call get_int

add $t3, $0, $v0		## search number is in t3
la $t0, x
addi $t1, $0, 0			## loop counter
addi $t6, $0, 0			## occurence counter

la $a0, str3
ori $v0, $0, 4			## print string
syscall	

search_loop:
slti $t2, $t1, 10
beq $t2, 0, search_done

lw $t7, ($t0)
bne $t7, $t3, not_found

addi $t6, $t6, 1		## add to occurence
add $a0, $0, $t1		## move index into a0
ori $v0, $0, 1			## get ready to print_int
syscall				## do it
la $a0, str5
ori $v0, $0, 4			## print string
syscall

not_found:
addi $t0, $t0, 4
addi $t1, $t1, 1
j search_loop

search_done:

la $a0, str4
ori $v0, $0, 4			## print string
syscall

add $a0, $0, $t6
ori $v0, $0, 1
syscall	


ori $v0, $0, 10
syscall
