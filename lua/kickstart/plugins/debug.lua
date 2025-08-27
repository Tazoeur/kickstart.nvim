-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

local continue = function()
  if vim.fn.filereadable '.vscode/launch.json' then
    require('dap.ext.vscode').load_launchjs()
  end
  require('dap').continue()
end

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Adds virtual text support
    'theHamsta/nvim-dap-virtual-text',
    'nvim-treesitter/nvim-treesitter',

    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  keys = function(_, keys)
    local dap = require 'dap'
    local dapui = require 'dapui'
    return {
      -- Basic debugging keymaps, feel free to change to your liking!
      { '<F5>', continue, desc = '[D]ebug: Start/Continue' },
      { '<F1>', dap.step_into, desc = '[D]ebug: Step Into' },
      { '<F2>', dap.step_over, desc = '[D]ebug: Step Over' },
      { '<F3>', dap.step_out, desc = '[D]ebug: Step Out' },
      { '<leader>db', dap.toggle_breakpoint, desc = '[D]ebug: Toggle [B]reakpoint' },
      {
        '<leader>dB',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = '[D]ebug: Set [B]reakpoint with condition',
      },
      { '<leader>du', dapui.toggle, desc = '[D]ebug: Open UI' },
      {
        '<leader>dr',
        function()
          dapui.open { reset = true }
        end,
        desc = '[D]ebug: Open UI',
      },
      unpack(keys),
    }
  end,
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve', -- for go
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup()
    -- {
    --   -- Set icons to characters that are more likely to work in every terminal.
    --   --    Feel free to remove or use ones that you like more! :)
    --   --    Don't feel like these are good choices.
    --   icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    --   controls = {
    --     icons = {
    --       pause = '⏸',
    --       play = '▶',
    --       step_into = '⏎',
    --       step_over = '⏭',
    --       step_out = '⏮',
    --       step_back = 'b',
    --       run_last = '▶▶',
    --       terminate = '⏹',
    --       disconnect = '⏏',
    --     },
    --   },
    -- }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install python specific config
    local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
    require('dap-python').setup(path)

    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }
  end,
}
