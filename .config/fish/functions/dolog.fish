function dolog
    set id (docker ps | sed '1d' | awk '{print $1, $2}' | fzf | awk '{print $1}')
    commandline -r -- "docker logs -f --since 0m $id"
end

