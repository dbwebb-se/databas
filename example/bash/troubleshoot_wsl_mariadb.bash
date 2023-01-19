#
# Execute remote as:
# curl -s https://raw.githubusercontent.com/dbwebb-se/databas/master/example/bash/troubleshoot_wsl_mariadb.bash | bash
#
printf "# Details on your release: "
lsb_release -a

printf "# You are:                   %s\n" "$( whoami )"
printf "# Your'e home directory is:  %s\n" "$HOME"

printf "# Your hostname is:          %s\n" "$( hostname )"

declare -A address
address[public]=$( curl -s http://ipinfo.io/ip )
printf "# Your public ip address is: %s\n" "${address[public]}"

address[wsl]=$( ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}' )
printf "# Your WSL ip address is:    %s\n" "${address[wsl]}"

address[winhost]=$( hostname ).local
printf "# Your Windows hostname is:  %s\n" "${address[winhost]}"

address[dig]=$( dig +short $( hostname ).local A | head -1 )
printf "# Win IP by 'dig' is:        %s\n" "${address[dig]}"
dig +short $( hostname ).local A

address[localhost]="127.0.0.1"


#
# Additional details in PowerShell
#
# Get the IP address
#  Get-NetIPAddress
#
# Check what version on WSL
#  wsl --list --verbose
#
# Show ipaddress of running WSL (?)
#  wsl hostname -i
