.data
inputs: 
	.space 52	# name
	.word 0		# age
	.space 100	# address
	.space 50	# city
	.space 4	# state code
	.space 7	# zip
	.space 20	# phone number
	
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
        li	$a1, 52
        syscall
	
	# prompt for age
 	la	$a0, prompts + 18
	li	$v0, 4
	syscall  
	
	# read age input
	li 	$v0, 5
        syscall
        sw	$v0, inputs + 52
        
	# prompt for address
	la	$a0, prompts + 35
	li	$v0, 4
	syscall  
	
	# read address input
	li 	$v0, 8		
	la 	$a0, inputs + 56
        li	$a1, 100
        syscall
        
        # prompt for city
	la	$a0, prompts + 56
	li	$v0, 4
	syscall
	
	# read city input
	li 	$v0, 8		
	la 	$a0, inputs + 156
        li	$a1, 50
        syscall
	
	# prompt for state code
	la	$a0, prompts + 74
	li	$v0, 4
	syscall
	
	# read state code input
	li 	$v0, 8		
	la 	$a0, inputs + 206
        li	$a1, 4
        syscall
        
	# prompt for zip code
	la	$a0, prompts + 98
	li	$v0, 4
	syscall 
	
	# read zip code input
	li 	$v0, 8		
	la 	$a0, inputs + 210
        li	$a1, 7
        syscall
        
        # prompt for phone number
        la	$a0, prompts + 120
	li	$v0, 4
	syscall 
	
	# read phone number input
	li 	$v0, 8		
	la 	$a0, inputs + 217
        li	$a1, 20
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
	lw	$a0, inputs + 52
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
	la	$a0, inputs + 56
	li	$v0, 4
	syscall    	
	
	# print city outputLabel
        li 	$v0, 4          
    	la 	$a0, outputLabel + 23
    	syscall 
    	
    	# print saved city
	la	$a0, inputs + 156
	li	$v0, 4
	syscall	
	
	# print state code outputLabel
	li 	$v0, 4          
    	la 	$a0, outputLabel + 30
    	syscall 
    	
    	# print saved state code
    	la	$a0, inputs + 206
	li	$v0, 4
	syscall	
	
	# print zip code outputLabel
	li 	$v0, 4          
    	la 	$a0, outputLabel + 38
    	syscall 
    	
    	# print saved zip code
    	la	$a0, inputs + 210
	li	$v0, 4
	syscall	
	
	# print zip code outputLabel
	li 	$v0, 4          
    	la 	$a0, outputLabel + 49
    	syscall 
    	
    	# print saved phone number
    	la	$a0, inputs + 217
	li	$v0, 4
	syscall	
	
	# end program
	li 	$v0, 10
    	syscall
