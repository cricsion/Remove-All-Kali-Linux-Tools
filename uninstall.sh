#!/bin/sh

# Define the tools to remove
TOOLS="maltego msfpc set faraday recordmydesktop pipal cutycapt hashdeep bulk-extractor binwalk autopsy sleuthkit 
pdfid pdf-parser forensic-artifacts guymager magicrescue scalpel scrounge-ntfs dbd powersploit sbd dns2tcp 
exe2hexbat iodine miredo proxychains4 proxytunnel ptunnel pwnat sslh stunnel4 udptunnel laudanum weevely 
mimikatz dnschef netsniff-ng rebind sslsplit tcpreplay ettercap-graphical macchanger mitmproxy responder 
wireshark metasploit-framework exploitdb sqlmap sqlitebrowser bully fern-wifi-cracker spooftooph aircrack-ng 
kismet pixiewps reaver wifite clang nasm radare2 chntpw hashcat hashid hash-identifier ophcrack ophcrack-cli 
samdump2 hydra hydra-gtk onesixtyone patator thc-pptp-bruter passing-the-hash smbmap cewl crunch john medusa 
ncrack wordlists rsmangler dnsenum dnsrecon fierce lbd wafw00f arping fping hping3 masscan thc-ipv6 nmap 
theharvester netdiscover netmask enum4linux nbtscan swaks snmpcheck ssldump sslh sslscan sslyze dmitry ike-scan 
legion recon-ng spike voiphopper nikto unix-privesc-check wpscan burpsuite dirb dirbuster wfuzz cadaver 
davtest skipfish wapiti whatweb commix zaproxy freerdp2-x11 spiderfoot bettercap subfinder feroxbuster amass 
bloodhound cme ghidra sherlock gobuster"

# Remove tools
sudo apt remove -y $TOOLS

# Cleanup and update
sudo apt autoclean 
sudo apt autoremove -y
sudo apt update 

# Optionally remove all config files of removed packages
# dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge

echo "The script has been successfully executed"
echo "Tools have been removed/uninstalled"
echo "Thanks for using this script"
