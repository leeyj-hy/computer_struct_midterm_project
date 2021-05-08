.globl factorial

.data
n: 
    .word 8

.text
main:
    la t0, n			#load address of n to t0
    lw a0 , 0(t0)		#load address of t0+0(offset) to a0
    addi a1, a0, 0		#load a0 to t1
    jal t3, factorial		#jump to factorial and link next text's address to ra

    addi a1, a0, 0
    addi a0, x0, 1
    ecall 			# Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall 			# Print newline

    addi a0, x0, 10
    ecall 			# Exit

factorial:
    addi t1, x0, 1
    
    addi a3, x0, 1
    addi sp, sp, -4		#push
    sw a0, 0(sp)

    beq a0, t1, exit		#if t1==1, exit
    
    addi t2, a0, 0
    addi a0, a0, -1
    
    jal factorial

exit:
	lw a0, 0(sp)
    addi sp, sp, 4
    mul a3, a3, a0
    beq a1, a0, exit2
    jal exit
exit2:
	addi a0, a3, 0
	jr t3
