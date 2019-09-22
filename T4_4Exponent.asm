# Name: Sofia M. Salazar
# Description: Program that calculates the 2^n operation. The implementation
#		must use recursive function 
# Date: 22/09/2019

.data

.text

main:
    addi $a0, $zero, 5 #initializing n
    addi $a1, $zero, 2 #initializing base for exponent
    jal exponent #calling the operation, jump to exponent	
    j exit
    
exponent:
    slti $t0, $a0, 1 #if n = 1 then t0=1
    beq $t0, $zero, loop #brench to loop if t0=0
    addi $v0, $zero, 1 #Loadin 1 on v0
   jr $ra #return to the caller
loop:
	addi $sp, $sp, -8 #saving space for the stack
	sw $ra, 4($sp) #storing first word on stack, direction
	sw $a0, 0($sp) #storing second  word on stack, values for n
	addi $a0, $a0, -1 #decrease n 
	jal exponent #return to exponent after gettin the stack done
	lw $a0, 0($sp) #getting out of stack in inverse orden as in
	lw $ra, 4($sp) #getting out of stack the second value
	addi $sp, $sp, 8 #Back to stack pointer at its first
	mul $v0, $a1 , $v0  #multiply for 2^n
	jr $ra #return to factorial 
exit: