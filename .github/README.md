# Configs
Not too much visual flair, just solid!

# Env
I use a mix of a Macbook Pro (M3 Max) and a (beefy) Ubuntu machine for development.

Both machines share these dotfiles and config is mostly shared via branching on `uname`.

# Primary software
- [Shortcat](https://shortcat.app/) (Current favourite).
- [VisiData](https://www.visidata.org/).
- Neovim.
- Brew for managing OSX software, My Aptitude use on ubuntu is a mess..
- Chromium (With env setup for no google apis).
    - Both
        - Vimium plugin
        - Refined GH
        - Select2 Anywhere
        - Tampermonkey
        - UBlock Origin
    - Work
        - Lastpass
        - Gruvbox Material
    - Personal
        - 1Pass
        - Gruvbox normal so I can tell the difference.
- Rectangle (premium for ubuntu like window dragging).
- Alt-tab
- Wezterm
    - TMUX
    - NVIM
    - Lazygit
    - RipGrep
- Tunnelblick VPN client
- Alfred
- Yabai active window border
    - Dock disabled
    - Menubar on autohide with KB shortcut

# Install
- You may (for removing files in $HOME) want to grant Terminal.app full disk access (there is no way to automate [TCC](https://book.hacktricks.xyz/macos-hardening/macos-security-and-privilege-escalation/macos-security-protections/macos-tcc) without SIP being disabled).
- Bootstrap git and set hostnames.
	```sh
	/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/LiamKearn/config/main/.github/bootstrap.sh)"
	```
- Clone down this repo.
	```sh
	git clone --separate-git-dir=$HOME/.cfg git@github.com:LiamKearn/config.git $HOME
	```
	alternatively if your `$HOME` has files:
	```sh
	git init --separate-git-dir=$HOME/.cfg $HOME \
		&& git remote add origin git@github.com:LiamKearn/config.git \
		&& git fetch \
		&& git checkout -t origin/main
	```
- Install the bloated wonder "Brew" via it's 30kb install script which has functions just to emit a bell device control sequence.
	```sh
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	```
- Install software
	```
	brew bundle install --file=$HOME/.config/brew/Brewfile
	```

# No Google APIs.
```xml
    <key>GOOGLE_API_KEY</key>
    <string>no</string>
    <key>GOOGLE_DEFAULT_CLIENT_ID</key>
    <string>no</string>
    <key>GOOGLE_DEFAULT_CLIENT_SECRET</key>
    <string>no</string>
``` -> `/Applications/Chromium.app/Contents/Info.plist`

add to `LSEnvironment`
