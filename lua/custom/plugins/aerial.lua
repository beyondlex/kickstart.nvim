local utils = require('custom.utils')

vim.pack.add { utils.gh 'stevearc/aerial.nvim' }

require('aerial').setup {
  backends = { 'treesitter', 'lsp', 'markdown', 'man' },
  layout = {
    default_direction = 'prefer_right',
    max_width = { 50, 0.25 },
    resize_to_content = true,
  },
  filter_kind = {
    'Class', 'Constructor', 'Enum', 'Function',
    'Interface', 'Module', 'Method', 'Struct',
  },
  nerd_font = 'auto',
  close_on_select = true,
  highlight_on_jump = 300,
  keymaps = {
    ['<CR>'] = 'actions.jump',
    ['<C-v>'] = 'actions.jump_vsplit',
    ['q'] = 'actions.close',
    ['o'] = 'actions.tree_toggle',
  },
}

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>', { desc = 'Aerial (code outline)' })
vim.keymap.set('n', '<leader>A', '<cmd>AerialNavToggle<CR>', { desc = 'Aerial Nav (float)' })
