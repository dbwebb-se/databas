printf "# Details on your release: "
lsb_release -a

printf "# You are: %s\n" "$( whoami )"

printf "# Your hostname is: %s\n" "$( hostname )"
