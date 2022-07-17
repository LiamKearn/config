set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux BROWSER chrome
set -Ux NAME "Liam Kearney"
set -Ux EMAIL liam@sproutlabs.com.au
set -Ux TZ Australia/Hobart
# I don't use -F because if I want cat I'll use cat. :-)
# I don't use -X because if I want cat I'll use cat. :-)
set -Ux LESS "-R"

# Make the lazygit config file the same location as it is on my linux box.
set -Ux CONFIG_DIR $HOME/.config/lazygit

# I don't use gradle often so I consider it's config disposable.
set -Ux GRADLE_USER_HOME $HOME/.cache/.gradle

