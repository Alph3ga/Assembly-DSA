bits 64
default rel

segment .data

segment .text
global make_Array
global get
global change
extern ExitProcess
extern malloc

make_Array:

	;call with (int length)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mov rax, 4
	mul rcx
	mov rcx, rax
	call malloc
	leave
	ret

get:
	
	;call with (pointer to base, index)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mov rax, [rcx+ rdx*4]
	leave
	ret
	
change:

	;call with (pointer to base, index, value)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mov QWORD[rcx +rdx*4], r8
	xor rax, rax
	leave
	ret
