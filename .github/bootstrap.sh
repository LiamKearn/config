#/usr/bin/env sh

set -ev;

CLI_TMP_FLAG_PATH="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress";

# Install command line tools for git
touch $CLI_TMP_FLAG_PATH \
    ; softwareupdate --verbose -i "$(softwareupdate -l | sed -n 's/^* Label: \(Command Line Tools for Xcode-\([[:digit:]]*\)\.\([[:digit:]]*\)\)$/\1/p')" \
    ; rm $CLI_TMP_FLAG_PATH;

# Install rosetta for whatever needs it
softwareupdate --install-rosetta --agree-to-license;
