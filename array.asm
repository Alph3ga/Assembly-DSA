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

	;call with (int length, size_t size_of)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mul rcx, rdx
	call malloc
	leave
	ret

get_at_index:
	
	;call with (pointer to base, index, size_t size_of)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mul rdx,r8
	mov rax, [rcx+ rdx]
	leave
	ret
	
change_index:

	;call with (pointer to base, value, index, size_t size_of)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32 
	
	mul r8, r9 ;see if i can restrict the size to just 4 later
	mov QWORD[rcx +r8], rdx
	xor rax, rax
	leave
	ret
	
	
	
	
	