
local utils = require('custom.utils')

---@diagnostic disable-next-line: undefined-global
vim.pack.add { utils.gh 'folke/lazydev.nvim' }
require('lazydev').setup({})
