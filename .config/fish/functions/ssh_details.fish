function ssh_details -d "Displays user, host and port for the given ssh host, seperated by a space"
    echo (ssh -G $argv[1] | rg '^user\s(.*)$|^hostname\s(.*)$|^port\s(.*)$' -r \$1\$2\$3)
end
