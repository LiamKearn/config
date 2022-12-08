function phpoptdiff -d "Displays opcache diffs"
    git diff --no-index \
        (php -d opcache.enable_cli=1 -d opcache.opt_debug_level=0x10000 $argv[1] 2>&1 | psub) \
        (php -d opcache.enable_cli=1 -d opcache.opt_debug_level=0x20000 $argv[1] 2>&1 | psub)
end

