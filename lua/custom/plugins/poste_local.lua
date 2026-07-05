
local utils = require('custom.utils')

vim.pack.add {
  utils.gh('beyondlex/finder'),
  utils.gh('stevearc/dressing.nvim'),
  utils.gh('saghen/blink.cmp'),
  utils.gh('folke/snacks.nvim'),
}

-- 本地插件：直接添加到 runtimepath
vim.opt.runtimepath:append(vim.fs.normalize(os.getenv("HOME") .. "/code/github/poste"))

require("poste").setup()
