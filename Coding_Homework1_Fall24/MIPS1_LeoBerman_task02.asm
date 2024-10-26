.data
	prompt: .asciiz "Enter a number to find factorial: " # Declare null terminated string to prompt user
	response: .asciiz "Here's your answer: " # Declare null terminated string to respond to user
.text

	task2:
		la $a0,prompt # prompt the user to enter a number
		li $v0, 4 # load the instruction to prompt the user
		syscall # call the instruction
		li $v0, 5 # load the instruction to get an input
		syscall	# get the input 
		move $t0,$v0 # move that input into t0
		move $s0,$t0 # i = input number
		jal facto # jump to facto routine and save current state in $ra
		li $v0, 10 # load exit() 
		syscall # execute exit()


	facto:
		sub $s0,$s0,1 # subtract 1 from i 
		beq $s0,0,respond # if it's 0 zero branch to another routine
		mulo $t0, $t0, $s0 # multiply the number by i and store it in t0
		j facto # jump back to the top of the loop
		
	respond:
		la $a0,response # prepare the response
		li $v0,4 # prepare the print instruction
		syscall # print the response
		move $a0, $t0 # move t0 (our answer) into $0 
		li $v0, 1 # load the instruction to print an integer
		syscall # print the integer
		jr $ra # return
		