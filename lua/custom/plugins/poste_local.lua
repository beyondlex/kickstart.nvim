
local utils = require('custom.utils')

vim.pack.add {
  utils.gh('beyondlex/finder'),
  utils.gh('stevearc/dressing.nvim'),
  utils.gh('saghen/blink.cmp'),
}

vim.pack.add { vim.fs.normalize(os.getenv("HOME") .. "/ai/projects/poste") }

require("poste").setup()
