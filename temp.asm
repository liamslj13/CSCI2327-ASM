
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
; Question 1
int1 BYTE 24			; 8-bit integer initialized to 24
int2 SWORD 4000h		; 16-bit integer intialized to 4000h
int3 DWORD 0FFFF0000h	; 32-bit integer initialized to FFFF0000h
Z1	 SWORD ?
Z2	 DWORD ?
Z3	 SBYTE ?
Z4	 SBYTE ?

.code
main proc
; Question 2 a)
	movsx	eax, int1
	movsx	ebx, int2
	add		eax, 10
	add		ebx, 100
	sub		eax, ebx
	mov 	Z1,  ax

; Question 2 b)
	mov		eax, int3
	movsx	ecx, int2
	sub		eax, ecx
	sub		eax, 1000
	movsx	ebx, int1
	sub		ebx, 500
	add		eax, ebx
	mov		Z2, eax

; Question 2 c)
	mov		al, int1
	mov		bl, al
	neg		al
	sal		al, 2
	mov		Z3, al ; Store mult in Z3

	neg		bl
	sar		bl, 3
	mov		Z4, bl ; Store div in Z4

     
	invoke ExitProcess,0
main endp
end main