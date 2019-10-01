# Name: Sofia M. Salazar
# Description: Program that calculates Fibonacci serie using recursivity
# Date: 30/09/2019

.text

Main: 
	li $a0, 8	# Cargar constante
	jal Fibonacci 	# Llama a la funcion de fibonacci
	j Exit		# Fin del programa

Fibonacci:	 	 	 
	addi $sp, $sp, -12	# Decrementando el stack pointer
	sw $ra, 0($sp)		# Guarda el valor de la direccion a la que regresara
	sw $a0, 4($sp)		# Guardar valor de n

	#CASO BASE, REGRESA 0 || 1 SI NO ES MAYOR A 1
	blt  $a0, 2, Base	# Si es menor a 2 n se hara el caso base
	sub $a0, $a0, 1		# Hace la de f (n-1)
	jal Fibonacci		# Regresa a hacer lo de f(n-2)
	sub $a0, $a0, 1		# Hace la de f (n-2)	
	jal Fibonacci		# Regresa a hacer lo de f(n-2)
	j SacarStack

Base:
	add $v0, $v0, $a0	#Suma en v0 todos los finales de caso base.
	j SacarStack		#Salta a función que alinea el stack pointer.		

SacarStack:
	lw $ra, 0($sp)		# Regresa el valor de la direccion a la que  se regresara
	lw $a0, 4($sp)		# Saca el valorde n
	addi $sp, $sp, 12	# Regresa el stack a su valor para sacar los siguientes valores 
	jr $ra			#Regresa a donde se llamo 
Exit: