bits 64
default rel

segment .data

segment .text
global make_Array
global get_at_index
global change_index
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

get_at_index:
	
	;call with (pointer to base, index)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mov rax, [rcx+ rdx*4]
	leave
	ret
	
change_index:

	;call with (pointer to base, value, index)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mov QWORD[rcx +r8*4], rdx
	xor rax, rax
	leave
	ret
	
