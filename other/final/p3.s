.data
result: .asciz "result: %d"
.text

.global main

main:
	ldr r0, =inStr@input string
	bl printf

	@load the scaled ints
	ldr r2, =0x12b0  @bp-16 wd 16
	ldr r3, =0xe042  @bp-16 wd 16
	
	mov r1, #1
	
	@do the amth
	mul r0, r1, r1
	mul r0, r0, r2
	
	mul r4, r3, r1
	add r0, r0, r4
	
	@output result
	ldr r0, =result
	mov r1, r0
	bl printf
inAddr: .word in
.global printf