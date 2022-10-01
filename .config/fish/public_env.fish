# I know some of these are explict defaults.

# ----------------------
#          ENV
# ----------------------
set -Ux NAME "Liam Kearney"
set -Ux EMAIL liam@sproutlabs.com.au

set -Ux LANG en_US.UTF-8
set -Ux TZ Australia/Hobart

set -Ux EDITOR nvim -e
set -Ux SUDO_EDITOR visudo
set -Ux PAGER less
set -Ux VISUAL nvim
set -Ux BROWSER chrome
set -Ux LESS "-RS"
set -Ux CC clang

set -Ux PROJECTDIR $HOME/Projects
set -Ux MBOX $HOME/mbox
set -Ux MAIL $HOME/mbox

set -Ux DOCKER_BUILDKIT 1

set -Ux JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_333.jdk/Contents/Home
set -Ux ANDROID_SDK_ROOT $HOME/Library/Android/sdk

# Make the lazygit config file the same location as it is on my linux box.
set -Ux CONFIG_DIR $HOME/.config/lazygit

# Setup defaults dir
set -Ux DEFAULTS_CONFIG_DIR $HOME/.config/defaults

# I don't use gradle often so I consider it's config disposable.
set -Ux GRADLE_USER_HOME $HOME/.cache/.gradle

set -Ux PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig

set -Ux AWS_PROFILE personal

# ----------------------
#        OTHER
# ----------------------

# Use node 18 by default.
set -U nvm_default_version 18

# Always install yarn when I install new versions of node.
set -U nvm_default_packages yarn pnpm sass

# Annoying google stuff, May end up using this so avoid signing in manually every day.
set -Ux GOOGLE_API_KEY "no"
set -Ux GOOGLE_DEFAULT_CLIENT_ID "no"
set -Ux GOOGLE_DEFAULT_CLIENT_SECRET "no"
