source $HOME/.config/fish/public_env.fish
source $HOME/.config/fish/private_env.fish
source $HOME/.config/fish/bindings.fish

fish_add_path /usr/local/bin/nvim-osx64/bin
fish_add_path $HOME/.bin

abbr -a l 'ls -1'
abbr -a ll 'ls -la'
abbr -a shi 'ssh imprint'
abbr -a shit 'ssh imprint -t "tmux a; fish -l"'
abbr -a lzg 'lazygit'
abbr -a lzgc 'lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'
abbr -a lzd 'lazydocker'
abbr -a tunconnect 'osascript $HOME/.config/tunnelblick/tunnelconnect.scpt'
abbr -a tunstop 'osascript $HOME/.config/tunnelblick/tunnelstop.scpt'
abbr -a src 'source $HOME/.config/fish/config.fish'
abbr -a tma 'tmux a'

alias ac="AWS_CLI_AUTO_PROMPT=on aws --cli-auto-prompt"
alias readlink='/usr/local/bin/greadlink'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'
alias vic='nvim $HOME/.config/fish/config.fish'
alias cf='cd $HOME/.config'
alias vie='nvim $HOME/.config/fish/public_env.fish'
alias fic='cd $HOME/.config/fish'
alias findinpath="echo $PATH | sed 's/:/\n/g' | xargs -I % sh -c 'ls -ldhA —color %/* 2>/dev/null;' | fzf"
alias findinstash="git stash list | awk '{print \$1}' | sed 's/stash@{//g' | sed 's/}://g' | xargs -t -I '{}' git stash show {} | rg"
alias findinhistory="history | fzf | awk '{\$1=\"\"; print \$0}' | xargs -i{} -p sh -c {}"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rg='rg --no-messages'
alias dostopall='docker stop $(docker ps -q)'
alias dops="docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Names}}' | awk '{if (NR!=1) {print}}' | nl -w2 -s'  '"
alias dopd="docker-compose up -d"

set fish_greeting

if status is-interactive
    function doexec
        set id (docker ps | sed '1d' | awk '{print $1, $2}' | fzf | awk '{print $1}')
        set shell_list "/bin/bash" "/bin/zsh" "redis-cli"
        set chosen_shell (printf '%s\n' $shell_list | fzf)
        docker exec -it $id $chosen_shell
    end
    # Commands to run in interactive sessions can go here
end
