# Author: Daniel Sauder
# Website: http://govolution.wordpress.com/about
# License http://creativecommons.org/licenses/by-sa/3.0/

from Crypto.Cipher import AES

offset=7
ciph=("\x2c\x5a\xd5\x5f\x2d\x16\xb6\xb9\x68\x30\x90\x9f\xc9\x6d\xa5\x45\x8a\x08\x01\x2e\xe6\x60\x5b\x9f\x23\xb4\xc5\xaa\x77\x0f\x8a\x7f")

obj=AES.new('Passphrase123456', AES.MODE_CBC, 'IVIVIVIVIVI12345')
t=obj.decrypt(ciph)
decoded=""
for x in bytearray(t) :
	decoded += '\\x'
	enc = '%02x' % (x & 0xff)
	decoded += enc	
	
print decoded[0:-offset*4]
