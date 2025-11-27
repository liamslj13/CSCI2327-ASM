; Rec 10, q1: Copying a Word Array

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
source word 1,2,3,4,5,6,7,8,9,10
count = LENGTHOF source 
target dword count DUP(?)

.code
main proc
	mov		edi, OFFSET target
	mov		esi, OFFSET source
	
	mov		ecx, count
L1:
	mov		ax, [esi]
	movsx	eax, ax

	mov		[edi], eax

	add		edi, TYPE target
	add		esi, TYPE source

	loop L1
	
	invoke ExitProcess,0
main endp
end main