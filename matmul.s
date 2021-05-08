.globl matmul

.text
# =======================================================
# FUNCTION: Matrix Multiplication of 2 integer matrices
# 	d = matmul(m0, m1)
#   If the dimensions don't match, exit with exit code 2
# Arguments:
# 	a0 is the pointer to the start of m0
#	a1 is the # of rows (height) of m0
#	a2 is the # of columns (width) of m0
#	a3 is the pointer to the start of m1
# 	a4 is the # of rows (height) of m1
#	a5 is the # of columns (width) of m1
#	a6 is the pointer to the the start of d
# Returns:
#	None, sets d = matmul(m0, m1)
# =======================================================
matmul:
	bne a2 a4 mismatched_dimensions
    # Error if mismatched dimensions

    # Prologue
    addi sp sp -40
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    sw s2 12(sp)
    sw s3 16(sp)
    sw s4 20(sp)
    sw s5 24(sp)
    sw s6 28(sp)
    sw s7 32(sp)
    sw s8 36(sp)
    
    
	addi s0 a0 0			
    addi s1 a1 0				
    addi s2 a2 0		
    addi s3 a3 0			
    addi s4 a4 0			
    addi s5 a5 0			
    addi s6 a6 0
    
    addi s7 x0 0		#iteration of row
    addi s8 x0 0		#iteration of column
    
outer_loop_start:




inner_loop_start:



	
    
    mul t0 s2 s7		#a0 = s0 starter of m0+offset
    slli t0 t0 2 		#t0=offset of v0
    add a0 s0 t0
    
    slli t1 s8 2		#a1 = s3 starter of m0+offset
    add a1 s3 t1
    
    addi a2 s2 0 		#a2 = s2 vector length
    addi a3 x0 1		#a3 = 1
    addi a4 s5 0		#a4 = a5 stride of v1


	jal dot
    sw a0 0(s6)
    addi s6 s6 4			#return
	

	addi s8 s8 1
	beq s5 s8 inner_loop_end
    
    j inner_loop_start

inner_loop_end:


	addi s8 x0 0
    addi s7 s7 1
    beq s1 s7 outer_loop_end
    
    j outer_loop_start

outer_loop_end:


    # Epilogue
    
    
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    lw s2 12(sp)
    lw s3 16(sp)
    lw s4 20(sp)
    lw s5 24(sp)
    lw s6 28(sp)
    lw s7 32(sp)
    lw s8 36(sp)
    addi sp sp 40
    ret


mismatched_dimensions:
    li a1 2
    jal exit2
