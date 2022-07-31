if status is-interactive
    function launchtmux
        if not test -n "$TMUX"
            commandline -r -- tmux
            commandline -f execute
        end
    end
    bind \ct launchtmux
end
