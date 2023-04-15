local wezterm = require 'wezterm'
local primary_box = 'ubuntu'

local function apply(config)
    config.tls_clients = {}

    -- For some reason invoking fish right away crashes? ¯\_(ツ)_/¯
    local live = { 'which', 'fish' }
    local ready, _, _ = wezterm.run_child_process(live)
    if not ready then
        return
    end

    local remote_address_cmd = {
        'fish',
        '-c',
        'ssh_details ' .. primary_box,
    }
    local remote_address_ok, remote_addr_tuple_str, _ = wezterm.run_child_process(remote_address_cmd)
    if remote_address_ok then
        --                                                        'user host port'
        local _, host, port = string.match(remote_addr_tuple_str, '(%a+) (%g+) (%d+)')

        local host_addr = host .. ':' .. port
        table.insert(config.tls_clients, {
            name = primary_box,
            remote_address = host_addr,
            bootstrap_via_ssh = primary_box,
        })
    end
    config.tls_servers = {
        {
            bind_address = primary_box,
        },
    }
end

return apply
