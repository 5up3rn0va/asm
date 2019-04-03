BITS 32

extern printf

section .rodata
	msg: db "The sum is %d", 10, 0

section .text
	global main

	main:
		push ebp
		mov ebp, esp

		mov eax,3
		mov ebx,4
		add eax,ebx
		push eax
		push msg
		call printf

		mov eax,0
		leave
		ret
