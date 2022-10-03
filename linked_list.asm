bits 64
default rel

segment .data

segment .text
global create_head
global _push
global _pop
global get
global _add
extern ExitProcess
extern malloc

create_head:
	
	;call with (int value), returns pointer to the head
	push rbp 
	mov rbp, rsp 
	sub rsp, 32
	
	mov rdx, rcx
	mov rcx, 12
	call malloc
	mov QWORD[rax], rdx
	mov QWORD[rax+4], 0
	mov QWORD[rax+8], 0
	
	leave
	ret
	
	
	
_push:

	;call with (int* head_ptr, int value)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32
	
	push rdx
	push rcx
	jmp .findtail
	
.findtail:

	pop rcx
	test [rcx+8],[rcx+8]
	jz .foundtail
	
	add rcx, 4
	push rcx
	jmp .findtail
	
.foundtail:
	
	pop rdx
	push rcx
	
	mov rcx, 12
	call malloc
	mov QWORD[rax], rdx
	mov QWORD[rax+4], 0
	mov QWORD[rax+8], 0
	
	pop rcx
	mov [rcx+4], rax
	
	leave
	ret


	
_pop:
	
	;call with (int* head_ptr), returns the last value
	push rbp 
	mov rbp, rsp 
	sub rsp, 32
	
	push rcx
	jmp .findtailp
	
.findtailp:

	pop rcx
	test [rcx+8],[rcx+8]
	jz .foundtailp
	
	add rcx, 4
	push rcx
	jmp .findtailp
	
.foundtailp:

	mov rax, QWORD[rcx]
	call free
	
	leave
	ret



get:
	
	;call with (int* base_ptr, int index)
	push rbp 
	mov rbp, rsp 
	sub rsp, 32
	
	mov rax, rcx ;fix the loop
	test rdx, rdx
	jnz .find_index
	leave 
	ret
	

.find_index:

	mov rax, [rax +4]
	dec rdx
	jnz .find_index
	
	mov rax, QWORD[rax]
	
	leave
	ret
	
	
	
	
