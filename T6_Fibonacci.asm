# Name: Sofia M. Salazar
# Description: Program that calculates n Fibonacci serie using recursivity
# Date: 30/09/2019
#base case - Stack frame - Save return address - save return - restore
#int fibo(int n){
#	if(n<=1) return n;
#	else return fib (n - 1) + fib (n - 2);
#}
.text
main: 
 	addi $a0, $zero, 8 #init n
	jal fibo #call fibo
	j exit #end program

fibo:  	
	addi $sp, $sp, -12
	sw $ra, 0($sp) #save return address
	sw $a0, 4($sp) #save original n value
	
	blt $a0, 2, base #if n<=1 go to base case
	addi $a0, $a0, -1 #compute n-1
	jal fibo
	
	add $a0, $a0, -1 #compute n-2
	jal fibo
	j stack
base: 	add $v0, $v0, $a0 #return n if n<=1
 	j stack #restore values from stack
	
stack: 	lw $ra, 0($sp) #restore n
	lw $a0, 4($sp) #restore return address
	addi $sp, $sp, 12 #restore stack pointer
	jr  $ra #go back to main
exit:
 	 
