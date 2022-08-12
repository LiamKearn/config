function launchtmux -d "Launches tmux interactively if no other instance exists."
    if not test -n "$TMUX"
        commandline -r -- tmux
        commandline -f execute
    end
end

