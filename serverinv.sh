#!/bin/bash

#Description: Script to audit a Server
#Author: Lionel
#Date: April 2021

echo -e "\nChecking the OS version\n"

sleep 2

os=`cat /etc/*release | head -1`
echo " The OS is ${os} "

sleep 2

echo -e "\nCheck the size of the memory\n"

mem=`free -m |grep Mem | awk '{print$2}'`
echo " The total memory size is ${mem}"

sleep 2

echo -e "\nHard Drive space\n"
hd=`lsblk | grep disk| awk '{print$4}'`
echo " The hard drive size is ${hd}"

echo -e "\nThe CPU Speed\n"
sp=`lscpu | grep "CPU MHz" | awk '{print$3}'`
echo " The cpu speed is ${sp} MHz"

sleep 2

echo -e "\nThe Kernel version\n"

kn=`uname -r | awk -F- '{print$1}'`
echo " The kernel version is ${kn}"

sleep 2

echo -e "\nCheck if system bits\n"

echo " The system has $(arch | awk -F_ '{print$2}') bits"

sleep 2


echo -e "\nThe Hostname\n"
echo " The hostname is $HOSTNAME "

echo -e "\nThe IP address\n"
ip=`ip address show dev enp0s3 | grep inet | head -1 | awk '{print$2}'`
echo " The ip address is ${ip} "

sleep 2

echo -e "\nAll opened ports\n"
echo " Here are all the opened ports 
`ss -tulpn | grep LISTEN)`"

sleep 2

echo -e "\nThe DNS\n"
echo " The DNS address is
`cat /etc/resolv.conf | grep nameserver`"

sleep 2

echo -e "\nCheck the manufacturer\n"
echo " The manufacturer is `dmidecode -t system | grep Manufacturer | awk '{print$2}'`"

echo -e "\nVirtual or physical system\m"
echo " This is a `dmidecode -t system | grep Family | awk '{print$2,$3}'`"

sleep 2

echo -e "\nThe MAC address\n"
echo " The system MAC address is `ip address show dev enp0s3 |grep ether | awk '{print$2}'`"

sleep 2
exit 0
