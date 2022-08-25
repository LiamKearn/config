function dolog
    set id (docker ps --format '{{.Label "com.docker.compose.project"}}\t{{ .ID }}\t{{ .Image }}' | fzf | awk '{print $2}')
    if not test -n "$id"
        return
    end
    commandline -r -- "docker logs -f --since 0m $id"
end

