# Name: 
##	Sofia M. Salazar Valdovinos
##	Luis Enrique Manzano L. De Ortigosa
# Description: Hanoi towers using recursivity over a section of memory
# Date: 12/10/2019

.data
.text
main: 
	#Init address for towers A, B, C
	addi $a0, $zero, 0x10010000 #Init memory segment for A = org
	addi $a1, $zero, 0x10010020 #Init memory segment for B = aux
	addi $a2, $zero, 0x10010040 #Init memory segment for C = dst
	
	addi $s0, $zero, 8 #Init n as number of disks
	
	add $t0, $zero, $s0 # Store n in an temp register
	add $t1, $zero, $a0 # Store A pole address in a temp register
	
init:	#Init pole A 
	sw $t0, ($t1)	  # Store value n to pole A
	addi $t0, $t0, -1 # Decrease n value 
	addi $t1, $t1, 4  # Shift to next word memory
	bne $t0, $zero, init # n=0? continue to call Hanoi 

	jal hanoi 	#Call Hanoi(n,a,b,c)	
	j exit
