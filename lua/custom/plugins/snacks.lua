local utils = require('custom.utils')

vim.pack.add { utils.gh 'folke/snacks.nvim' }

require('snacks').setup {
  image = {
    enabled = true,
    doc = {
      enabled = true,
      inline = true,
      float = true,
      max_width = 80,
      max_height = 40,
    },
  },
}
