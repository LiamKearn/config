function doexec
    set id (docker ps | sed '1d' | awk '{print $1, $2}' | fzf | awk '{print $1}')
    set shell_list "/bin/bash" "/bin/zsh" "redis-cli"
    set chosen_shell (printf '%s\n' $shell_list | fzf)
    commandline -r -- "docker exec -it $id $chosen_shell"
end

