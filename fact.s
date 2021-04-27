.globl factorial

.data
n: 
    .word 8

.text
main:
    la t0, n			#load address of n to t0
    lw a0 , 0(t0)		#load address of t0+0(offset) to a0
    addi t1, a0, 0		#load a0 to t1
    jal ra, factorial		#jump to factorial and link next text's address to ra

    

factorial:
    addi sp, sp, -8		#push
    sw t0, 0(sp)
    sw t1, 4(sp)

    addi t1, t1, -1		#make t3==t1-1 (t1 is equal to t0 and its n)
    addi s0, x0, 1		#s0==1
    beq t1, s0, exit		#if t1==1, exit
    
    jal factorial

    lw t0, 0(sp)		#pop
    lw t1, 4(sp)
    addi sp, sp, 8
    
exit:
    addi a1, a0, 0
    addi a0, x0, 1
    ecall 			# Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall 			# Print newline

    addi a0, x0, 10
    ecall 			# Exit

    





    addi t2, t1, -1		#make t2==t1-1 (t1 is equal to t0 and its n)
    
    mul t3, t1, factorial	#save t1*t2 to t3
    add t1, x0, t2		#make t1=t2
    jal t3, factorial		#return t3 and link to factorial
