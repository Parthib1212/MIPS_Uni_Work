.data
	mystr: .asciiz "Das sollte nun auf dem Stack zu sehen sein"
		.align 2


.text


	main: 
	la $a0, mystr   # string in a0 lesen
	add $v0, $zero, $zero # N
	jal strlen
	
	
	addi $t1, $v0, 1  # N + 1
	
	addi $t2, $t1, 3 # t2 = (N + 1) + 3
	
	addi $t3, $zero, -4 # t3 = -4
	
	and $t4, $t2, $t3 # M = ( (N + 1) + 3 ) & ~ 3
	
	addi $t5, $t4, 4 # M + 4byte
	
	sub $sp, $sp, $t5  
	
	
	la $a0, mystr #anfang setzen
	add $a1, $sp, $zero  #sp + 0 -- schreiben
	
	copy_loop: 	
	
		lb $t6, 0($a0)   # t6 = mystr[i]
		sb $t6, 0($a1) 
		
		beq $t6, $zero, print_step
		
		addi $a0, $a0, 1
		addi $a1, $a1, 1
		
		j copy_loop
		
	print_step: 
	
		add $t7, $sp, $t4 # t7 = sp + M
		sw $v0, 0($t7)
		
		
		add $a0, $sp, $zero # sp + 0
		jal printit
	
		add $sp, $sp, $t5
	
	j the_End
	

	
	
	strlen:
	
		lb $t0, 0($a0)
	
		beq $t0, $zero, exit #bis \0
	
		addi $a0, $a0, 1 # ein Byte weiter N + 1
		addi $v0, $v0, 1  # i++
	
		j strlen
	
	
	exit:
	
		jr $ra
		
	
	printit:
			
			addi $sp, $sp, -4
			
			sw  $ra, 0($sp)
	
	
		
			
			addi $v0, $zero, 4
			syscall
	
	
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			jr $ra
			
	
	
	
	the_End: 
	
			
			addi $v0,$zero,10
			syscall
		
		
		
