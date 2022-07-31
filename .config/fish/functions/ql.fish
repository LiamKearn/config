# Credit: https://github.com/oh-my-fish/plugin-osx/blob/master/functions/ql.fish
function ql -d "Quick Look a specified file or directory"
  if [ (count $argv) -gt 0 ]
    qlmanage >/dev/null 2> /dev/null -p $argv &
  else
    echo "No arguments given"
  end
end
