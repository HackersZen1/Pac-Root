#!/bin/sh
clear

Red="\e[1;91m"      ##### Colors Used #####
C=$(printf '\033')
Green="\e[0;92m"
Yellow="\e[0;93m"
Blue="\e[1;94m"
White="\e[0;97m"
BGreen='\033[1;32m'
SED_GREEN="${C}[1;32m&${C}[0m"
BRed='\033[1;31m'
NC='\033[0m'
BBlue='\033[1;34m'

banner () {        ##### Banner #####

printf "	             ▄████▄         ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒   \n" 
sleep 0.3
printf "	            ███▄█▀         ▒─▄▒─▄▒  ▒─▄▒─▄▒  ▒─▄▒─▄▒  \n"  
sleep 0.3
printf "	           ▐████  █  █  █  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  \n"  
sleep 0.3
printf "                    █████▄         ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒\n"   
sleep 0.3
printf "                     ▀████▀        ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒\n"

printf "${Yellow} \n   		     Pac-Root script for Privilege Escalation "
printf "${Blue} \n                        Github Link: github.com/Pwnsociety   "
printf "\e[1;94m \n                                Version: 1.0 Stable       "
sleep 1.4
}
lazyaircrack () {
banner
}
lazyaircrack
printf ${Blue}"\n\n════════════════════════════════╣ "$Yellow"Information"${Blue}" ╠════════════════════════════════\\n\n\n"${White}

theIPaddress=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 2>/dev/null) 
echo "\e[0;92mIp Adress : \e[00m " $theIPaddress
cat /etc/*-release 2>/dev/null| grep -e "NAME" -e "VERSION"
lscpu 2>/dev/null 2>/dev/null| grep -e "Architecture" -e "Model name" -e "CPU MHz" 
cat /proc/meminfo 2>/dev/null|grep	-e "MemTotal" -e "MemFree"
lsblk -o "NAME,SIZE,RO,FSTYPE,MOUNTPOINT"
dddd=`uname -r 2>/dev/null`
if [ "$dddd" ]; then
  echo "\e[0;92mKernel :\e[00m $dddd"

else 
  :
fi
sleep 2
printf ${Blue}"\n\n════════════════════════════════╣ "$Yellow"Services"${Blue}" ╠═══════════════════════════════════\n\n"${White}


(service --status-all || service -e || chkconfig --list || rc-status || launchctl list) 2> /dev/null || echo_not_found "service|chkconfig|rc-status|launchctl"
  echo ""


if python --version; then echo "" ;fi


RUBYVERSION=`/usr/bin/ruby -e 'puts RUBY_VERSION' 2> /dev/null`
if [ "$RUBYVERSION" ]; then
  echo "\e[0;92m[-] Ruby Version: \e[00m\n$RUBYVERSION" 
  echo "\n"
fi
PHPVERSION=`php --version | grep -m1 "" `
if [ "$PHPVERSION" ]; then
  echo "\e[0;92m[-] PHP Version: \e[00m\n$PHPVERSION" 
  echo "\n"
fi
MYSQLVERSION=`mysql --version | awk '{print $1,$5}' 2> /dev/null `
if [ "$MYSQLVERSION" ]; then
  echo "\e[0;92m[-] MYSQL Version: \e[00m\n$MYSQLVERSION" 
  echo "\n"
fi
postgver=`psql -V 2>/dev/null`
if [ "$postgver" ]; then
  echo "\e[00;92m[-] Postgres version:\e[00m\n$postgver" 
  echo "\n"
fi
APACHE2VERSION=`/usr/sbin/apache2 -v  `
if [ "$APACHE2VERSION" ]; then
  echo "\e[0;92m[-] Apache2 Version: \e[00m\n$APACHE2VERSION" 
  echo "\n"
fi
SUDOVERSION=`sudo -V | awk '{print $2, $3}'| head -n 1 2> /dev/null `
if [ "$SUDOVERSION" ]; then
  echo "\e[0;92m[-] Sudo Version: \e[00m\n$SUDOVERSION" 
  echo "\n"
fi
SSHVERSION=`ssh -V 2>&1 `
if [ "$SSHVERSION" ]; then
  echo "\e[0;92m[-] SSH Version: \e[00m\n$SSHVERSION" 
  echo "\n"
fi
SAMBAVERSION=`smbstatus --version) 2> /dev/null `
if [ "$SAMBAVERSION" ]; then
  echo "\e[0;92m[-] Samba Version: \e[00m\n$SAMBAVERSION" 
  echo "\n"
fi


if nginx -v 2>/dev/null; then echo "" ;fi

echo "\e[0;93m[+] Useful file locations:\e[00m" ; which nc 2>/dev/null ; which netcat 2>/dev/null ; which wget 2>/dev/null ; which nmap 2>/dev/null ; which gcc 2>/dev/null; which curl 2>/dev/null 
echo "\n" 
pathinfo=`echo $PATH 2>/dev/null`
if [ "$pathinfo" ]; then
  pathswriteable=`ls -ld $(echo $PATH | tr ":" " ")`
  echo "\e[0;93m[+] Path information:\e[00m\n$pathinfo" 
  echo  "$pathswriteable"
  echo  "\n"
fi

printf ${Blue}"══════════════════════════════════╣ "$Yellow"Installed Compiler"${Blue}" ╠═════════════════════════════\\n\n"${White}

(dpkg --list 2>/dev/null | grep "compiler" | grep -v "decompiler\|lib" 2> /dev/null || yum list installed 'gcc*' 2>/dev/null | grep gcc 2>/dev/null; command -v gcc g++ 2>/dev/null || locate -r "/gcc[0-9\.-]\+$" 2>/dev/null | grep -v "/doc/");
echo ""

printf ${Blue}"\n═════════════════════════════════╣ "$Yellow"Logs File"${Blue}" ╠════════════════════════════════════════\\n\n"${White}
find / -name \*.log -ls 2>&1 | sort -r -n -k7 2> /dev/null |  grep -v "Permission denied"
echo "\n"
emailAddress=".*@aivazian.fsnet.co.uk|.*@angband.pl|.*@canonical.com|.*@gov.uk|.*outlook.com|.*@gmail.com|.*@hotmail.com|.*@lists.debian-maintainers.org|.*@mit.edu|.*@oss.sgi.com|.*@qualcomm.com|.*redhat.com|.*ubuntu.com|.*@vger.kernel.org|rogershimizu@gmail.com|thmarques@gmail.com"


echo "\e[0;93m[+] Finding emails inside logs: \e[00m\n"
(find /var/log/ /private/var/log -type f -exec grep -I -R -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" "{}" \;) 2>/dev/null | sort | uniq -c | sort -r -n | head -n 70 | sed -E "s,$emailAddress,${SED_GREEN},g"
  echo ""


echo "\e[0;93m[+] Finding IPs inside logs:\e[00m\n"
  (find /var/log/ /private/var/log -type f -exec grep -R -a -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" "{}" \;) 2>/dev/null | grep -v "\.0\.\|:0\|\.0$" | sort | uniq -c | sort -r -n | head -n 70
  echo ""



printf ${Blue}"\n═════════════════════════════════╣ "$Yellow"Users with root access "${Blue}" ╠════════════════════════════════\n\n"${White}

SudoUser=`grep '^sudo:.*$' /etc/group 2> /dev/null| cut -d: -f4 `
if [ "$SudoUser" ]; then
  echo  "\e[0;92m[+] Root users : \e[00m$SudoUser" 
  echo  "\n"
fi
roothist=`ls -la /root/.*_history 2>/dev/null`
if [ "$roothist" ]; then
  echo "\e[0;93m[+] Root's history files are accessible: \e[00m\n$roothist" 
  echo "\n"
fi



echo  "\n\e[0;93m[+] Can we read/write sensitive files:\e[00m" ; ls -la /etc/passwd 2>/dev/null ; ls -la /etc/group 2>/dev/null ; ls -la /etc/profile 2>/dev/null; ls -la /etc/shadow 2>/dev/null ; ls -la /etc/master.passwd 2>/dev/null 
echo "\n" 

#lists available shells
shellinfo=`cat /etc/shells 2>/dev/null`
if [ "$shellinfo" ]; then
  echo  "\e[0;93m[+] Available shells:\e[00m\n$shellinfo" 
  echo  "\n"
fi


printf ${Blue}"\n═════════════════════════════════╣ "$Yellow"Looking for pcap files "${Blue}" ╠════════════════════════════════\n\n"${White}

Pcapfiles=`find / -name *.pcap 2> /dev/null`
if [ "$Pcapfiles" ]; then
  echo "\e[0;92m[+] Pcap files : \e[00m\n\n$Pcapfiles" 
  echo "\n"
fi



printf ${Blue}"\n═════════════════════════════════╣ "$Yellow"Contab"${Blue}" ╠════════════════════════════════\n\n"${White}
#contab contents
crontabvalue=`cat /etc/crontab 2>/dev/null`
if [ "$crontabvalue" ]; then
  echo "\e[0;93m[+] Crontab contents:\e[00m\n$crontabvalue" 
  echo "\n"
fi

crontabvar=`ls -la /var/spool/cron/crontabs 2>/dev/null`
if [ "$crontabvar" ]; then
  echo  "\e[0;93m[+] Anything interesting in /var/spool/cron/crontabs:\e[00m\n$crontabvar" 
  echo  "\n"
fi

anacronjobs=`ls -la /etc/anacrontab 2>/dev/null; cat /etc/anacrontab 2>/dev/null`
if [ "$anacronjobs" ]; then
  echo  "\e[0;93m[+] Anacron jobs and associated file permissions:\e[00m\n$anacronjobs" 
  echo  "\n"
fi

anacrontab=`ls -la /var/spool/anacron 2>/dev/null`
if [ "$anacrontab" ]; then
  echo  "\e[0;93m[+] When were jobs last executed (/var/spool/anacron contents):\e[00m\n$anacrontab" 
  echo  "\n"
fi

#pull out account names from /etc/passwd and see if any users have associated cronjobs (priv command)
cronother=`cut -d ":" -f 1 /etc/passwd | xargs -n1 crontab -l -u 2>/dev/null`
if [ "$cronother" ]; then
  echo  "\e[0;93m[+] Jobs held by all users:\e[00m\n$cronother" 
  echo  "\n"
fi