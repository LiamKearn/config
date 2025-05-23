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
set -Ux LESSHISTFILE "$XDG_STATE_HOME/less/history"
set -Ux MYSQL_HISTFILE "$XDG_DATA_HOME/mysql/mysql_history"
set -Ux HISTFILE "$XDG_DATA_HOME/history"
set -Ux CC gcc-14
set -Ux CXX clang++
set -Ux NODE_REPL_HISTORY "$XDG_STATE_HOME/node/repl_history"
set -Ux GNUPGHOME "$XDG_CONFIG_HOME/gnupg"
set -Ux RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/config"
set -Ux GNUPGHOME "$XDG_CONFIG_HOME/gnupg"
set -Ux PROJECTDIR $HOME/Projects
set -Ux MBOX $HOME/mbox
set -Ux MAIL $HOME/mbox
set -Ux DOCKER_BUILDKIT 1
set -Ux HOMEBREW_NO_AUTO_UPDATE 1
set -Ux PYTHONSTARTUP "$XDG_CONFIG_HOME/python/init.py"
set -Ux CDK_HOME "$XDG_DATA_HOME/cdk"
set -Ux WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
set -Ux ZDOTDIR "$XDG_CONFIG_HOME/zsh"

switch (uname)
    case Darwin
        set -Ux LOG_HOME $HOME/Library/Logs
        set -Ux LOG_ROOT /Library/Logs
        set -Ux SDKROOT (xcrun --sdk macosx --show-sdk-path)
        set -Ux LIBRARY_PATH "$sdk_root/usr/lib"
        set -Ux JAVA_HOME /opt/homebrew/opt/openjdk@21

        set -Ux VCPKG_ROOT $HOME/vcpkg
        set -Ux CMAKE_MAKE_PROGRAM Ninja
    case Linux
        set -Ux LOG_HOME $XDG_STATE_HOME
        set -Ux LOG_ROOT /var/log
        set -Ux JAVA_HOME /usr/lib/jvm/default-java
end

# Setup defaults dir
set -Ux DEFAULTS_CONFIG_DIR $XDG_CONFIG_HOME/defaults

set -Ux GOPATH $XDG_DATA_HOME/go
set -Ux ANDROID_SDK_ROOT $HOME/Library/Android/sdk

# I don't use gradle often so I consider it's config disposable.
set -Ux GRADLE_USER_HOME $HOME/.cache/.gradle

set -Ux PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig

set -Ux AWS_PROFILE personal

# ----------------------
#        OTHER
# ----------------------

# Use node 20 by default.
set -U nvm_default_version 20

# Always install yarn when I install new versions of node.
set -U nvm_default_packages yarn pnpm sass aws-cdk

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
