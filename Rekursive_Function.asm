.data
		

.text
	main :
	
	
	
#	addi $a0, $zero, 99
	
	
	
	addi $v0, $zero, 5
	syscall
	add $a0, $v0, $zero
	jal magic
	
	
	add $a0, $v0, $zero
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall

	magic: 

		addi $sp, $sp, -8
		sw $ra, 4($sp)
		sw $a0, 0($sp) # a0 = n
	
		addi $t0, $zero, 100 #buffer
	
		slt, $t1,  $t0, $a0			#if 100 < n then t1 = 1
		beq $t1, $zero, else
	
		addi $v0, $a0, -10 # v0 = n - 10
	
	
	
		lw $ra, 4($sp)
		lw $a0, 0($sp)
		addi $sp, $sp, 8 
		jr $ra
	
	else:
	 
	  	addi $a0, $a0, 11 
	  	
	  	jal magic
	  	
	  	#v0 = magic(n+1)
	  	
	  	add $a0, $v0, $zero  #koppiere infos von m(n) und übergeben in parameter
	  	
	  	jal magic
	  	
	  	lw $ra, 4($sp)
		lw $a0, 0($sp)
		addi $sp, $sp, 8 
	  	jr $ra
	  	
	
	
	
	
	
	
