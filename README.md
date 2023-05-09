# Configs
> It's dangerous to type alone, take these.
> I still stuck at typing with these.

# Env
I use a mix of a Macbook (4c, intel) and a (beefy) Ubuntu machine for development.

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
```fish
git clone --separate-git-dir=$HOME/.cfg git@github.com:LiamKearn/config.git $HOME
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
