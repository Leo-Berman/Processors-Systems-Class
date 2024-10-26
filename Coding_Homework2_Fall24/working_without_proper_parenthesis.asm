.data
	
prompt: .asciiz ">>> " # Declare a null terminated string of the input prompt
valid: .asciiz "Valid input\n"
invalid: .asciiz "Invalid input\n"
input: .space 64 # Declare space for what the user enters
	
.text
	
main:
	
	jal parse # parse the user input
	
	jal validate # check if it's a valid input

	j valid_input
validate:

	la $s0, input # load the address of the user input
	li $t1, 0 # load index i 
	li $t3, 0 # parenthesis counter
	li $t6, 0 # is last number operable 0 means not operable
	
	add $sp, $sp, 4 # intialize stack pointer
	sw $ra, 0($sp) # load the position in main into the stack
	jal validation_loop # go the validation_pre
	lw $ra, 0($sp) # load the point in mai
	sub $sp, $sp, 4 # free stack pointer
	
	bne $t3, $zero, invalid_input # check if there are more left parenthesis than right parenthesis
	
	jr $ra # return to main
	
validation_loop:
		
	add $t0, $s0, $t1 # load the address of input + i 
	lbu $t5, 0($t0) # load the value of the current element	

	# if parenthesis
	beq $t5, 40, add_parenthesis # increment the parenthesis
	beq $t5, 41, sub_parenthesis # increment the parenthesis					
	
	# if operator
	beq $t5, 42, operators # if *
	beq $t5, 43, operators # if +
	beq $t5, 45, operators # if -
	beq $t5, 47, operators # if /
	
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
	
	
	add $t1, $t1, 1 # increment i
	beq $t1, 64, return # if i == 64, return
	j validation_loop # jump to top of loop
	
operators:

	add $t1, $t1, 1 # i += 1
	
	add $t0, $s0, $t1 # increment the index
	lbu $t5, 0($t0) # load the next character
	
	beq $t6, 0, invalid_input # if last character is not operable
	beq $t5, 42, invalid_input # if *
	beq $t5, 43, invalid_input # if +
	beq $t5, 45, invalid_input # if -
	beq $t5, 47, invalid_input # if /
	
	li $t6, 0 # current character not operable 
	
	j validation_loop # jump back 
												
add_parenthesis:

	add $t1, $t1, 1 # i += 1
	add $t3, $t3, 1 # add left parenthesis

	add $t0, $s0, $t1 # get address of next character
	lbu $t5, 0($t0) # load the next character
	
	beq $t5, 41, invalid_input # if it closes without anything inside()
	
	li $t6, 0 # current character not operable
	j validation_loop # jump back
		
sub_parenthesis:
	add $t1, $t1, 1 # i+=1
	beq $t3,$zero,invalid_input # if no left bracket
	sub $t3, $t3, 1 # close bracket
	
	li $t6, 1 # current character operable
	j validation_loop # jump back

number:
	add $t1, $t1, 1 # i+=1
	li $t6, 1 # current character operable
	j validation_loop # jump back

return:
	jr $ra
	
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
	la $a0, valid # load the valid message
	li $v0, 4 # loa the instruction
	syscall # print the valid message
	sub $sp, $sp, 4 # free the stack pointer
	j main
	
invalid_input:
	la $a0, invalid # load the invalid message
	li $v0, 4 # load the instruction
	syscall # print the valid message
	sub $sp, $sp, 4 # free the stack pointer
	j main