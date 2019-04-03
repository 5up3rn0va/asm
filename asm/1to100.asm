BITS 32

extern printf

section .data
	print: db "%d", 10, 0
	num: dd 0
	

section .text
	global main

	main:
		push ebp
		mov ebp, esp

		mov eax,1
		
		l1:
			mov DWORD[num], eax
			push eax
			push print
			call printf
			mov eax, DWORD[num]
			add eax,1
			cmp eax,100
			jle l1

		leave
		ret
