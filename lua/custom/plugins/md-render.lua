vim.pack.add({
  "https://github.com/delphinus/md-render.nvim",
  -- optional:
  -- "https://github.com/nvim-tree/nvim-web-devicons",
  -- "https://github.com/delphinus/budoux.lua",
})

vim.keymap.set("n", "<leader>mp", "<Plug>(md-render-preview)",     { desc = "Markdown preview (toggle)" })
vim.keymap.set("n", "<leader>mt", "<Plug>(md-render-preview-tab)", { desc = "Markdown preview in tab (toggle)" })
vim.keymap.set("n", "<leader>md", "<Plug>(md-render-demo)",        { desc = "Markdown render demo" })
