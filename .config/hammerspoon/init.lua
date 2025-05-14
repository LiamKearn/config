-- Cmd + Shift + T switches to Terminal

-- we have to watch for flag changes *and* keyDown/Up since a command key (e.g. Cmd-C) is
-- it's own event
local opts = {
    hs.eventtap.event.types.flagsChanged,
    hs.eventtap.event.types.keyUp,
    hs.eventtap.event.types.keyDown
}

Uniqueglobalnamelol = hs.eventtap.new(opts, function(ev)
    local rawFlags = ev:getRawEventData().CGEventData.flags & 0xdffffeff
    if ev:getType() == hs.eventtap.event.types.flagsChanged then
        if rawFlags == 1048592 then
            hs.application.launchOrFocus("WezTerm")
            return true, {}
        elseif rawFlags == 524352 then
            hs.application.launchOrFocus("Zen Browser")
            return true, {}
        end
    end
end)

Uniqueglobalnamelol:start()
