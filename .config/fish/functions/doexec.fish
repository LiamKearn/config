function doexec
    set id (docker ps --format '{{.Label "com.docker.compose.project"}}\t{{ .ID }}\t{{ .Image }}' | fzf | awk '{print $2}')
    if not test -n "$id"
        return
    end
    set shell_list "/bin/bash" "/bin/zsh" "redis-cli"
    set chosen_shell (printf '%s\n' $shell_list | fzf)
    if not test -n "$chosen_shell"
        return
    end
    commandline -r -- "docker exec -it $id $chosen_shell"
end

