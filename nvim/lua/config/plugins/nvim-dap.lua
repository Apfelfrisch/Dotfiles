return {
  'mfussenegger/nvim-dap',
  lazy = true,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-dap.nvim',
  },
  -- Lazyload on Keys
  keys = {
    { '<F3>', function() require('dap').continue() end },
    { '<Leader>b', function() require('dap').toggle_breakpoint() end },
    { '<Leader>B', function() require('dap').set_breakpoint() end },
    { '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
    { '<Leader>dr', function() require('dap').repl.open() end },
    { '<Leader>dh', function() require('dap').eval() end, mode = {'n', 'v'}},
  },
  config = function()
    local dap = require('dap')
    local dapui = require("dapui")

    require('telescope').load_extension('dap')
    require("nvim-dap-virtual-text").setup()

    -- Open dapui on debugging
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.setup()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/Programms/vscode-php-debug/out/phpDebug.js" }
    }

    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9003,
            pathMappings = {
              ["/app"] = "${workspaceFolder}"
            }
        }
    }

    -- vim.keymap.set('n', '<F3>', function() dap.continue() end)
    vim.keymap.set('n', '<F4>', function() dap.close() dapui.close() end)
    vim.keymap.set('n', '<F5>', function() dap.step_over() end)
    vim.keymap.set('n', '<F6>', function() dap.step_into() end)
    vim.keymap.set('n', '<F7>', function() dap.step_out() end)
    -- vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
    -- vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    -- vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function() dapui.eval() end)
  end
}
