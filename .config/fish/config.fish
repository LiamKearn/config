if not status --is-interactive
    # SOS.
    alias vi nvim
    alias vim nvim
    exit
end

source $HOME/.config/fish/public_env.fish
if test -f $XDG_CONFIG_HOME/fish/private_env.fish
    source $XDG_CONFIG_HOME/fish/private_env.fish
end
source $XDG_CONFIG_HOME/fish/bindings.fish

fish_add_path /opt/homebrew/{bin,sbin}
if test -d /opt/homebrew/opt/mysql-client
    fish_add_path /opt/homebrew/opt/mysql-client/bin
end
fish_add_path $XDG_CONFIG_HOME/bin
fish_add_path $XDG_DATA_HOME/cargo/bin
fish_add_path $XDG_DATA_HOME/rustup/toolchains/nightly-x86_64-apple-darwin/bin
fish_add_path $ANDROID_SDK_ROOT/tools/bin
fish_add_path $ANDROID_SDK_ROOT/platform-tools
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.docker/bin

switch (uname)
    case Darwin
        alias todo="vi $HOME/Documents/todo.md"
        alias todop="vi $HOME/Documents/todo-personal.md"
        alias qtodo="ql $HOME/Documents/todo.md"
        alias readlink='greadlink'
        alias sed='gsed'
        alias .c='echo (pwd) | tr -d "\n" | pbcopy'

        abbr -a shi 'ssh ubuntu'
        abbr -a shit 'ssh ubuntu -t "tmux a; fish -l"'
        abbr -a tunconnect 'osascript $XDG_CONFIG_HOME/tunnelblick/tunnelconnect.scpt'
        abbr -a tunstop 'osascript $XDG_CONFIG_HOME/tunnelblick/tunnelstop.scpt'

        set -gx PNPM_HOME "$HOME/Library/pnpm"
        fish_add_path $PNPM_HOME
    case Linux
        alias dostopall='docker stop (docker ps -q)'
        alias dops="docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}' | awk '{if (NR!=1) {print}}' | nl -w2 -s'  '"
        alias dopd="docker-compose up -d"

        set -gx PNPM_HOME "$HOME/.local/share/pnpm"
        fish_add_path $PNPM_HOME
end

alias sign='set GPG_TTY (tty) && echo "" | gpg --sign -u "LiamKearn" > /dev/null'
alias lzg 'set GPG_TTY (tty) && lazygit'
alias lzgc 'lzg --git-dir=$HOME/.cfg --work-tree=$HOME'
abbr -a lzd 'lazydocker'
abbr -a src 'source $XDG_CONFIG_HOME/fish/config.fish'
abbr -a tma 'tmux a'
abbr -a cd- 'cd -'
abbr -a cd.. 'cd ..'
abbr -a chmox 'chmod u+x'
# cd... -> cd ../../, cd.... -> cd ../../../ etc.
for level in (seq 1 5)
    set dot_count (string repeat -n (math $level + 2) '.')
    set alias (string join '' 'cd' $dot_count)

    set dirs_up (string repeat -n (math $level + 1) '../')
    set cmd (string join '' 'cd ' $dirs_up)

    abbr -a $alias $cmd
end

alias pf='pushd (fd . --search-path $HOME/Source/ --type d -d 1 | fzf --preview "git --no-pager --git-dir {}/.git log 2>/dev/null -n10")'
alias l='eza -1 --icons'
alias la='eza -1 --icons -a'
alias lt='eza -1 --icons -T'
alias ltl='eza -1 --icons -T -L '
alias ll='eza --grid -a --group-directories-first --icons -s Ext'
alias ls='eza --long --octal-permissions --no-permissions --no-time --no-filesize --header --group'
alias ac="AWS_CLI_AUTO_PROMPT=on aws --cli-auto-prompt"
alias pn="pnpm"
alias vi='nvim'
alias vim='nvim'
alias vic='nvim $XDG_CONFIG_HOME/fish/config.fish'
alias vie='nvim $XDG_CONFIG_HOME/fish/public_env.fish'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rg='rg --no-messages'
alias htop="sudo htop"
alias icat="wezterm imgcat"

# Dirstack stuff | TODO the OSX stuff is stupid as always.
alias ds='dirs | awk -v OFS="\n" "{\$1=\$1}1"'
alias jd='pushd'
alias pd='popd'

# Directory aliases.
alias fic='cd $XDG_CONFIG_HOME/fish'
alias cf='cd $XDG_CONFIG_HOME'
alias sc='cd $HOME/Source'
alias ncf='cd $XDG_CONFIG_HOME/nvim'
alias doc='cd $HOME/Documents'
alias down='cd $HOME/Downloads'
alias :q='exit'
alias .='pwd'

# URL Decode
alias urldecode='php -r "echo urldecode(stream_get_contents(STDIN));"'
alias urlencode='php -r "echo urlencode(stream_get_contents(STDIN));"'

# Program XDG overrides:
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

set fish_greeting

# 1pass plugins.
source $XDG_CONFIG_HOME/op/plugins.sh

# Setup completion for 1pass
op completion fish | source

