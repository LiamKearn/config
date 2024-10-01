# Configs
Not too much visual flair, just solid!

# Env
I use a mix of a Macbook Pro (M3 Max) and a (beefy) Ubuntu machine for development.

Both machines share these dotfiles and config is mostly shared via branching on `uname`.

# Primary software
- [Shortcat](https://shortcat.app/) (Current favourite)
- Brew for managing OSX software, My Aptitude use on ubuntu is a mess
- Firefox
- Rectangle (premium for ubuntu like window dragging)
- Alt-tab
- Alfred
- Janky Borders Borders
- Dock disabled (auto-hide delay set beyond whats possible in settings)
- Wezterm
- [VisiData](https://www.visidata.org/)
- TMUX
- Neovim
- Lazygit
- RipGrep

# Install
- You may (for removing files in $HOME) want to grant Terminal.app full disk access (there is no way to automate [TCC](https://book.hacktricks.xyz/macos-hardening/macos-security-and-privilege-escalation/macos-security-protections/macos-tcc) without SIP being disabled).
- Bootstrap git to get these configs
    ```sh
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/LiamKearn/config/main/.config/bin/bootstrap.sh)"
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
- Change over to fish for things to work properly
    ```sh
    which fish | sudo tee -a /etc/shells
    chsh -s $(which fish)
    ```
- Grant wezterm full fisk access (optionally remove it from terminal.app in case that ever becomes an exploit target)
- Close terminal
- Open up wezterm
- Setup defaults
    ```sh
    $HOME/.config/bin/setupdefaults
    # ALTERNATIVELY:
    # If you've closed the terminal fish should now be default and setupdefaults will be in your path
    setupdefaults
    ```

