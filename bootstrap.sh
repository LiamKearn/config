#/usr/bin/env sh

set -ev;

CLI_TMP_FLAG_PATH="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress";

sudo scutil --set HostName "liam.macbook.liamkearn.me" \
	&& sudo scutil --set ComputerName "Liam's Macbook Pro" \
	&& sudo dscacheutil -flushcache;

touch $CLI_TMP_FLAG_PATH \
	; softwareupdate --verbose -i "$(softwareupdate -l | sed -n 's/^* Label: \(Command Line Tools for Xcode-\([[:digit:]]*\)\.\([[:digit:]]*\)\)$/\1/p')" \
	; rm $CLI_TMP_FLAG_PATH;
