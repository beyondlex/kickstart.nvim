vim.pack.add { 'https://github.com/nvim-mini/mini.pairs' }
vim.pack.add { 'https://github.com/nvim-mini/mini.surround' }

require('mini.pairs').setup()
require('mini.surround').setup {
  custom_surroundings = {
    -- Use function to compute surrounding info
    ['*'] = {
      input = function()
        local n_star = MiniSurround.user_input 'Number of * to find'
        local many_star = string.rep('%*', tonumber(n_star) or 1)
        return { many_star .. '().-()' .. many_star }
      end,
      output = function()
        local n_star = MiniSurround.user_input 'Number of * to output'
        local many_star = string.rep('*', tonumber(n_star) or 1)
        return { left = many_star, right = many_star }
      end,
    },
  },
}

-- sa: add surround: abc -- saiw' -> 'abc'
-- sr: replace surround: `abc` -- sr`' -> 'abc'

vim.keymap.set('v', '<leader>``', 'sa`', { remap = true })
vim.keymap.set('n', '<leader>``', 'saiw`', { remap = true })

vim.keymap.set({'n'}, '<leader>`l', 'saiw*2<cr>', { remap = true })
vim.keymap.set({'v'}, '<leader>`l', 'sa*2<cr>', { remap = true })
vim.keymap.set({'n'}, '<leader>`ll', 'sd*2<cr>', { remap = true })

