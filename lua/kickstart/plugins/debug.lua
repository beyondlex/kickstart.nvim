-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

vim.pack.add {
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/jay-babu/mason-nvim-dap.nvim',
  'https://github.com/leoluz/nvim-dap-go',
  -- Lua debugger: debug Lua code running inside Neovim
  'https://github.com/jbyuki/one-small-step-for-vimkind',
}


-- Basic debugging keymaps, feel free to change to your liking!
-- over , into, out , start, 
-- F1   , F2  , F3  , F4
-- stop , ui
-- dx   , du
--
vim.keymap.set('n', '<F11>', function() require"osv".launch({port = 8086}) end, { desc = 'Debug: Listen on 8086' })
vim.keymap.set('n', '<F8>', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F6>', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<F9>', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>dx', function() require('dap').close() end, { desc = 'Debug: Stop' })
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, { desc = 'Debug: Set Breakpoint' })
-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<leader>du', function() require('dapui').toggle() end, { desc = 'Debug: See last session result.' })

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
    'delve',
    'codelldb',
  },
}

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
---@diagnostic disable-next-line: missing-fields
dapui.setup {
  -- Set icons to characters that are more likely to work in every terminal.
  --    Feel free to remove or use ones that you like more! :)
  --    Don't feel like these are good choices.
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  ---@diagnostic disable-next-line: missing-fields
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
}

-- Change breakpoint icons
vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
vim.api.nvim_set_hl(0, 'DapStop', { bg = '#c7254e', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'DapStopped', { bg = '#c7254e' })
local breakpoint_icons = vim.g.have_nerd_font
    and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
  or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
for type, icon in pairs(breakpoint_icons) do
  local tp = 'Dap' .. type
  local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
  vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

-- Install golang specific config
require('dap-go').setup {
  delve = {
    -- On Windows delve must be run attached or it crashes.
    -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    detached = vim.fn.has 'win32' == 0,
  },
}

-- ============================================================================
-- Lua Debugger Configuration
-- ============================================================================
-- Uses one-small-step-for-vimkind to debug Lua code running inside Neovim.
-- Great for debugging init.lua, plugins, or any Lua scripts.

-- Register the nlua adapter for nvim-dap
dap.adapters.nlua = function(callback, config)
  callback({
    type = 'server',
    host = config.host or '127.0.0.1',
    port = config.port or 8086,
  })
end

---@diagnostic disable-next-line: missing-fields
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = 'Attach to running Neovim instance',
    host = '127.0.0.1',
    port = 8086,
  },
}

-- No setup() needed for osv.
-- To start debugging: :lua require('osv').launch()
-- Then press <F4> to attach.

-- =========================================================
-- Rust Debugger Configuration (codelldb)
-- =========================================================
-- codelldb is installed via Mason; mason-nvim-dap sets up the adapter.
-- This tells nvim-dap how to launch Rust binaries.
---
---@diagnostic disable: missing-fields
dap.configurations.rust = {
  {
    name = 'Launch (codelldb)',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

-- php
-- ============================================================
-- 2. 旧版PHP (Xdebug 2) 适配器
--    使用 vscode-php-debug (xdebug.php-debug VSIX) 做 DAP ↔ DBGp 翻译。
--    nvim-dap 通过 stdin/stdout 启动 node phpDebug.js,
--    它监听 TCP :9010 等 Xdebug 从容器连过来。
-- ============================================================
local phpDebugPath = vim.fn.expand("~/.local/share/vscode-php-debug/extension/out/phpDebug.js")
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { phpDebugPath },
}
dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9010,
    log = true,
    pathMappings = {
      ["/var/www/html"] = vim.fn.isdirectory(vim.fn.getcwd() .. "/html") == 1
        and vim.fn.resolve(vim.fn.getcwd() .. "/html")
        or vim.fn.getcwd(),
    },
  },
}

