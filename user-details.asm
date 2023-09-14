.data
inputs: 
	.space 20	# name
	.word 0		# age
	.space 25	# address
	.space 10	# city
	.space 3	# state code
	.space 10	# zip
	.space 16	# phone number
	
prompts:
	.asciiz "Enter your name: "
	.asciiz "Enter your age: "
	.asciiz "Enter your address: "
	.asciiz "Enter your city: "
	.asciiz "Enter your state code: "
	.asciiz "Enter your zip code: "
	.asciiz "Enter your phone number: "
	
outputLabel:
	.asciiz "Name: "
	.asciiz "Age: "
	.asciiz "Address: "
	.asciiz "City: "
	.asciiz "State: "
	.asciiz "Zip code: "
	.asciiz "Phone number: "

.text
.globl main
main:
	# prompt for name
	la	$a0, prompts
	li	$v0, 4
	syscall
	
	# read name input
	li 	$v0, 8		
	la 	$a0, inputs
        li	$a1, 20
        syscall
	
	# prompt for age
 	la	$a0, prompts + 18
	li	$v0, 4
	syscall  
	
	# read age input
	li 	$v0, 5
        syscall
        sw	$v0, inputs + 20
        
	# prompt for address
	la	$a0, prompts + 35
	li	$v0, 4
	syscall  
	
	# read address input
	li 	$v0, 8		
	la 	$a0, inputs + 24
        li	$a1, 25
        syscall
        
        # prompt for city
	la	$a0, prompts + 56
	li	$v0, 4
	syscall
	
	# read city input
	li 	$v0, 8		
	la 	$a0, inputs + 49
        li	$a1, 10
        syscall
	
	# prompt for state code
	la	$a0, prompts + 74
	li	$v0, 4
	syscall
	
	# read state code input
	li 	$v0, 8		
	la 	$a0, inputs + 59
        li	$a1, 10
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
	la	$a0, inputs	
	li	$v0, 4
	syscall
	
        # print age outputLabel
        li 	$v0, 4          
    	la 	$a0, outputLabel + 7
    	syscall  
    	
    	# print saved age input
	lw	$a0, inputs + 20
	li	$v0, 1
	syscall
	
	# new line
	li 	$v0, 11		
	li 	$a0, 0xA
	syscall
	
        # print address outputLabel
        li 	$v0, 4          
    	la 	$a0, outputLabel + 13
    	syscall  
    	
    	# print saved address
	la	$a0, inputs + 24
	li	$v0, 4
	syscall    	
	
	# print city outputLabel
        li 	$v0, 4          
    	la 	$a0, outputLabel + 23
    	syscall 
    	
    	# print saved city
	la	$a0, inputs + 49
	li	$v0, 4
	syscall	
	
	# print state code outputLabel
	li 	$v0, 4          
    	la 	$a0, outputLabel + 30
    	syscall 
    	
    	# print saved state code
    	la	$a0, inputs + 59
	li	$v0, 4
	syscall	

	# new line
	li 	$v0, 11		
	li 	$a0, 0xA
	syscall
	
	# end program
	li 	$v0, 10
    	syscall