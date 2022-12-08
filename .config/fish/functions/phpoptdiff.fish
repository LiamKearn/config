function phpoptdiff -d "Displays opcache diffs"
    if not test -n "$argv[1]"
        return;
    end
    set header 'https://www.npopov.com/2022/05/22/The-opcache-optimizer.html
---
0x10000: Dump before optimizer.
0x20000: Dump after optimizer.
0x40000: Dump before CFG optimizations.
0x80000: Dump after CFG optimizations.
0x200000: Dump before SSA optimizations.
0x400000: Dump after SSA optimizations.
---
'
    set optlevels 0x10000 0x20000 0x40000 0x80000 0x200000 0x400000
    set startlevel (printf '%s\n' $optlevels | fzf --prompt 'Choose a starting optimisation level: ' --layout=reverse --header $header --header-first)
    if not test -n "$startlevel"
        return;
    end
    set endlevel (printf '%s\n' $optlevels | fzf --prompt 'Choose a optimised level: ' --layout=reverse --tac --header $header --header-first)
    if not test -n "$endlevel"
        return;
    end
    git diff --no-index \
        (php -d opcache.enable_cli=1 -d opcache.opt_debug_level=$startlevel $argv[1] 2>&1 | psub) \
        (php -d opcache.enable_cli=1 -d opcache.opt_debug_level=$endlevel $argv[1] 2>&1 | psub)
end
