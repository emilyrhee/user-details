.data
inputs: 
	.space 20	# name
	.word 0		# age
	.space 25	# address
	.space 10	# city
	.space 3	# state
	
prompts:
	.asciiz "Enter your name: "
	.asciiz "Enter your age: "
	.asciiz "Enter your address: "
	.asciiz "Enter your city: "
	.asciiz "Enter your state code: "
	
outputLabel:
	.asciiz "Name: "
	.asciiz "Age: "
	.asciiz "Address: "
	.asciiz "City: "
	.asciiz "State: "

.text
.globl main
main:
	# prompt for name
	la	$t0, prompts
	li	$v0, 4
	move	$a0, $t0
	syscall
	
	# read string input
	li 	$v0, 8		
	la 	$a0, inputs
        li	$a1, 20
        syscall
	
	# prompt for age
 	la	$t0, prompts + 18
	li	$v0, 4
	move	$a0, $t0
	syscall  
	
	# read string input
	li 	$v0, 8		
	la 	$a0, inputs + 20
        li	$a1, 4
        syscall

	# prompt for address
	la	$t0, prompts + 35
	li	$v0, 4
	move	$a0, $t0
	syscall  
	
	# read string input
	li 	$v0, 8		
	la 	$a0, inputs + 40
        li	$a1, 25
        syscall
        
        # new line
	li 	$v0, 11		
	li 	$a0, 0xA
	syscall
	
        # print name outputLabel
        li 	$v0, 4          
    	la 	$a0, outputLabel
    	syscall  
        
        # print saved name input
	la	$t0, inputs	
	li	$v0, 4
	move	$a0, $t0
	syscall
	
        # print age outputLabel
        li 	$v0, 4          
    	la 	$a0, outputLabel + 7
    	syscall  
    	
    	# print saved age input
	la	$t0, inputs + 20
	li	$v0, 4
	move	$a0, $t0
	syscall
	
        # print address outputLabel
        li 	$v0, 4          
    	la 	$a0, outputLabel + 13
    	syscall  
    	
    	# print saved address
	la	$t0, inputs + 40
	li	$v0, 4
	move	$a0, $t0
	syscall    	

	# new line
	li 	$v0, 11		
	li 	$a0, 0xA
	syscall
	
	# end program
	li 	$v0, 10
    	syscall
