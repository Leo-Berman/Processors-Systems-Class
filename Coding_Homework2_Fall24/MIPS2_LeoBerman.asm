.data
	
prompt: .asciiz ">>> " # Declare a null terminated string of the input prompt
valid: .asciiz "Valid input\n"
invalid: .asciiz "Invalid input\n"
input: .space 64 # Declare space for what the user enters
	
.text
	
main:
	
	# get the user's input
	jal parse # parse the user input
	
	# validate that the user's input is a proper mathematical expression
	jal validate # check if it's a valid input

	# clear the user's previous input
	li $t1, 0 # initialize the loop index
	j clear_string # clear the buffer
	
validate:
	
	# initialize values
	la $s0, input # load the address of the user input
	li $t1, 0 # load index i 
	li $t3, 0 # parenthesis counter
	li $t6, 0 # is last number operable 0 means not operable
	li $t7, 1 # is number, 1 means not number
	li $t8, 0# is plus or minus, 0 means not plus or minus
	
	# go to loop
	add $sp, $sp, 4 # intialize stack pointer
	sw $ra, 0($sp) # load the position in main into the stack
	jal validation_loop # go the validation_pre
	
validation_loop:
		
	# if it reached the end of the loop, go to validity conditions
	beq $t1, 64, valid_input # if i == 64, return
	
	# get the next character in the string
	add $t0, $s0, $t1 # load the address of input + i 
	lbu $t5, 0($t0) # load the value of the current element	

	# if number
	beq $t5, 48, number # if 0
	beq $t5, 49, number # if 1
	beq $t5, 50, number # if 2
	beq $t5, 51, number # if 3
	beq $t5, 52, number # if 4
	beq $t5, 53, number # if 5
	beq $t5, 54, number # if 6
	beq $t5, 55, number # if 7
	beq $t5, 56, number # if 8
	beq $t5, 57, number # if 9
	li $t7, 1 # else set not number flag

	# if parenthesis
	beq $t5, 40, add_parenthesis # increment the parenthesis
	beq $t5, 41, sub_parenthesis # increment the parenthesis					
	
	# if operator
	beq $t5, 42, operators # if *
	beq $t5, 43, plus_minus # if +
	beq $t5, 45, plus_minus # if -
	beq $t5, 47, operators # if /
	
	# if " "
	beq $t5, 32, space
	
	# if new line (end of expr)
	beq $t5, 10, valid_input
	
	# if anything else
	j invalid_input # show invalid entry

space:
	# ignore white space
	li $t8, 0 # set for plus and minus
	add $t1, $t1, 1 # increment coutner
	j validation_loop # jump back

operators:

	# increment and get the next index
	add $t1, $t1, 1 # i += 1
	add $t0, $s0, $t1 # increment the index
	lbu $t5, 0($t0) # load the next character
	
	# check for any  invalid conditions before and after a operator
	beq $t6, 0, invalid_input # if last character is not operable
	beq $t5, 42, invalid_input # if *
	beq $t5, 47, invalid_input # if /

	
	# set flag for current character not being operable and jump back
	li $t8, 0 # set for plus and minus
	li $t6, 0 # current character not operable 
	j validation_loop # jump back 
				
plus_minus:
	
	# increment and get the next index
	add $t1, $t1, 1 # i += 1
	add $t0, $s0, $t1 # increment the index
	lbu $t5, 0($t0) # load the next character
	
	or $t9, $t8, $t6
	beq $t9,$zero,invalid_input
	
	# set flag for current character not being operable and jump back
	li $t8, 1 # set for plus and minus
	li $t6, 0 # current character not operable 
	j validation_loop # jump back 
																				
add_parenthesis:

	# Keep track of left parenthesis, and increment to the next character
	add $t1, $t1, 1 # i += 1
	add $t3, $t3, 1 # add left parenthesis
	add $t0, $s0, $t1 # get address of next character
	lbu $t5, 0($t0) # load the next character
	
	# check for any invalid condiions before and after left parenthesis
	beq $t6, 1, invalid_input # check to make sure last character wasn't operable
	beq $t5, 41, invalid_input # if it closes without anything inside()
	
	# set flag for current character no being operable and jump back
	li $t6, 0 # current character not operable
	li $t8, 0 # set for plus and minus
	j validation_loop # jump back
		
sub_parenthesis:

	# Keep track of closed parenthesis, and increment to the next character
	add $t1, $t1, 1 # i+=1
	beq $t3,$zero,invalid_input # if no left bracket
	sub $t3, $t3, 1 # close bracket
	
	# check for any invalid conditions before closing parenthesis
	beq $t6, 0, invalid_input # if non operable, say invalid
	
	# set flag for current character to be operable and jump back
	li $t6, 1 # current character operable
	li $t8, 0 # set for plus and minus
	j validation_loop # jump back

number:
	# check if ")" comes before number
	and $t8, $t6, $t7 # check if operable and not a number
	beq $t8, 1, invalid_input # if end parenthesis, number not valid
	
	# keep track of the character being an operable digit
	li $t7, 0 # say number
	li $t6, 1 # current character operable
	
	# increment the character and jump back
	li $t8, 0 # set for plus and minus
	add $t1, $t1, 1 # i+=1
	j validation_loop # jump back
	
parse:
	# Print the input prompt
	la $a0, prompt # Load the prompt into the print register
	li $v0,4 # Load the instruction to print
	syscall # Print
	
	# Receive the user input
	li $v0, 8 # load input instruction
	la $a0, input # load where to save input
	li $a1, 64 # save size of inpu t
	syscall # get input

	# return to main	
	jr $ra
	
valid_input:

	# check to see if the last character was an operator or open parenthesis
	beq $t6,0,invalid_input
	bne $t3, 0, invalid_input # check if there are more left parenthesis than right parenthesis
	
	# print the valid expression message
	la $a0, valid # load the valid message
	li $v0, 4 # loa the instruction
	syscall # print the valid message
	
	# go back to main and free the stack pointer
	lw $ra, 0($sp) # load the point in mai
	sub $sp, $sp, 4 # free stack pointer
	jr $ra
	
invalid_input:

	# print the invalid expression message
	la $a0, invalid # load the invalid message
	li $v0, 4 # load the instruction
	syscall # print the valid message
	
	# go back to main and free the stack pointer
	lw $ra, 0($sp) # load the point in mai
	sub $sp, $sp, 4 # free stack pointer
	jr $ra # return to main
	
clear_string:

	# get the address of the character and lear it
	add $t0, $s0, $t1 # load the address of input + i 
	sb $zero,0($t0) # clear the memory
	
	# increment, check if end of string is reached, and jump back
	add $t1, $t1, 1 # increment i
	beq $t1, 64, main # if i == 64, return
	j clear_string # jump to top of loop
