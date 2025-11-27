; Rec 10, q2 Copy a String in Reverse Order

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
source  BYTE  "This is the source string",0
target  BYTE  SIZEOF source DUP('#')

.code
main PROC
; Point ESI to the last character in the source string:
	mov  esi,OFFSET target - 2

; Point EDI to the beginning of the target string:
; We do not copy the null terminator byte.

	mov  edi,OFFSET target
	mov  ecx,SIZEOF source-1		; loop counter
	
L1:	mov  al,[esi]					; get a character from source
;
; complete the code here
;
	mov	  [edi], al
	
	add   edi, TYPE target
	sub	  esi, TYPE source

	loop L1							; repeat for entire string

	mov	BYTE PTR [edi],0			; add a null byte to the target

	Invoke ExitProcess,0
main ENDP
END main