.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 is the pointer to the array
#	a1 is the # of elements in the array
# Returns:
#	None
# ==============================================================================
relu:
    # Prologue
    lw a3 0(a0)
    addi a4 a4 1
    jal t2 loop_start


loop_start:
    bge x0 a3 loop_continue			#minus num in t0, jump to loop_continue
    beq a4 a1 loop_end				#if a0==a1, jump to loop_end
    addi a0 a0 4
    jal t2 relu						#jump and link to relu


loop_continue:
	
    sw x0 0(a0)
	beq a4 a1 loop_end
    addi a0 a0 4
    jal t2 relu
    
	
loop_end:


    # Epilogue

    
	ret
