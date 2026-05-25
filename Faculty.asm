.data
	read: .asciiz "\ngib eine Integerzahl\t"
	newline: .asciiz "\n"
.text






main:  
	addi $sp, $sp, -4
	sw $ra, 0($sp) #ra gesichert
	
	addi $v0, $zero, 4
	la $a0, read
	syscall
	
	addi $v0 , $zero, 5
	syscall
	
	add $a0, $v0, $zero # eingabewert übergeben
	
	jal factorial
	add $a0, $v0, $zero #delayslot
	
	add $a0, $v0, $zero
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 4
        la   $a0, newline
        syscall

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	addi $v0, $zero, 10
	syscall
	# factorial: Argument in $a0 (n), Rueckgabewert in $v0
	# Voraussetzung: n >= 1
factorial:

	 add $v0, $zero, $a0 # result = n
	 add $t0, $zero, $a0 # i = n
	 
	 
loop:
 	slti $t1, $t0, 2 # $t1 = 1 falls i < 2 (Abbruchbedingung)
 	bne $t1, $zero, done # falls i <= 1: fertig
 	addi $t0, $t0, -1 # Delay Slot der Verzweigung: i--
 	j loop # Schleife weiter
 	mul $v0, $v0, $t0 # Delay Slot des Sprunges: result *= i
 	
 	
done:
		
		jr $ra
		sll $zero, $zero, 0