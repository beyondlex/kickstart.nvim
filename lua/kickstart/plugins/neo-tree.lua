-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  close_if_last_window = true,
  clipboard = {
    sync = 'global',
  },
  sources = {
    "filesystem",
  },
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = false,
          use_snacks_image = true,
          use_image_nvim = true
        }
      },
    },
  },
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
