.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:
    # Prologue
	lw t6 0(a0)			#load word of pointer of a0 to t3
    addi t4 x0 1		#iteration counter t4
    addi a0 a0 4
	jal t5 loop_start
    
loop_start:
	lw t3 0(a0)
    addi t4 t4 1
    addi a0 a0 4
    
    blt t6 t3 loop_continue
    
    beq t4 a1 loop_end
    jal t5 loop_start

loop_continue:
	addi t6 t3 0
    beq t4 a1 loop_end
    jal t5 loop_start
    


loop_end:
    # Epilogue
	add a0 t6 x0
    ret
