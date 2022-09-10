#!/bin/bash
echo "************************************************************************************"
echo -e "\e[1;33m 1.-----Server Uptime-----\e[0m"
uptime
echo "************************************************************************************"
echo -e "\e[1;33m 2. -----Last Server Reboot Timestamp-----\e[0m"
last reboot
echo "************************************************************************************"
echo -e "\e[1;33m 3.-----Server Local Time Zone-----\e[0m"
timedatectl
echo "************************************************************************************"
echo -e "\e[1;33m 4.-----Last 10 installed packges with dates-----\e[0m"
rpm -qa --last | head -n 10 
echo "************************************************************************************"
echo -e "\e[1;33m 5.-----OS version-----\e[0m"
cat /etc/os-release
echo "************************************************************************************"
echo -e "\e[1;33m 6.-----Kernel version-----\e[0m"
uname -a
echo "************************************************************************************"
echo -e "\e[1;33m 7.-----CPU - Virtual cores-----\e[0m"
lscpu | grep ^Core
echo "************************************************************************************"
echo -e "\e[1;33m 8.-----CPU - Clock speed-----\e[0m"
grep ^'model name' /proc/cpuinfo
echo "************************************************************************************"
echo -e "\e[1;33m 9.-----CPU - ARCHITCTURE-----\e[0m"
lscpu | grep -i ^Architecture
echo "************************************************************************************"
echo -e "\e[1;33m 10.-----Disk - Mounted/Unmounted volumes, type, storage-----\e[0m"
fdisk -l
echo "************************************************************************************"
echo -e "\e[1;33m 11.-----Public IP-----\e[0m"
curl wgetip.com 
echo "************************************************************************************"
echo -e "\e[1;33m 12.-----Private IP-----\e[0m"
hostname -I
echo "************************************************************************************"
echo -e "\e[1;33m 13.-----Private and Public DNS or Hostname-----\e[0m"
hostname
echo "************************************************************************************"
echo -e "\e[1;33m 14.-----Networking - OS Firewall (Allowed Ports & Protocols)-----\e[0m"
netstat -tunlp > tunlp
cut -d: -f1,4 tunlp | sort -n -t:
echo "************************************************************************************"
echo -e "\e[1;33m 15.-----Networking - Network Firewall (Allowed Ports & Protocols)-----\e[0m"
netstat -natp
echo "************************************************************************************"
echo -e "\e[1;33m 16.-----CPU - Utilization [Expected Less than 60 %, Highlight CPU consumption]-----\e[0m"
df -Ph | sed s/%//g | awk '{ if($5 < 60) print $0;}'
echo "************************************************************************************"
echo -e "\e[1;33m 17.-----RAM - Utilization [Expected Less than 60 %,Highlight RAM consumption]-----\e[0m"
df -hT | sed s/%//g | awk '{ if($5 > 60) print $0;}'
echo "************************************************************************************"
echo -e "\e[1;33m 18.-----Storage[Expected Less than 60 %, other wise Highlight Storage consumption]-----\e[0m"
free -h | sed s/%//g | awk '{ if($5 > 60) print $0;}'
echo "************************************************************************************"
echo -e "\e[1;33m 19.-----Highlight when current User Password Exipring-----\e[0m"
chage -l root | grep ^Password > password\ expire
grep expire  password\ expire
