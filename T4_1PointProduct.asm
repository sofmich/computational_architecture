# Name: Sofia M. Salazar
# Description: Program that calculates the point product from 
#		two vectors 
# Date: 22/09/2019

.data  #global data accesible
	Vector1: .word 1,2,3	#Initializing vector 1
	Vector2: .word 6,7,8	#Initializing vector 2
	Result: .word #Initializing space for the result
.text 
	la $s1 Vector1 #saving address from vector1
	la $s2 Vector2  #saving address from vector2
	la $s3 Result #Address from result
	addi $a0, $zero, 3  #k = 3 definition
	addi $t0, $zero, 0 #way to iterate over vectors pointer = 0
product:
	lw $t1, Vector1($t0) #get values[t0] from vector1
	lw $t2, Vector2($t0) #get values[t0] from vector2
	mul $t3, $t1, $t2 #Multiply positions
	add $t4, $t4, $t3 #add the product to the result
	addi $t0, $t0, 4 #Go on for alignment: 4Bytes 32bits
	addi $a0, $a0, -1 #Decrease K
	bnez $a0, product #k != 0?? go to the next element, back to product
exit: