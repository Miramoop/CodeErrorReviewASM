; CSCI268 - Assembly Language Code Review 
; Miranda Morris
; 4/19/2024
; This code was reviewed for any errors. I noted any syntax or logical errors
; using a line comment explaining the issue and the fix. 

.586
.model flat, stdcall
option casemap : none ;// case-sensitive
WriteString proto
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc ; Needs to add this part to the code in order to use the call Clrscr proc

.data
NUM1 BYTE 250 ; BYTE cannot equal 300 must be changed to a lower number
NUM2 BYTE 200 
NUM3 BYTE 0 
MSG1 BYTE 'This is a message',0
LEN1 EQU LENGTHOF MSG1


.code
main proc
    
    mov al, NUM1
    mov ah, NUM2
    call Clrscr ; Must clear screen first so this has to be logically put above call adder code
    mov ebx, 10 ; EBX should become ebx 
    call adder ; can finally logically call the adder procedure
   
L1:                     ; when naming loops you should always capitalize first letter, instead of using this loop I added the WriteString into proc
    call WriteString
    loop L1

adder proc ; Must move this procedure above the exit process or the information will not be able to be accessed properly

    add ah, al
    mov edx, OFFSET MSG1  ; Must be added to the adder procedure rather than having it above in the code
    call WriteString
    call Crlf ; Must add this to bring cursor to next line, makes the output look more neat in the console

adder endp

invoke ExitProcess,0
main endp
end main 
