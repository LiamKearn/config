## `setupdefaults`
Uses the [defaults](https://ss64.com/osx/defaults.html) cli to write common mac preferences I prefer.

## `importdefaults`
Very quick and **very useful** script to enable a very simple import-restore functionality with osx defaults.

### Setup
Setup a location in your dotfiles to track your defaults using:
```fish
export DEFAULTS_CONFIG_DIR=$HOME/.config/defaults
```
This is `$HOME/.config/defaults` by default (as shown above) and will be created if it doesn't exist.

### Backup
To backup simply find the bundleID (`CFBundleIdentifier`) of the app you want to backup and then:

```fish
defaults export com.lwouis.alt-tab-macos - > $DEFAULTS_CONFIG_DIR/com.lwouis.alt-tab-macos.plist
```

##### Find bundleID
You can find a bundle in numerous ways, Here are some off the top of my head:
 - Open the app in finder -> Right click -> Show package contents -> Open `Contents` -> Open `Info.plist` and find `CFBundleIdentifier`.
 - Run:
    ```fish
    lsappinfo info -only bundleid Finder | cut -d '"' -f4
    ```
    with Finder as either the App name as it appears in the menu bar or one the following items from the `lsappinfo.8` manpage:
    https://github.com/phracker/MacOSX-SDKs/blob/041600eda65c6a668f66cb7d56b7d1da3e8bcc93/MacOSX10.9.sdk/usr/share/man/man8/lsappinfo.8#L141
 - Run:
    ```fish
    launchctl list | rg APP_NAME
    ```
    or:
    ```fish
    launchctl print | rg APP_NAME
    ```

### Restore
```fish
./importdefaults
```

