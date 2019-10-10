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
	
	addi $s0, $zero, 3 #Init n as number of disks
	
	add $t0, $zero, $s0 # Store n in an temp register
	add $t1, $zero, $a0 # Store A pole address in a temp register
	
init:	#Init pole A 
	sw $t0, ($t1)	  # Store value n to pole A
	addi $t0, $t0, -1 # Decrease n value 
	addi $t1, $t1, 4  # Shift to next word memory
	bne $t0, $zero, init # n=0? continue to call init 

	jal hanoi 	#Call Hanoi(n,a,b,c)	
	j exit
hanoi: #Save stack
	addi $sp, $sp, -20 #Make space on stack for 5 registers
	sw $ra, 0($sp) #Save return address stack[0]=ra
	sw $a0, 4($sp) #Save tower A stack[1]=A
	sw $a1, 8($sp) #Save tower B stack[2]=B
	sw $a2, 12($sp) #Save tower C stack[3]=C
	sw $s0, 16($sp) #Save n  stack[4]=n
	#Check base case 
	bne $s0, 1, function #verify base case n=1? 	
	sw  $s0, 0($a2) #move directly disk from origin to destiny
	sw $zero, 0($a0) #clear origin disk
	j end_hanoi #go to end of function 
function: 
	addi $a0, $a0, 4  #Increment Origin Tower +4
	addi $s0, $s0, -1 #Decrease number of disks
	lw $a1, 12($sp)  #Change from Stack Tower C to Tower B 
	lw $a2, 8($sp)   #Change from Stack Tower B to Tower C 
	jal hanoi

end_hanoi: #Restore all values from stack
	lw $ra, 0($sp) #restore return address stack[0]=ra
	lw $a0, 4($sp) #restore tower A stack[1]=A
	lw $a1, 8($sp) #restore tower B stack[2]=B
	lw $a2, 12($sp) #restore tower C stack[3]=C
	lw $s0, 16($sp) #restore n  stack[4]=n
	addi $sp, $sp, 20 #Restore sp to its initial postion
	jr $ra #go back before hanoi was called 
exit: 
