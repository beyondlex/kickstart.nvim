---@diagnostic disable: undefined-global
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
  picker = { enabled = true },
  input = { enabled = true },
}

vim.keymap.set("n", "<leader>e", function() require('snacks').explorer() end, { desc = "Explorer toggle" })
vim.keymap.set("n", "<leader>1", function() require('snacks').explorer({ reveal = vim.fn.expand('%') }) end, {
 desc = "Explorer reveal file" })
