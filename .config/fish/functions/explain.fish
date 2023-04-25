function explain -d "Open a browser with the explainshell.com page for the given command"
    if not test -n "$argv[1]"
        echo "Usage: explain <command>"
        return;
    end
    set base_url 'https://explainshell.com/explain?cmd='
    set cmd (echo $argv[1..-1] | urlencode)
    open "$base_url$cmd"
end
