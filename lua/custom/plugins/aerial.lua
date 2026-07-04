local utils = require('custom.utils')

vim.pack.add { utils.gh 'stevearc/aerial.nvim' }

require('aerial').setup {
  backends = { 'lsp', 'treesitter', 'markdown', 'man' },
  layout = {
    default_direction = 'prefer_right',
    max_width = { 50, 0.25 },
    resize_to_content = true,
  },
  filter_kind = false,
  nerd_font = 'auto',
  close_on_select = true,
  highlight_on_jump = 300,
  nav = {
    keymaps = {
      ["q"] = "actions.close",
    }
  }
}

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>', { desc = 'Aerial (code outline)' })
vim.keymap.set('n', '<leader>A', '<cmd>AerialNavToggle<CR>', { desc = 'Aerial Nav (float)' })
