# Name: Sofia M. Salazar
# Description: According to a switch (selector) make the aritmethic operations
# Date: 22/09/2019

.data #writing on Ram 
.text #writing on Rom

	addi $s0, $zero, 0 #Selector = 0
	addi $s1, $zero, 5 #Values to operate: a
	addi $s2, $zero, 3 #Values to operate: b
	addi $s3, $zero, 0 #Values to operate: c

main:
	beq $s0, 1, addit #jump to addition if selector=1
	beq $s0, 2, subs #jump to substraction if selector=1
	beq $s0, 3, multiply #jump to multiply if selector=1
	and $s3, $s1, $s2 #Bitwise ands and save on s3
	j exit 
addit:	add $s3, $s1, $s2 #Add s1+s2 and save on s3
	j exit
subs:	sub $s3, $s1, $s2 #Subs s1-s2 and save on s3
	j exit
multiply: mul $s3, $s1, $s2
	j exit #jump to end 
exit: