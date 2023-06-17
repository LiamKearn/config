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
        { '<F5>', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
        { '<F9>', function() require('dap').continue() end, desc = 'Continue' },
        { '<F10>', function() require('dap').step_over() end, desc = 'Step Over' },
        { '<F11>', function() require('dap').step_into() end, desc = 'Step Into' },
        { '<F12>', function() require('dap').step_out() end, desc = 'Step Out' },
        { '<F8>', function() require('dap').set_exception_breakpoints() end, desc = 'Breakpoint filters' },
        { '<Leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Add a conditional Breakpoint' },
        { '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = 'Add a Logpoint' },
        { '<Leader>dr', function() require('dap').repl.open() end, desc = 'Open REPL' },
        { '<Leader>dl', function() require('dap').run_last() end, desc = 'Re-run last configuration' },
        { '<Leader>K', function() require('dap.ui.widgets').hover() end, desc = 'Hover' },
        { '<Leader>dp', function() require('dap.ui.widgets').preview() end, desc = 'Preview' },
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'dap-float',
            callback = function(e)
                vim.api.nvim_buf_set_keymap(
                    e.buf,
                    'n',
                    'q',
                    '<cmd>close!<CR>',
                    { silent = true }
                )
            end,
        })

        dap.adapters.php = {
            type = 'executable',
            command = '/home/liam/.local/share/nvm/v16.16.0/bin/node',
            args = { '/home/liam/Builds/vscode-php-debug/out/phpDebug.js' }
        }

        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'var/www/html - 9000',
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
                    size = 10,
                    elements = {
                        {
                            id = 'breakpoints',
                            size = 0.15
                        },
                        {
                            id = 'stacks',
                            size = 0.15
                        },
                        {
                            id = 'scopes',
                            size = 0.70
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

        -- The PHP dap adaptor doesn't play nice. Use disconnect as
        -- well as terminate & exited.
        dap.listeners.after.disconnect['dapui_config'] = function()
            dapui.close()
        end

        dap.listeners.after.event_terminated['dapui_config'] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end
    end
}
