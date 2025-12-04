
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
aVal WORD ?
bVal WORD 10
cVal WORD 10

.code
main proc
	
	movsx eax, bVal
	sub   eax, 10
	movsx ebx, cVal
	add   ebx, 20
	mul	  ebx

	mov   aVal, ax

	; Case a) B = 20, C = 10
	;
	; Registers:
	; EAX = 0000012C EBX = 0000001E ECX = 00401005  
	; EDX = 00000000 ESI = 00401005 EDI = 00401005
	; EIP = 00401026 ESP = 0019FF78 EBP = 0019FF84 EFL = 00000202
	;
	; No flags were set


	; Case b) B = 10, C = 20
	;
	; Registers:
	; EAX = 00000000 EBX = 00000028 ECX = 00401005  
	; EDX = 00000000 ESI = 00401005 EDI = 00401005
	; EIP = 00401026 ESP = 0019FF78 EBP = 0019FF84 EFL = 00000206  
	;
	; No flags were set


	; Case c) B = 10, C = 10
	;
	; Registers:
	; EAX = 00000000 EBX = 0000001E ECX = 00401005   
	; EDX = 00000000 ESI = 00401005 EDI = 00401005
	; EIP = 00401026 ESP = 0019FF78 EBP = 0019FF84 EFL = 00000206   
	;
	; No flags were set





	invoke ExitProcess,0
main endp
end main