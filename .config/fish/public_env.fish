# I know some of these are explict defaults.

if status --is-interactive
    set GPG_TTY (tty)
end

# ----------------------
#         XDG
# ----------------------
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_STATE_HOME "$HOME/.local/state"

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
set -Ux BROWSER chromium
set -Ux LESS "-RS"
set -Ux HISTFILE "$XDG_DATA_HOME/history"
set -Ux CC clang
set -Ux CXX clang++

set -Ux PROJECTDIR $HOME/Projects
set -Ux MBOX $HOME/mbox
set -Ux MAIL $HOME/mbox

set -Ux DOCKER_BUILDKIT 1

switch (uname)
    case Darwin
        set -Ux LOG_HOME $HOME/Library/Logs
        set -Ux LOG_ROOT /Library/Logs
        set -Ux JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_333.jdk/Contents/Home
        set -Ux SDKROOT /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.3.sdk
    case Linux
        set -Ux LOG_HOME $XDG_STATE_HOME
        set -Ux LOG_ROOT /var/log
        set -Ux JAVA_HOME /usr/lib/jvm/default-java
end

set -Ux GOPATH $XDG_DATA_HOME/go

set -Ux ANDROID_SDK_ROOT $HOME/Library/Android/sdk

# Make the lazygit config file the same location as it is on my linux box.
set -Ux CONFIG_DIR $XDG_CONFIG_HOME/lazygit

# Setup defaults dir
set -Ux DEFAULTS_CONFIG_DIR $XDG_CONFIG_HOME/defaults

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

# ----------------------
#        TERM
# ----------------------
set -Ux TERM xterm-color

# ----------------------
#        COLOR
# ----------------------
set -Ux GREP_OPTIONS '--color=auto'
set -Ux GREP_COLOR '1;32'
set -Ux CLICOLOR 1

# ----------------------
#         HOME
# ----------------------
# Rust
set -Ux CARGO_HOME "$XDG_DATA_HOME/cargo"
set -Ux RUSTUP_HOME "$XDG_DATA_HOME/rustup"

# AWS
set -Ux AWS_SHARED_CREDENTIALS_FILE "$XDG_CONFIG_HOME/aws/credentials"
set -Ux AWS_CONFIG_FILE "$XDG_CONFIG_HOME/aws/config"

# Gradle
set -Ux GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"

# NVM
set -Ux NVM_DIR "$XDG_DATA_HOME/nvm"

# NPM
set -Ux NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"

set -Ux GPG_TTY (tty)
