local utils = require('custom.utils')

vim.pack.add {
  utils.gh('kdheepak/lazygit.nvim'),
  utils.gh('nvim-lua/plenary.nvim'), -- 浮动窗口边框装饰依赖
}

-- lazygit.nvim 没有 setup() 函数，使用 vim.g 全局变量配置
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_border_chars = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.g.lazygit_floating_window_use_plenary = 0
vim.g.lazygit_use_neovim_remote = 1

-- 快捷键映射
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'LazyGit' })
vim.keymap.set('n', '<leader>gc', '<cmd>LazyGitCurrentFile<CR>', { desc = 'LazyGit Current File' })
