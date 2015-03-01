.data
.text

main:
## Code Part 1
ori $v0, $0, 5 			#load read_int into syscall
syscall 				# make the syscall
addu $t0, $0, $v0 		# move the number read into $t0

## get second number from user
ori $v0, $0, 5 			# load read_int
syscall					# make the call
addu $t1, $0, $v0		# move the number read

add $t2, $t0, $t1		# do the add

ori $v0, $0, 5			# load read_int into syscall
syscall					# make the syscall
addu $t1, $0, $v0		# move the number read into $t0

add $t0, $t1, $t2		# do the add

##print out
addu $a0, $0, $t0		# move the number into a0
ori $v0, $0, 1			# load print_int into syscall
syscall					# make the call

ori $v0, $0, 10			# syscall for exit
syscall					# make the call

## end of lab3.asm
