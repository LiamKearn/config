function brew
    set -l disabled_commands "search" "bundle" "bundle dump" "info"
    if contains $argv[1] $disabled_commands
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

