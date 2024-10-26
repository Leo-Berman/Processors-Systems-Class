.data
	Y: .asciiz "Leo Berman" # Declare a null terminated string of my name
	X: .space 11 # Declare space for result
.text
task1:
	jal strcpy # jump to strcpy routine and save current state in $ra
	li $v0, 10 # load exit() 
	syscall # execute exit()
strcpy:
	la $a1,Y # load the address of Y into $a1 register
	la $a0,X # load the address of X into $a0 register
	add $s0, $zero, $zero # i = 0
	L1:
		add $t1, $s0, $a1 # Load the address of Y + i
		lbu $t2, 0($t1) # load 4 bits from the value stored at t1
		add $t3, $s0, $a0 # Load the address of X + i
		sb $t2, 0($t3) # store 32 bits from t2 into t3
		beq $t2, $zero, L2 # if t2 is 0 (null character jump to Le
		addi $s0, $s0, 1 # increment loop counter
		j L1 # jump back
	L2: 
		li $v0, 4 # load print instruction
		syscall # execute print instuction
		jr $ra # return back to address store in ra
