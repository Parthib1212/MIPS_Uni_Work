.data 
	const_one:  .float 1.0
	const_half: .float 0.5
	const_eps:  .float 0.00001
	prompt: .asciiz "Eine Fliessmkommazahl eingeben\n"
	msg_sq : .asciiz "\nWurzel\t"
	msg_i : "\nEingabewert\t"
	msg_p: .asciiz "\nProbe\t"
	
.text
	  

	main:
				# f12 argument und f0 return
				#quasi f0 = v0 und f12 = a0
	    addi $sp, $sp, -12
   	    sw   $ra, 8($sp)
 	    s.s  $f20, 4($sp)           
 	    s.s  $f22, 0($sp)
	addi   $v0, $zero,  4
   	la   $a0, prompt
    	syscall
	
	addi $v0, $zero, 6 #einlesen
	syscall
	
	mov.s $f20, $f0  # eingabewert in f20 sichern
	
	mov.s $f12, $f0 # in argument übergeben
	
	jal naive_sqrt
	
	mov.s $f22, $f0  # wurzel = f22 // wurzel = naive_sqrt(x)
	
	
	mul.s $f24, $f22, $f22 #proble würzel^2 
	
	
	addi $v0, $zero, 4
	la $a0, msg_i
	
	mov.s $f12, $f20 
	addi $v0, $zero, 2
	syscall
	
	addi $v0, $zero, 4
	la $a0, msg_sq
	syscall
	
	mov.s $f12, $f22
	addi $v0, $zero, 2
	syscall
	
	#probe ausgeben
	addi $v0,$zero, 4
	la $a0, msg_p
	syscall
	
	mov.s $f12, $f24
	addi $v0, $zero, 2
	syscall
	
	
	 lw   $ra, 8($sp)
   	 l.s  $f20, 4($sp)
   	 l.s  $f22, 0($sp)
   	 addi $sp, $sp, 12
	
	addi $v0, $zero, 10
	syscall
	
	

	naive_sqrt:
					
		lwc1 $f4, const_one  # $f4 = 1.0
		lwc1 $f6, const_half # $f6 = 0.5
		lwc1 $f14, const_eps
		
		mov.s $f0, $f4 # f0 = 1.0 (result)
		
		
	do:
			
		div.s $f8, $f12, $f0 # temp =  x/ result f12 = x
		add.s $f8, $f8, $f0 # temp =  r + result
		mul.s $f8, $f8, $f6 # temp = r * .5
		
		sub.s $f10, $f8, $f0		#delta = temp - result
		
		abs.s $f10, $f10 # betrag von Delta = f10
		
		mov.s $f0, $f8 # result = temp
		
	
		#while teil
		c.le.s $f10, $f14  #flag wahr für delta < = 0.00001
	
		bc1f do
		
		
		jr $ra
		
			
		
		
		
