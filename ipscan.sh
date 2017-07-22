#!/bin/bash
echo "------------------- SCAN DEVICES IN YOUR NETOWRK -------------------"
echo "                      IP scanner v1.0 @tikoo                        "
if [ "$1" == "" ]
then
echo "Example: ./ipscan.sh networkid"
else
x=1
echo "Active hosts shown below| Log Generated as well "
while [ $x -lt 256 ] ; do
ping -c 1 $1.$x | grep "64 bytes" | cut -d " " -f 4 | sed s'/.$//'| ts '[%Y-%m-%d %H:%M:%S]' | tee -a pinglog.txt
(( x++ ))
done
fi
