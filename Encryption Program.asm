; Encryption Program
; Jennifer Talford

INCLUDE Irvine32.inc
INCLUDE Macros.inc
BufSize = 80

.data

key BYTE 6, 4, 1, 2, 7, 5, 2, 4, 3, 6
buffer BYTE BufSize DUP(?),0,0
stdInHandle HANDLE ?
bytesRead DWORD ?

.code
main PROC

; pointer is held within ESI key array
mov ESI, OFFSET key
mWriteln "Write a word to be encrypted: "
; Move the handle to standard input
INVOKE GetStdHandle, STD_INPUT_HANDLE
mov stdInHandle,eax
; Wait for the user's input
INVOKE ReadConsole, stdInHandle, ADDR buffer, BufSize, ADDR bytesRead, 0

; Using function EncryptionAndDecryption to ouput encryption to console
mov EDX, OFFSET buffer
mov ECX, BufSize
mov EBX, 0
call EncryptionAndDecryption
call WriteString
call Crlf

; Using function EncryptionAndDecryption to ouput decryption to console
mov EBX, 1
call EncryptionAndDecryption
call WriteString

INVOKE ExitProcess,0
main ENDP



; Function to encrypt and decrypt input
EncryptionAndDecryption PROC

; push the eight general-purpose registers onto the stack.
pushad

; gets the length of the key
cmp EBX, 0
je equals
mov EBX, ESI
add EBX, 9

DecriptionLoop:
; hold the value of the text
mov AL, [EDX]
push ECX
; holds the value of the key
mov CL, [ESI] 
ror AL, CL
mov [EDX], AL
pop ECX
; if all the keys are used this resets and it starts from the beginning
cmp ESI, EBX 
je reset1
inc ESI
jmp endReset1
reset1:
sub ESI, 9
endReset1:
inc EDX
loop DecriptionLoop

mWriteln "The input decrypted: "
jmp endCMP

equals:
mov EBX, ESI
add EBX, 9 ; the length of key

EncriptionLoop:
; hold the value of the text
mov AL, [EDX]
push ECX
; holds the value of the key
mov CL, [ESI]
rol AL, CL
mov [EDX], AL
pop ECX
; if all the keys are used this resets and it starts from the beginning
cmp ESI, EBX
je reset2
inc ESI
jmp endReset2
reset2:
sub ESI, 9
endReset2:
inc EDX
loop EncriptionLoop

mWriteln "The input encrypted: "
endCMP:

; pop the eight general-purpose registers onto the stack.
popad 

ret
EncryptionAndDecryption ENDP

END main