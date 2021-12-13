#!/bin/sh

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

kaliHackingtools=(maltego msfpc set faraday recordmydesktop pipal cutycapt hashdeep bulk-extractor binwalk autopsy sleuthkit pdfid pdf-parser forensic-artifacts guymager magicrescue scalpel scrounge-ntfs dbd powersploit sbd dns2tcp exe2hexbat iodine miredo proxychains4 proxytunnel ptunnel pwnat sslh stunnel4 udptunnel laudanum weevely mimikatz dnschef netsniff-ng rebind sslsplit tcpreplay ettercap-graphical macchanger mitmproxy responder wireshark metasploit-framework exploitdb sqlmap sqlitebrowser bully fern-wifi-cracker spooftooph aircrack-ng kismet pixiewps reaver wifite clang nasm radare2 chntpw hashcat hashid hash-identifier ophcrack ophcrack-cli samdump2 hydra hydra-gtk onesixtyone patator thc-pptp-bruter passing-the-hash mimikatz smbmap cewl crunch john medusa ncrack wordlists rsmangler dnsenum dnsrecon fierce lbd wafw00f arping fping hping3 masscan thc-ipv6 nmap theharvester netdiscover netmask enum4linux nbtscan smbmap swaks onesixtyone snmpcheck ssldump sslh sslscan sslyze dmitry ike-scan legion recon-ng spike voiphopper legion nikto nmap unix-privesc-check wpscan burpsuite dirb dirbuster wfuzz cadaver davtest skipfish wapiti whatweb commix zaproxy freerdp2-x11 scalpel spiderfoot)
installedHackingtools=()
for i in ${kaliHackingtools[*]}; do
    if [ "$(dpkg -l | grep "$i" | awk '{print $2}')" = "$i" ]; then
        echo " ${yellow}➤${reset}  $i  -   [${red}Installed${reset}]"
	installedHackingtools+=("$i")
        sleep 0.1
    else
        echo " ${yellow}➤${reset}  $i  -   [${green}Not Installed${reset}]"
        sleep 0.1
    fi
done
echo "The following hacking tools are installed:
	${installedHackingtools[*]}"
read -p "would you like to remove them?[y/n] " ans
if [ $ans = y ]; then
	sudo apt-get remove ${installedHackingtools[*]} -y

	# Comment out the line above and uncomment the line below to remove configs as well
	# sudo apt-get purge ${installedHackingtools[*]} -y
fi

echo "The script has been successfully executed"
echo "Tools has been removed/uninstalled"
echo "Thanks for using this script"