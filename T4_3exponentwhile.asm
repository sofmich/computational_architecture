# Name: Sofia M. Salazar
# Description: Make counter = counter+counter and
#variable = counter/4 as long as variable<20 (do while mips)
# Date: 22/09/2019


.data #writing on Ram 
.text #writing on Rom
main: 
addi $s0, $zero, 1 #Initialize counter=1
addi $s1, $zero, 0 #Initialize variable=0
addi $s3, $zero, 0 #Flag used by do while loop
addi $t0, $zero, 20 #load 20 on t0 for comparation
do:
add $s0, $s0, $s0 #counter=counter+counter
div $s1, $s0, 4 #variable=counter/4
while: 
slt $s3, $s1, $t0  #variable<20? s3=1, else s3=0
beqz $s3, exit #if variable>20, s3=0 then go to finish
j do #go back to loop
exit:
