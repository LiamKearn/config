#!/usr/bin/env sh
set -ex

# Show URL on link hover
defaults write ShowOverlayStatusBar -bool false

# Enable compact tab mode
defaults write com.apple.Safari ShowStandaloneTabBar -bool false

# WTF IS THIS? no f'ing thank you
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable debug menu in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable web dev tools (eww)
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# Tabs open after last tab
defaults write com.apple.Safari WBSNewTabPositionPreferenceKey -int 3

# Open custom blank homepage
defaults write com.apple.Safari HomePage -string "file://$(readlink -f $HOME/.config/safari/index.html)"

# New tabs open to Home page
defaults write com.apple.Safari NewTabBehavior -int 0

# Update ts for above
defaults write com.apple.Safari NewTabPageLastModified -string "$(date -u +"%Y-%m-%d %H:%M:%S %z")"

# New windows open to Home page
defaults write com.apple.Safari NewWindowBehavior -int 0

# Don't restore sessions at all
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
defaults write com.apple.Safari ExcludePrivateWindowWhenRestoringSessionAtLaunch -bool true

defaults write com.apple.Safari "ExtensionsToolbarConfiguration BrowserToolbarIdentifier-v4.6" -dict-add OrderedToolbarItemIdentifiers '{
    OrderedToolbarItemIdentifiers = (
        SidebarSeparatorToolbarItemIdentifier,
        UnifiedTabBarToolbarIdentifier
    );
}'
defaults write com.apple.Safari "NSToolbar Configuration BrowserToolbarIdentifier-v4.6" -dict-add "TB Item Identifiers" '(
    SidebarSeparatorToolbarItemIdentifier,
    UnifiedTabBarToolbarIdentifier
)'

# Toolbar configuration
# defaults write com.apple.Safari "ExtensionsToolbarConfiguration BrowserStandaloneTabBarToolbarIdentifier-v2" '{
#     OrderedToolbarItemIdentifiers = (
#         SidebarSeparatorToolbarItemIdentifier,
#         InputFieldsToolbarIdentifier
#     );
# }'
# defaults write com.apple.Safari "NSToolbar Configuration BrowserStandaloneTabBarToolbarIdentifier-v2" -dict-add "TB Item Identifiers" '(
#     SidebarSeparatorToolbarItemIdentifier,
#     InputFieldsToolbarIdentifier
# )'
