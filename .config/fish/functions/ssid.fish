function ssid -d "Displays current SSID"
    echo (/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | rg '^\s+SSID: (.*)?$' -r \$1)
end
