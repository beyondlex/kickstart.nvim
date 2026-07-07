vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }
require('toggleterm').setup()

vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>t1", ":1ToggleTerm<CR>", { desc = "Toggle Terminal 1" })
vim.keymap.set("n", "<leader>t2", ":2ToggleTerm<CR>", { desc = "Toggle Terminal 2" })
vim.keymap.set("n", "<leader>ts", ":TermSelect<CR>", { desc = "Terminal Select" })
