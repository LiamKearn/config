source $HOME/.config/fish/public_env.fish
source $HOME/.config/fish/private_env.fish

set -Ux EDITOR nvim
set -Ux BROWSER chrome
set -Ux NAME "Liam Kearney"
set -Ux EMAIL liam@sproutlabs.com.au
set -Ux TZ Australia/Hobart
# I don't use -F because if I want cat I'll use cat. :-)
# I don't use -X because if I want cat I'll use cat. :-)
set -Ux LESS "-R"

fish_add_path /usr/local/bin/nvim-osx64/bin
fish_add_path $HOME/.bin

abbr -a l 'ls -1'
abbr -a ll 'ls -la'
abbr -a shi 'ssh imprint'
abbr -a shit 'ssh imprint -t "tmux a; bash -l"'
abbr -a lzg 'lazygit'
abbr -a lzgc 'lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'
abbr -a lzd 'lazydocker'
abbr -a tunconnect 'osascript $HOME/.config/tunnelblick/tunnelconnect.scpt'
abbr -a tunstop 'osascript $HOME/.config/tunnelblick/tunnelstop.scpt'
abbr -a src 'source $HOME/.config/fish/config.fish'

alias readlink='/usr/local/bin/greadlink'
alias vi='nvim'
alias vim='nvim'
alias vic='nvim $HOME/.config/fish/config.fish'
alias vie='nvim $HOME/.config/fish/public_env.fish'
alias viep='nvim $HOME/.config/fish/private_env.fish'
alias findinpath="echo $PATH | sed 's/:/\n/g' | xargs -I % sh -c 'ls -ldhA —color %/* 2>/dev/null;' | fzf"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias rg='rg --no-messages'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
