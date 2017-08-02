#!/bin/bash
echo "------------------- SCAN DEVICES IN YOUR NETWORK -------------------"
echo "                    PingPort Network Scanner v1.1 @tikoo                        "
if [ "$1" == "" ]
then
echo "IpScan: ./ipscan.sh networkid"
echo "PortScan: ./ipscan.sh networkid port"
elif [ "$2" != "" ]
then
x=1
echo "Active hosts shown below with Port Scan| Portlog Generated"
while [ $x -lt 256 ] ; do
nc -zv $1.$x $2 2>&1 | grep "open"| cut -d " " -f 2,3,4| ts '[%Y-%m-%d %H:%M:%S]'| tee -a portlog.txt  
((x++))
done
else
echo "Active hosts shown below| PingLog Generated "
x=1
while [ $x -lt 256 ] ; do
ping -c 1 $1.$x | grep "64 bytes" | cut -d " " -f 4 | sed s'/.$//'| ts '[%Y-%m-%d %H:%M:%S]' | tee -a pinglog.txt
(( x++ ))
done
fi
