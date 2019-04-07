BITS 32

extern printf
extern scanf

section .data
	read: dd "%d",0
	series: db "Fibonacci series: %d",0
	print: db ", %d",0
	e: db 10,0
	cnt: dd 0
	a: dd 0
	b: dd 1
	c: dd 0
	N: dd 0

section .text

	global main

	main:
		push ebp
		mov ebp,esp 

		push N
		push read
		call scanf

		cmp DWORD[N],0
		je end

		mov eax,DWORD[a]
		push eax
		push series
		call printf
		add DWORD[cnt],1

		cmp DWORD[N],1
		je end

		mov ebx,DWORD[b]
		push ebx
		push print
		call printf
		add DWORD[cnt],1

	l1:
		mov eax,DWORD[a]		
		mov ebx,DWORD[b]
		add eax,ebx
		mov DWORD[c],eax
		push eax
		push print
		call printf
		mov ebx,DWORD[b]
		mov DWORD[a],ebx
		mov eax,DWORD[c]
		mov DWORD[b],eax
		add DWORD[cnt],1
		mov ecx,DWORD[cnt]
		cmp ecx,DWORD[N]
		jl l1

	end:
		push e
		call printf
		mov eax,0		
		leave
		ret
	
		
		
		
