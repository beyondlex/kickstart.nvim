
local utils = require('custom.utils')

vim.pack.add {
  utils.gh('beyondlex/finder'),
  utils.gh('stevearc/dressing.nvim'),
  utils.gh('saghen/blink.cmp'),
  utils.gh('folke/snacks.nvim'),
}

local poste_path = vim.fs.normalize(os.getenv("HOME") .. "/code/github/poste")
local poste_lua = poste_path .. "/lua/?.lua;" .. poste_path .. "/lua/?/init.lua"
if not package.path:find(poste_lua, 1, true) then
  package.path = poste_lua .. ";" .. package.path
end

require("poste").setup({})
