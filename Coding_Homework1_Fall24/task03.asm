.data
	prompt: .asciiz "Input: " # Declare null terminated string to prompt user
	response: .asciiz "Output:\n" # Declare null terminated string to respond to user
	star: .asciiz "*" # load star
	blank: .asciiz " " # load space
	newline: .asciiz "\n"
.text

	task3:
		la $a0,prompt # prompt the user to enter a number
		li $v0, 4 # load the instruction to prompt the user
		syscall # call the instruction
		li $v0, 5 # load the instruction to get an input
		syscall	# get the input 
		move $t0,$v0 # move that input into t0
		
		la $a0,response # load the prompt to show the outpt
		li $v0, 4 # load the instruction to write the output
		syscall # write the output
		
		move $s0,$zero # i = input number
		add $s0,$s0,1 # i += 1
		jal tips # jump to tips routine and save current state in $ra
		la $a0,star # load  the asterisk into the output
		li $v0, 4 # load the instruction to write the asterisk
		syscall # write the asterisk
		
		la $a0,newline # load the new line into the output
		li $v0, 4 # load the instruction to write a new line to out 
		syscall # write the new line
		
		move $s0,$zero # i = 0
		sub $sp,$sp,4 # move the stack pointer
		jal topbody # jump to topbody routine 
		add $sp,$sp,4 # "free" the stack pointer
		
		move $s0,$t0 # i = input number
		sub $s0,$s0,2 # i -= 2
		sub $sp,$sp,4 # move the stack pointer
		jal bottombody # jump to bottombody routine
		add $sp,$sp,4 # "free" the stack pointer
		
		move $s0,$zero # i = 0
		add $s0,$s0,1 # i+=1
		jal tips # jump to tips routine and save current state in $ra
		la $a0,star # load the asterisk into the write array
		li $v0, 4 # load the instruction to write the write array
		syscall # write the asterisk
		
		li $v0, 10 # load exit() 
		syscall # execute exit()
	
	return:
		jr $ra # jump to $ra unconditionally
	
	tips:
		la $a0,blank # load a " " into output register
		li $v0, 4 # load the write instruction
		syscall # execute the write instruction
		add $s0, $s0, 1 # i += 1
		beq $s0,$t0,return # if i = input number return back to $ra
		j tips # other wise loop
		
	topbody:	
		sw $ra, 0($sp)	# load $ra into the stack
		sub $t2, $t0, 1 # $t2 = input number - 1
		topbodyloop:
			add $s0, $s0, 1 # i += 1
					
			# Top left of top half of diamond
			move $s1,$zero # j = 0
			move $t1, $t0 # $t1 = input number
			sub $t1, $t1, 1 # $t1 -= 1
			sub $t1, $t1, $s0 # $t1 -=i
			jal topbodyinnerloop_one # jump to the topleft function
			la $a0,star # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk
			
			# Top right of top half of diamond
			move $s1,$zero	# j = 0
			move $t1, $s0 # $t1 = input number
			mulo $t1,$t1,2 # $t1 *= 2
			sub $t1,$t1,1 # $t1 -= 1
			jal topbodyinnerloop_two # jump to the right half of the top body function
			la $a0,star # load the asterisk into the write buffer
			li $v0, 4 # load the write instruction
			syscall # write the asterisk
			
			# new row
			la $a0,newline # load a new line into the buffer
			li $v0, 4 # load the write instruction
			syscall # write the new line
			beq $s0,$t2,topbodyreturn # if i = input number - 1 exit function
			j topbodyloop # loop
			
			# left half
			topbodyinnerloop_one:
				beq $s1,$t1,return # if j = display number - 1 - i leave function
				la $a0,blank # load " " into register
				li $v0, 4 # load write instruction
				syscall # write the " "
				add $s1, $s1, 1 # j += 1
				j topbodyinnerloop_one # loop
			
			# right half
			topbodyinnerloop_two:
				beq $s1,$t1, return # if j = display number * 2 - 1
				la $a0,blank # load " " into register
				li $v0, 4 # load write instruction
				syscall # write the " "
				add $s1, $s1, 1 # j += 1
				j topbodyinnerloop_two # loop
		
		topbodyreturn:
			lw $ra, 0($sp) # load the location in main into $ra
			jr $ra # return to $ra
			
	bottombody:	
		sw $ra, 0($sp)	# load $ra onto the stackk
		sub $t2, $t0, 1 # $t2 = display number - 1
		bottombodyloop:
			sub $s0, $s0, 1 # i -= 1
				
			# Bottom left of bottom half of diamond
			move $s1,$zero	# j = 0
			move $t1, $t0 # t1 = display number
			sub $t1, $t1, 2 # t1 -= 2
			sub $t1, $t1, $s0 # t1 -= i
			jal bottombodyinnerloop_one # jump to left half function
			la $a0,star # load asterisk into write buffer
			li $v0, 4 # load write instruction
			syscall # write the asterisk
			
			# Top right of  half of diamond
			move $s1,$zero	# j = 0
			move $t1, $s0 # t1 = i
			mulo $t1,$t1,2 # t1 *= 2
			add $t1,$t1,1 # t1 += 1
			jal bottombodyinnerloop_two # jump to right half function
			la $a0,star # load asterisk into write buffer
			li $v0, 4 # load write instruction
			syscall # write the asterisk
			
			
			la $a0,newline # load newline into buffer
			li $v0, 4 # load write instruction
			syscall # write the newline
			
			slt $s3,$s0,$zero
			beq $s3,$zero,bottombodyreturn # if i = 0 return
			j bottombodyloop # loop
			
			bottombodyinnerloop_one:
				beq $s1,$t1,return # if j = display number - 2 - i
				la $a0,blank # load " " into write buffer
				li $v0, 4 # load write instruction
				syscall # write buffer
				add $s1, $s1, 1 # j += 1
				j bottombodyinnerloop_one # loop
				
			bottombodyinnerloop_two:
				slt $s3,$t1,$s1
				bne $s1,$t1, return # if j = i*2 + 1 return
				la $a0, blank # load " '" into owrite buffer
				li $v0, 4 # load write instruction
				syscall # write buffer
				add $s1, $s1, 1 # j += 1
				j bottombodyinnerloop_two # loop
		bottombodyreturn:
			lw $ra, 0($sp) # load position in main function
			jr $ra # return to main function
