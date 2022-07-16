set -Ux EDITOR nvim
set -Ux BROWSER chrome
set -Ux NAME "Liam Kearney"
set -Ux EMAIL liam@sproutlabs.com.au
set -Ux TZ Australia/Hobart
# I don't use -F because if I want cat I'll use cat. :-)
# I don't use -X because if I want cat I'll use cat. :-)
set -Ux LESS "-R"

fish_add_path /usr/local/bin/nvim-osx64/bin

abbr -a l 'ls -1sha'
abbr -a ll 'ls -lsha'
abbr -a shi 'ssh imprint'
abbr -a shit 'ssh imprint -t "tmux a; bash -l"'
abbr -a lzg 'lazygit'
abbr -a lzgc 'lazygit --git-dir=$HOME/.cfg --work-tree=$HOME'
abbr -a lzd 'lazydocker'
abbr -a tunconnect 'osascript ~/.tunnelblick/tunnelconnect.scpt'
abbr -a tunstop 'osascript ~/.tunnelblick/tunnelstop.scpt'

alias vi=nvim
alias vic='nvim $HOME/.config/fish/config.fish'
alias vim=nvim
alias findinpath="echo $PATH | sed 's/:/\n/g' | xargs -I % sh -c 'ls -ldhA —color %/* 2>/dev/null;' | fzf"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
