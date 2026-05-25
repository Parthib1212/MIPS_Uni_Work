.data 
	sieve: .space 4000
	size: .word 1000
	newLine: .asciiz "\n"
.text

	main:
	
		
			addi $sp, $sp, -4000
		
			addi $s0, $zero, 2 	#current_prime = 2
			add $s1, $sp, $zero	#anfang ist 0 basisAdress s1 = anfang
			
			
		
			
			addi $s4, $zero, 1	 # declaring s4 = 1
			
			add $a0, $s1, $zero
			jal init   # init_Array();
		
			do: 	
				#eliminate_multiple(current_prime)
				add $a0, $s0, $zero  #factor = current_prime
				add $a1, $s1, $zero   	 #basisAdresse Copy als Sicherheit
				jal prep_Multiples
			
				#current_prime = next_prime(current_prime)
				add $a0, $s0, $zero		# p = current_Prime
				add $a1, $s1, $zero
				jal prep_nxt
				add $s0, $v0, $zero   #current_Prime = next_Prime
				
				#while condition
				
				mul $t0, $s0, $s0	#current_prime * current_prime
				addi $t1, $zero, 1000	#size upperbound
				slt $t2, $t0, $t1
				bne $t2, $zero, do
				
				#print_prime
				add $a0, $s1, $zero
				jal prep_print
				
				j the_End #programm beended
			
		
			
		
	init:	
			addi $s3, $zero, 0 	#i = 0  & s3 = i
			addi $s2, $zero, 1000	 #upperbound
		
	for_loop: 
			
			
			slt $t0, $s3, $s2 	#if s3 < s2, dann t0 = 1
			beq $t0, $zero, exit
			
			
			# sieve[i] = $s1(anfang) + (i * 4)
			sll $t1, $s3, 2 	 # t1 = i * 4
			add $t2, $a0, $t1 	 #   startAdress + shiftedAdress = sieve[i]
			
			sw $s4, 0($t2)		 # von 0 bis ende macht alles 1
		
			
			addi $s3, $s3, 1	 #i++	
			
			
			j for_loop
					
	exit:
			
			
			sw $zero, 0($a0) 	# s[0] = 0
			
			addi $t7, $zero, 4
			
			add $t9, $a0, $t7 	 # t9 = anfang + 4 
			sw $zero, 0($t9) 	 #s[1] = 0
			
			jr $ra
			
			
	prep_Multiples:
			
			
			sll $t0, $a0, 1			 # t0 = factor * 2^1 // t0 = i & factor = $a0
	
			addi $t1, $zero, 1000		 #upper bound
	loop_mul:
		
			slt $t2, $t0, $t1 		 #if t0 < 1000 then t1 = 1
			beq $t2, $zero, exit_m
				
			sll $t3, $t0, 2  		#  $t3 = i * 2^2 shifitng
			
			
			
			add $t4, $a1, $t3			# anfang + t3
		
			sw $zero, 0($t4)		# macht sieve[i] = 0
		
			add $t0, $t0, $a0  	# i += factor
		
			j loop_mul
	exit_m: 
				jr $ra
	
	prep_nxt:
		
		
			
			addi $t0, $a0, 1		#a0 = p  t0 = p +1 t0 = i
			addi $t1, $zero, 1000		 #upper bound
		
	
	loop_nxt:
			slt $t2, $t0, $t1
			beq $t2, $zero, not_found
			
			sll $t3, $t0, 2			 # i * 4
			
			add $t4, $a1, $t3		#anfang + current
			
			lw $t5, 0($t4)			#load sieve[i]
			
			addi $t6, $zero, 1  		#t6 = 1
			beq $t5, $t6, return_i		#return 1
			
			
			
			add $t0, $t0, 1 #i++
	
			j loop_nxt
		
	not_found:
			addi $v0, $zero, -1 	#ansonsten -1 
			
			jr $ra
	
	
	return_i:
			add $v0, $t0, $zero 
			
			jr $ra
	
	
	prep_print:
			addi $t0, $zero, 0 	# i = 0 // t0 = i
			addi $t1, $zero, 1000		#upper bound
			add $t8, $a0, $zero		
			
	loop_print: 
	
			slt $t2, $t0, $t1 
			beq $t2, $zero, exit_print
			
			
			
			
			
			sll $t3, $t0, 2		# i *4
			add $t4, $t8, $t3	# anfang + current = sieve[i]
			
			
			# sieve[i] speichern
			lw $t5, 0($t4)
			
			addi $t7, $zero, 1 
			bne $t5, $t7, skip_print # if sieve[i] != 1 skip
			
			#print 
			addi $v0,$zero, 1 	#interger asugeben
			add $a0, $t0, $zero 
			syscall
			
			#newline
			addi $v0, $zero, 4	 #string ausgeben
			la $a0, newLine 
			syscall
			
	skip_print:
			addi $t0, $t0, 1 	# i++
			 
			 j loop_print
			 
			
			
			
	exit_print: 
			
				jr $ra
		
	the_End : 
			#frei geben und beedned
			addi $sp, $sp, 4000
			addi $v0, $zero, 10
			syscall									
			


			
			
			
	
			
			
		
		
	
