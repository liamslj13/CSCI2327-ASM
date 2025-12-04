
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
; this should work with any data type and size
source DWORD 1,2,3,4,5,6

.code
main proc
	
	mov		esi, OFFSET source
	; calculate where the end of the array is
	mov		edi, OFFSET source
	add		edi, SIZEOF source
	sub		edi, TYPE	source

L1:
	
	; swap elems
	mov		ax, [esi]
	mov		bx, [edi]
	mov		[esi], bx
	mov		[edi], ax
	
	; increment esi and decrement edi
	add		esi, TYPE source
	sub		edi, TYPE source

	cmp		esi, edi
	jge		L2 ; only jump to 

	loop	L1

L2:

	invoke ExitProcess,0
main endp
end main