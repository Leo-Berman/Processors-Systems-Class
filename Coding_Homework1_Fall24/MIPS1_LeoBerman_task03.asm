.data
	prompt: .asciiz "Input: " # Declare null terminated string to prompt user
	response: .asciiz "Output:\n" # Declare null terminated string to respond to user
	star: .asciiz "*" # load star
	blank: .asciiz " " # load space
	newline: .asciiz "\n"
.text

	task3:
		# write "Input:\nOutput:\n"
		la $a0,prompt # prompt the user to enter a number
		li $v0, 4 # load the instruction to prompt the user
		syscall # call the instruction
		li $v0, 5 # load the instruction to get an input
		syscall	# get the input 
		move $s0,$v0 # move that input into t0
		la $a0,response # load the prompt to show the outpt
		li $v0, 4 # load the instruction to write the output
		syscall # write the output
			
		# account for zero and 1 edge case
		beq $s0,$zero,myzero
		beq $s0,1,myone
			
		# set $s1 = display number - 1		
		move $s1,$s0 # set a variable to display number
		sub $s1,$s1,1 # subtract 1
		
		# set $s2 - display number -2
		move $s2,$s0 # set a variable to display number
		sub $s2,$s2,2 # subtract 1
						
																																								
		# write the first row
		# i = 0 go to tips function
		move $t0,$zero # i = 0
		jal tips # jump to tips routine and save current state in $ra
		la $a0,star # load  the asterisk into the output
		li $v0, 4 # load the instruction to write the asterisk
		syscall # write the asterisk
		la $a0,newline # load the new line into the output
		li $v0, 4 # load the instruction to write a new line to out 
		syscall # write the new line
		
		sub $sp, $sp, 4 # initialize stack pointer
		
		# write the upper half of the diamond
		# i = 0 go to topbody function
		move $t0,$zero # i = 0
		jal topbody # jump to topbody routine 
		
		# write the lower half of the diamond
		# i = 0 go to bottombody function
		move $t0,$zero # i = 0
		jal bottombody # jump to bottombody routine 
		
		# write the last row
		# i = 0 go to tips function
		move $t0,$zero # i = 0
		jal tips # jump to tips routine and save current state in $ra
		la $a0,star # load  the asterisk into the output
		li $v0, 4 # load the instruction to write the asterisk
		syscall # write the asterisk
		
		# free the stack pointer and exit gracefully
		add $sp, $sp, 4
		li $v0, 10 # load exit() 
		syscall # execute exit()
	
	# jump to what is in $ra
	return:
		jr $ra # jump to $ra unconditionally
	
	# get what is in the first element of the stack pointer
	# and jump there
	bodyreturn:
		lw $ra, 0($sp) # get the first element of stack pointer
		jr $ra # jump there
	
	# write the tips of the diamond
	tips:
		
		# if i < display number - 1 then return
		slt $t1,$t0,$s1 # if i < display number -1
		beq $t1,$zero,return # return
		
		# else write a space, increment counter, and loop
		la $a0,blank # load a " " into output register
		li $v0, 4 # load the write instruction
		syscall # execute the write instruction
		add $t0, $t0, 1 # i += 1
		j tips # other wise loop
	
	# write the upper half of the diamond
	topbody:
	
		# load position in main into the stack pointer
		sw $ra, 0($sp)	# load $ra into the stack
		
		# main loop
		topbodyloop:
		
			# if i < display number - 1 return to position in main
			slt $t3,$t0,$s1 # set $t3 to zero if i >= display number - 1
			beq $t3,$zero,bodyreturn # return to main function
			
			# write the left side of the top of the diamond
			# set j = 0 and its upper limit to display number - i - 2
			move $t1, $zero # j = 0
			move $t2, $s0 # upperlimit = display number
			sub $t2, $t2, $t0 # upper limit = display number - i
			sub $t2, $t2, 2 # upper limit = display numer - i - 2 
			jal topbodyleft # jump to function that prints the spaces on the left side of the diamond
			la $a0,star # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk
			
			# write the right side of the top of the diamond
			# set j = 0 and its upper limit to 2 * i + 1
			move $t1, $zero # j = 0
			move $t2, $t0 # upper limit = i
			mulo $t2, $t2, 2 # upper limit = 2 * i
			add $t2, $t2, 1 # upper limit = 2 * i + 1
			jal topbodyright # jump to function that prints the spaces on the right side of the diamond
			la $a0,star # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk
			
			# write a new line to increment the row
			la $a0,newline # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk
			
			# i+=1 and loop
			add $t0, $t0, 1 # i += 1
			j topbodyloop # loop
		

		# print the spaces to the left of the diamond
		topbodyleft:
			slt $t3,$t1,$t2 # if j < displaynumber - i - 2, set $t3 = 0
			beq $t3,$zero,return # return if $t3 = 0
			la $a0,blank # load " " into register
			li $v0, 4 # load write instruction
			syscall # write the " "
			add $t1,$t1,1 # j += 1
			j topbodyleft # loop
		
		# print the space to the right of the diamond
		topbodyright:
			slt $t3,$t1,$t2 # if j < displaynumber - i - 2, set $t3 = 0
			beq $t3,$zero,return # return if $t3 = 0
			la $a0,blank # load " " into register
			li $v0, 4 # load write instruction
			syscall # write the " "
			add $t1,$t1,1 # j += 1
			j topbodyleft # loop
	
	# write the lower half of the diamond
	bottombody:
	
		# load position in main into the stack pointer
		sw $ra, 0($sp)	# load $ra into the stack
		
		# main loop
		bottombodyloop:
		
			# if i < display number - 2 return to position in main
			slt $t3,$t0,$s2 # if i < display number - 2, set $t3 = 0
			beq $t3,$zero,bodyreturn # return to main function if $t3 = 0
			
			# write the left side of the bottom half of the diamond
			# j = 0, upper limit = i+1
			move $t1, $zero # j = 0
			move $t2, $t0 # set upper limit as i
			add $t2, $t2, 1 # set upp limit as i+1
			jal bottombodyleft # jump to function that writes the spaces to the left			
			la $a0,star # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk

			# write the right side of the bottom half of the diamond
			# j = 0, upper limit = 2 * (diaond size - i - 2) - 1			
			move $t1, $zero # j = 0
			move $t2, $s0 # j upper limit = diamond size
			sub $t2, $t2, $t0 # upper limit = diamond size - i
			sub $t2, $t2, 2 # upper limit = diamond size -i -2
			mulo $t2, $t2, 2 # upper limit = 2 * (diamond size - i - 2)
			sub $t2, $t2, 1 # upper limit = 2 * (diamond size - i - 2) - 1
			jal bottombodyright # jump to the function that writes the spaces to the right
			la $a0,star # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk
			
			# write a new line to increment to a new row
			la $a0,newline # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk
			
			# i+=1 loop
			add $t0, $t0, 1 # i += 1
			j bottombodyloop # loop
		

		# print the spaces to the left of the diamond
		bottombodyleft:
			slt $t3,$t1,$t2 # if j < displaynumber - i - 2
			beq $t3,$zero,return # return
			la $a0,blank # load " " into register
			li $v0, 4 # load write instruction
			syscall # write the " "
			add $t1,$t1,1 # j += 1
			j bottombodyleft # loop
		
		# print the spaces to the right of the diamond
		bottombodyright:
			slt $t3,$t1,$t2 # if j < displaynumber - i - 2
			beq $t3,$zero,return # return
			la $a0,blank # load " " into register
			li $v0, 4 # load write instruction
			syscall # write the " "
			add $t1,$t1,1 # j += 1 
			j bottombodyleft # loop
	
	myzero:
		li $v0, 10 # load exit() 
		syscall # execute exit()
	myone:
	
		la $a0,star # load the asterisk into the write buffer
		li $v0, 4 # load the write instruction
		syscall # write the asterisk
		li $v0, 10 # load exit() 
		syscall # execute exit()
	