if not status --is-interactive
    # SOS.
    alias vi nvim
    alias vim nvim
	exit
end

source $HOME/.config/fish/public_env.fish
if test -f $HOME/.config/fish/private_env.fish
    source $HOME/.config/fish/private_env.fish
end
source $HOME/.config/fish/bindings.fish

fish_add_path /usr/local/bin/nvim-osx64/bin
fish_add_path $HOME/.bin
fish_add_path $XDG_DATA_HOME/cargo/bin
fish_add_path $ANDROID_SDK_ROOT/tools/bin
fish_add_path $ANDROID_SDK_ROOT/platform-tools
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/go/bin
fish_add_path /usr/local/llvm/bin
fish_add_path /usr/local/opt/mysql-client/bin
fish_add_path /Users/liamk/.pyenv/versions/2.7.18/bin

switch (uname)
    case Darwin
        alias todo="vi $HOME/Documents/todo.md"
        alias todop="vi $HOME/Documents/todo-personal.md"
        alias qtodo="ql $HOME/Documents/todo.md"
        alias readlink='/usr/local/bin/greadlink'
        alias sed='/usr/local/bin/gsed'

        abbr -a shi 'ssh ubuntu'
        abbr -a shit 'ssh ubuntu -t "tmux a; fish -l"'
        abbr -a tunconnect 'osascript $HOME/.config/tunnelblick/tunnelconnect.scpt'
        abbr -a tunstop 'osascript $HOME/.config/tunnelblick/tunnelstop.scpt'

        # pnpm
        set -gx PNPM_HOME "/Users/liamk/Library/pnpm"
        set -gx PATH "$PNPM_HOME" $PATH
        # pnpm end
    case Linux
        alias dostopall='docker stop (docker ps -q)'
        alias dops="docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}' | awk '{if (NR!=1) {print}}' | nl -w2 -s'  '"
        alias dopd="docker-compose up -d"
        # pnpm
        set -gx PNPM_HOME "/home/liam/.local/share/pnpm"
        set -gx PATH "$PNPM_HOME" $PATH
        # pnpm end
end

alias sign='echo "" | gpg --sign -u "Liam Kearney" > /dev/null'
abbr -a lzg 'sign; lazygit'
abbr -a lzd 'lazydocker'
abbr -a lzgc 'sign; lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'
abbr -a src 'source $HOME/.config/fish/config.fish'
abbr -a tma 'tmux a'
abbr -a cd- 'cd -'

alias pf='pushd (fd . --search-path $HOME/Work/ --search-path $HOME/Projects/ --type d -d 1 | fzf --preview "ls {}")'
alias l='exa -1 --icons'
alias ll='exa --grid -a --group-directories-first --icons -s Ext'
alias ls='exa --long --octal-permissions --no-time --no-filesize --header --group'
alias ac="AWS_CLI_AUTO_PROMPT=on aws --cli-auto-prompt"
alias pn="pnpm"
alias vi='nvim'
alias vim='nvim'
alias vic='nvim $HOME/.config/fish/config.fish'
alias vie='nvim $HOME/.config/fish/public_env.fish'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rg='rg --no-messages'
alias htop="sudo htop"

# Dirstack stuff | TODO the OSX stuff is stupid as always.
alias ds='dirs | awk -v OFS="\n" "{\$1=\$1}1"'
alias jd='pushd'
alias pd='popd'

# Directory aliases.
alias fic='cd $HOME/.config/fish'
alias cf='cd $HOME/.config'
alias ncf='cd $HOME/.config/nvim'
alias doc='cd $HOME/Documents'
alias note='pushd $HOME/Notes && nvim'
alias down='cd $HOME/Downloads'
alias :q='exit'

# URL Decode
alias urldecode='php -r "echo urldecode(stream_get_contents(STDIN));"'

set fish_greeting

# Setup completion for 1pass.
op completion fish | source

