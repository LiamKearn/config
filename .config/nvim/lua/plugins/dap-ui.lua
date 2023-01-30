return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap'
    },
    cmd = {
        'DapContinue',
        'DapLoadLaunchJSON',
        'DapRestartFrame',
        'DapSetLogLevel',
        'DapShowLog',
        'DapStepInto',
        'DapStepOut',
        'DapStepOver',
        'DapTerminate',
        'DapToggleBreakpoint',
        'DapToggleRepl',
    },
    keys = {
        {
            '<silent> <F5>',
            '<Cmd>lua require("dap").toggle_breakpoint()<CR>'
        },
        {
            '<silent> <F9>',
            '<Cmd>lua require("dap").continue()<CR>'
        },
        {
            '<silent> <F10>',
            '<Cmd>lua require("dap").step_over()<CR>'
        },
        {
            '<silent> <F11>',
            '<Cmd>lua require("dap").step_into()<CR>'
        },
        {
            '<silent> <F12>',
            '<Cmd>lua require("dap").step_out()<CR>'
        },
        {
            '<silent> <Leader>B',
            '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>'
        },
        {
            '<silent> <Leader>lp',
            '<Cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>'
        },
        {
            '<silent> <Leader>dr',
            '<Cmd>lua require("dap").repl.open()<CR>'
        },
        {
            '<silent> <Leader>dl',
            '<Cmd>lua require("dap").run_last()<CR>'
        },
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        dap.adapters.php = {
            type = 'executable',
            command = '/home/liam/.local/share/nvm/v16.16.0/bin/node',
            args = { '/home/liam/Builds/vscode-php-debug/out/phpDebug.js' }
        }

        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9000,
                pathMappings = {
                    ['/var/www/html'] = '${workspaceFolder}'
                }
            }
        }

        dapui.setup({
            controls = {
                element = 'repl',
                enabled = true,
                icons = {
                    pause = '',
                    play = '',
                    run_last = '',
                    step_back = '',
                    step_into = '',
                    step_out = '',
                    step_over = '',
                    terminate = ''
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = 'single',
                mappings = {
                    close = { 'q', '<Esc>' }
                }
            },
            icons = {
                collapsed = '',
                current_frame = '',
                expanded = ''
            },
            layouts = {
                {
                    position = 'left',
                    size = 40,
                    elements = {
                        {
                            id = 'breakpoints',
                            size = 0.25
                        },
                        {
                            id = 'scopes',
                            size = 0.25
                        }
                    }
                },
                {
                    position = 'bottom',
                    size = 10,
                    elements = {
                        {
                            id = 'repl',
                            size = 1
                        },
                    },
                }
            },
            mappings = {
                edit = 'e',
                expand = { '<CR>', '<2-LeftMouse>' },
                open = 'o',
                remove = 'd',
                repl = 'r',
                toggle = 't'
            },
            render = {
                indent = 1,
                max_value_lines = 100
            }
        })

        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end
    end
}
