if status is-interactive
    function launchtmux
        if not test -n "$TMUX"
            tmux; clear
        end
    end
    bind \ct launchtmux
end
