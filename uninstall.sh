#!/bin/bash

# Define color codes
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

# Trap Ctrl+C to exit the script gracefully
trap "echo -e '\n${RED}Script terminated by user.${RESET}'; exit 1" SIGINT SIGTERM

# Function to install script as a system command
install_script() {
	echo -e "${YELLOW}Installing systoolclean as a system command...${RESET}"
	sudo cp "$0" /usr/local/bin/systoolclean
	sudo chmod +x /usr/local/bin/systoolclean
	echo -e "${GREEN}systoolclean command is now available.${RESET}"
}

# Function to display menu
show_menu() {
	echo -e "${GREEN}=============================================${RESET}"
	echo -e "${GREEN}			 KALI TOOLS REMOVER MENU		  ${RESET}"
	echo -e "${GREEN}=============================================${RESET}"
	echo -e "${YELLOW}1) Run the script in optimal mode${RESET}"
	echo -e "${YELLOW}2) View script details${RESET}"
	echo -e "${YELLOW}3) Install as systoolclean command${RESET}"
	echo -e "${YELLOW}4) Exit${RESET}"
	echo -e "${GREEN}=============================================${RESET}"
	read -p "Enter your choice: " choice
	case $choice in
		1) run_script;;
		2) show_info;;
		3) install_script;;
		4) exit 0;;
		*) echo -e "${RED}Invalid choice, please try again${RESET}"; show_menu;;
	esac
}

# Function to display script functionality
show_info() {
	echo -e "${GREEN}This script removes a set of pre-installed Kali tools, performs system cleanup, and updates package lists.${RESET}"
	echo -e "${GREEN}At the end, it prompts whether to restart the system.${RESET}"
	show_menu
}

# Function to execute script tasks
run_script() {
	TOOLS=(
		"aircrack-ng" "amass" "arping" "autopsy" "bettercap" "binwalk" "bloodhound" "bulk-extractor" "burpsuite"
		"cadaver" "cewl" "cherrytree" "chntpw" "clang" "commix" "crackmapexec" "crunch" "cutycapt" "davtest"
		"dbd" "dirb" "dirbuster" "dmitry" "dns2tcp" "dnschef" "dnsenum" "dnsrecon" "enum4linux" "ettercap-graphical"
		"evil-winrm" "exe2hexbat" "faraday" "feroxbuster" "fierce" "ffuf" "forensic-artifacts" "fping" "freerdp2-x11"
		"ghidra" "gobuster" "guymager" "hash-identifier" "hashcat" "hashdeep" "hashid" "hping3" "hydra" "hydra-gtk"
		"ike-scan" "impacket-scripts" "iodine" "john" "kali-autopilot" "kismet" "lbd" "laudanum" "legion" "macchanger"
		"magicrescue" "maltego" "maltego-installer" "masscan" "medusa" "metasploit-framework" "mimikatz" "miredo"
		"mitmproxy" "msfpc" "nasm" "nbtscan" "ncrack" "netcat" "netdiscover" "netsniff-ng" "netmask" "nikto"
		"nmap" "onesixtyone" "ophcrack" "ophcrack-cli" "passing-the-hash" "patator" "pdf-parser" "pdfid"
		"pipal" "pixiewps" "powershell-empire" "powersploit" "proxychains4" "proxytunnel" "ptunnel" "pwnat"
		"radare2" "reaver" "rebind" "recordmydesktop" "recon-ng" "responder" "rsmangler" "samdump2" "scalpel"
		"scapy" "scrounge-ntfs" "sbd" "set" "sherlock" "skipfish" "sleuthkit" "smbmap" "snmpcheck" "spiderfoot"
		"spike" "spooftooph" "sqlmap" "sqlitebrowser" "ssldump" "sslh" "sslscan" "sslsplit" "sslyze" "starkiller"
		"stunnel4" "subfinder" "swaks" "tcpreplay" "tcpdump" "thc-ipv6" "thc-pptp-bruter" "theharvester" "udptunnel"
		"unix-privesc-check" "voiphopper" "wafw00f" "wapiti" "weevely" "webshells" "whatweb" "wireshark" "wifite"
		"wordlists" "wpscan" "zaproxy"
	)

	echo -e "${YELLOW}Removing specified tools...${RESET}"
	for tool in "${TOOLS[@]}"; do
		echo -e "${YELLOW}Removing: $tool${RESET}"
		sudo apt remove -y "$tool"
	done

	echo -e "${YELLOW}Cleaning up unnecessary packages...${RESET}"
	sudo apt autoclean
	sudo apt autoremove -y
	sudo apt update

	read -p "Do you want to remove residual config files? (y/n): " clean_configs
	if [[ "$clean_configs" =~ ^[Yy]$ ]]; then
		if dpkg -l | grep '^rc' >/dev/null; then
			echo -e "${YELLOW}Removing residual config files...${RESET}"
			dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge
		else
			echo -e "${GREEN}No residual config files found.${RESET}"
		fi
	fi

	echo -e "${GREEN}The script has been successfully executed.${RESET}"
	echo -e "${GREEN}All tools have been removed.${RESET}"
	echo -e "${YELLOW}Would you like to restart the system? (y/n)${RESET}"
	read -p "Enter your choice: " restart_choice
	if [[ "$restart_choice" =~ ^[Yy]$ ]]; then
		echo -e "${YELLOW}Restarting system...${RESET}"
		sudo reboot
	else
		echo -e "${GREEN}System restart skipped.${RESET}"
	fi
}

# Run menu
show_menu
