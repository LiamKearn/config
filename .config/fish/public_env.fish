# A lot of these are explict defaults
set -Ux NAME "Liam Kearney"
set -Ux EMAIL liam@sproutlabs.com.au

set -Ux LANG en_US.UTF-8
set -Ux TZ Australia/Hobart

set -Ux EDITOR nvim -e
set -Ux SUDO_EDITOR visudo
set -Ux PAGER less
set -Ux VISUAL nvim
set -Ux BROWSER chrome
set -Ux LESS "-R"
set -Ux CC clang

set -Ux PROJECTDIR $HOME/Projects
set -Ux MBOX $HOME/mbox
set -Ux MAIL $HOME/mbox

# Make the lazygit config file the same location as it is on my linux box.
set -Ux CONFIG_DIR $HOME/.config/lazygit

# Setup defaults dir
set -Ux DEFAULTS_CONFIG_DIR $HOME/.config/defaults

# I don't use gradle often so I consider it's config disposable.
set -Ux GRADLE_USER_HOME $HOME/.cache/.gradle

