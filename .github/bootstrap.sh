#/usr/bin/env sh

set -ev;

mkdir -p $HOME/{.ssh,.run};

CLI_TMP_FLAG_PATH="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress";

# Setup hostnames and restart DNS
sudo scutil --set HostName "liam.macbook.liamkearn.me" \
	&& sudo scutil --set ComputerName "Liam's Macbook Pro" \
	&& sudo dscacheutil -flushcache;

# Remove everything from dock, going to be disabled later anyways
defaults write com.apple.dock persistent-apps array;
killall Dock;

# Install command line tools for git
touch $CLI_TMP_FLAG_PATH \
	; softwareupdate --verbose -i "$(softwareupdate -l | sed -n 's/^* Label: \(Command Line Tools for Xcode-\([[:digit:]]*\)\.\([[:digit:]]*\)\)$/\1/p')" \
	; rm $CLI_TMP_FLAG_PATH;

# Install rosetta for whatever needs it
softwareupdate --install-rosetta --agree-to-license;
