function phpoptdiff -d "Displays opcache diffs"
    if not test -n "$argv[1]"
        return;
    end
    set optlevels 0x10000 0x20000 0x40000 0x80000 0x200000 0x400000
    set startlevel (printf '%s\n' $optlevels | fzf --prompt 'Choose a starting optimisation level: ' --layout=reverse)
    if not test -n "$startlevel"
        return;
    end
    set endlevel (printf '%s\n' $optlevels | fzf --prompt 'Choose a optimised level: ' --layout=reverse)
    if not test -n "$endlevel"
        return;
    end
    git diff --no-index \
        (php -d opcache.enable_cli=1 -d opcache.opt_debug_level=$startlevel $argv[1] 2>&1 | psub) \
        (php -d opcache.enable_cli=1 -d opcache.opt_debug_level=$endlevel $argv[1] 2>&1 | psub)
end
