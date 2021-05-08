.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 is the pointer to the start of v0
#   a1 is the pointer to the start of v1
#   a2 is the length of the vectors
#   a3 is the stride of v0
#   a4 is the stride of v1
# Returns:
#   a0 is the dot product of v0 and v1
# =======================================================
dot:
    # Prologue
	addi t5 t5 1
    jal x0 loop_start

loop_start:
	lw t0 0(a0)
    lw t1 0(a1)
    mul t3 t0 t1
    add t4 t4 t3
    
    beq t5 a2 loop_end
    addi t3 x0 4
    mul t6 a4 t3
    addi a0 a0 4
    add a1 a1 t6
    jal x0 dot

loop_end:
    # Epilogue
	addi a0 t4 0    
    ret
