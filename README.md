# Configs
> It's dangerous to type alone take these.
> I still stuck at typing with these..

# TODOs
 - [ ] Either completely switch to arch or use homebrew on Ubuntu (weird).

# Env
I use a mix of a Macbook (4c, intel) and a (beefy) Ubuntu machine for development.

Both machines share these dotfiles and config is mostly shared via branching on `uname`.

# Primary software
 - Shortcat (Current favourite).
 - Code (Would use VIM or jIDEs but code's remote support is the only viable option really)
 - Brew for managing OSX software
 - Chrome
   - Vimium plugin
   - Refined GH
   - Select2 Anywhere
   - Tampermonkey
   - UBlock Origin
 - Rectangle
 - Easy Move+Resize
 - Alt-tab
 - Alacritty
   - TMUX
   - NVIM
   - Lazygit
   - Lazydocker
   - RipGrep
 - Tunnelblick VPN client
 - Alfred
 - Limelight active window border
   - Dock disabled
   - Menubar on autohide with KB shortcut

# Install
```fish
git clone --separate-git-dir=$HOME/.cfg git@github.com:LiamKearn/config.git $HOME
```

# Sync
```fish
config sync <Path to sync>
```

