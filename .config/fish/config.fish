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
fish_add_path $HOME/.cargo/bin
fish_add_path $ANDROID_SDK_ROOT/tools/bin
fish_add_path $ANDROID_SDK_ROOT/platform-tools
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/go/bin
fish_add_path /usr/local/llvm/bin

switch (uname)
    case Darwin
        alias todo="vi $HOME/Documents/todo.md"
        alias qtodo="ql $HOME/Documents/todo.md"
        alias readlink='/usr/local/bin/greadlink'

        abbr -a shi 'ssh imprint'
        abbr -a shit 'ssh imprint -t "tmux a; fish -l"'
        abbr -a tunconnect 'osascript $HOME/.config/tunnelblick/tunnelconnect.scpt'
        abbr -a tunstop 'osascript $HOME/.config/tunnelblick/tunnelstop.scpt'
    case Linux
        alias clip="nc -N localhost 8377"
        alias dostopall='docker stop (docker ps -q)'
        alias dops="docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}' | awk '{if (NR!=1) {print}}' | nl -w2 -s'  '"
        alias dopd="docker-compose up -d"
end

abbr -a lzg 'lazygit'
abbr -a lzd 'lazydocker'
abbr -a lzgc 'lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'
abbr -a src 'source $HOME/.config/fish/config.fish'
abbr -a tma 'tmux a'
abbr -a cd- 'cd -'

alias l='exa -1 --icons'
alias ll='exa --grid -a --group-directories-first --icons -s Ext'
alias ls='exa --long --octal-permissions --no-time --no-filesize --header --group'
alias ac="AWS_CLI_AUTO_PROMPT=on aws --cli-auto-prompt"
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
alias down='cd $HOME/Downloads'

# Setup completion for 1pass.
op completion fish | source

op whoami > /dev/null
if test $status -ne 0
    set session_token (op signin --account my)
    if test $status -eq 0
        set session_token (string split 'export ' -f2 $session_token)
        set session_token (string split '=' $session_token)
        # Must remove quotes!! This one was a pain to realise. Fish != bash.
        set -Ux $session_token[1] (echo $session_token[2] | tr -d '"')
    else
        echo "Signin failed"
    end
end

set fish_greeting
