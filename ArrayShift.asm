
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
; this should work with any data type and size
source WORD 1,2,3,4,5,6

.code
main proc
    ; get the first element to append to back
    ; then find how many steps we need
    mov     ax, source
    mov     ecx, LENGTHOF source
    sub     ecx, 1

    mov     esi, 0  

L1:
    ; do the swap
    mov     bx, source[esi + TYPE source]     
    mov     source[esi], bx
    
    ; increment index
    add     esi, TYPE source

    loop L1

    ; get last elem of array and append first element
    mov edi, OFFSET source
    add edi, SIZEOF source
    sub edi, TYPE source

    mov [edi], ax

    invoke ExitProcess,0
main endp
end main