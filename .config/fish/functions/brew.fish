function brew
    set -l enabled_commands \
        "install" \
        "uninstall" \
        "upgrade" \
        "update" \
        "tap" \
        "untap"

    if not contains -- "$argv[1]" $enabled_commands
        command brew $argv
        return
    end

    set brewfile_location $XDG_CONFIG_HOME/brew/Brewfile
    if command brew $argv
        command brew bundle dump --file=$brewfile_location --force
        printf "Dumped brewfile to %s\n" $brewfile_location
    else
        printf "Not dumping brewfile something went wrong.\n"
    end
end

