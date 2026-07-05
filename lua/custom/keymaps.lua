
-- copy file path
vim.keymap.set("n", "<leader>cp", ":let @+=expand('%:p')<CR>", { desc = "copy file path of current buffer" })
-- print file path
vim.keymap.set("n", "<leader>pa", "<cmd>echo expand('%:p') <CR>", { desc = "print path of current buffer" })

-- jump
vim.keymap.set('n', '<leader>[', '<C-o>', { desc = 'go back' })
vim.keymap.set('n', '<leader>]', '<C-i>', { desc = 'go forward' })
vim.keymap.set('n', '<leader>k', '<C-]>', { desc = 'jump' })
vim.keymap.set('n', '<D-]>', '<C-i>', { desc = 'go forward' })
vim.keymap.set('n', '<D-[>', '<C-o>', { desc = 'go back' })
vim.keymap.set('n', '<leader>pp', '<Plug>(MatchitNormalForward)', { desc = 'match forward' })

-- save file
vim.keymap.set('n', '<D-s>', ':w<CR>', { desc = 'save file' })
vim.keymap.set('i', '<D-s>', ':w<CR>', { desc = 'save file' })

-- fold/unfold
vim.keymap.set('n', '+', '<cmd> foldopen <CR>', { desc = 'unfold block' })
vim.keymap.set('n', '_', '<cmd> foldclose <CR>', { desc = 'fold block' })

-- show diagnostic
vim.keymap.set(
  { 'n' },
  '<leader>hh',
  ':lua vim.diagnostic.open_float()<cr>',
  { desc = 'show full diagnostic hints of current line', noremap = true, silent = true }
)

-- copy current line to next line
vim.keymap.set({ 'n' }, '<D-d>', ':copy .<CR>', { desc = 'copy from current row to next row', noremap = true, silent = true })
vim.keymap.set({ 'i' }, '<D-d>', '<Esc>:copy .<CR>a', { desc = 'copy from current row to next row', noremap = true, silent = true })

-- comment line
vim.keymap.set(
  'n',
  '<D-/>',
  function() return require('vim._comment').operator() .. '_' end,
  { desc = 'Comment Toggle (Current Line)', expr = true, silent = true }
)

-- comment selected lines
vim.keymap.set(
  { 'x' },
  '<D-/>',
  function() return require('vim._comment').operator() end,
  { desc = 'Comment Toggle (Selected Lines)', expr = true, silent = true }
)

-- window resize
vim.keymap.set('n', '<D-S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<D-S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<D-S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })
vim.keymap.set('n', '<D-S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
-- window split
vim.keymap.set('n', '<leader>|', '<C-w>v', { desc = 'Split window right' })
vim.keymap.set('n', '<leader>-', '<C-w>s', { desc = 'Split window below' })
-- buffer
vim.keymap.set('n', '<leader>bd', ':bdelete<cr>', { desc = 'Buffer delete' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'Buffer next' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'Buffer previous' })


