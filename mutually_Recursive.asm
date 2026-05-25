.data
		space: .asciiz " "
		newLine: .asciiz "\n"
.text
	
	main:
		add $s0, $zero, $zero # i = 0
		
		
	loop_start:
	
	addi $t0, $zero, 11      # Buffer
	
	slt $t1, $s0, $t0        # if i < 11
	beq $t1, $zero, exit
	
	add $a0, $s0, $zero
	jal male
	
	add $a0, $v0, $zero # kopiere in a0 das Ergebnis
	addi $v0, $zero, 1
	syscall
	
	la $a0, space        # space laden
	addi $v0, $zero, 4  
	syscall
	
	add $a0, $s0, $zero
	jal female
	
	add $a0, $v0, $zero # kopiere in a0 das Ergebnis
	addi $v0, $zero, 1
	syscall
	
	la $a0, newLine      # new line
	addi $v0, $zero, 4
	syscall
	
	addi $s0, $s0, 1         # i = i + 1
	j loop_start
	
	
	exit:
	
	addi $v0, $zero, 10
	syscall
	
	male: 
	
		addi $sp, $sp, -8
		sw $a0, 0($sp)  # a0 = n
		sw $ra, 4($sp)
		
		beq $a0, $zero, male_r
		
		addi $t0, $a0, -1 # t0 = n-1
		
		add $a0, $t0, $zero # n = n-1
		jal male # male(n-1)
		add $a0, $v0, $zero 
		jal female
		lw $t1, 0($sp) # basisadresse von n
		sub $v0, $t1, $v0 # n - f(m(n-1)
		
		lw $a0, 0($sp)  
		lw $ra, 4($sp)
		addi $sp, $sp, 8	
		jr $ra
		
		male_r:
		
			addi $v0, $zero, 0 # n = 0
			
			lw $a0, 0($sp)  
			lw $ra, 4($sp)
			addi $sp, $sp, 8
			jr $ra
			
			
			
	female: 
	
	
		addi $sp, $sp, -8
		sw $a0, 0($sp) # n
		sw $ra, 4($sp)
		
		beq $a0, $zero, female_r
		 
		 addi $t0, $a0, -1 # t0 = n - 1
		 
		 add $a0, $t0, $zero
		 jal female # f(n-1) in v0
		 add $a0, $v0, $zero
		 jal male # m(f(n-1)) in v0
		 
		 lw $t1, 0($sp) # n laden
		 sub $v0, $t1, $v0 # n - f(m(n-1)) in v0
		
		lw $a0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		jr $ra
		
		
		
		female_r: 
		
		addi $v0, $zero, 1 #  1 in v0
		
		lw $a0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		jr $ra
		
	
	
	
	
		