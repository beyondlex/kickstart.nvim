-- =================================================================
-- crates.nvim: Rust crate version management in Cargo.toml
-- =================================================================
do
  vim.pack.add { 'https://github.com/saecki/crates.nvim' }
  require('crates').setup {
    lsp = {
      enabled = true, -- Enable integration with rust_analyzer
      completion = true,
    },
  }

  -- Keymaps for crates.nvim
  local crates_ok, crates = pcall(require, 'crates')
  if crates_ok then
    vim.keymap.set('n', '<leader>ct', crates.show_popup, { desc = '[C]rates: show crate popup' })
    vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, { desc = '[C]rates: show versions popup' })
    vim.keymap.set('n', '<leader>cf', crates.show_features_popup, { desc = '[C]rates: show features popup' })
    vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, { desc = '[C]rates: show dependencies popup' })
    vim.keymap.set('n', '<leader>cu', crates.update_crate, { desc = '[C]rates: update crate' })
    vim.keymap.set('v', '<leader>cu', crates.update_crates, { desc = '[C]rates: update selected crates' })
    vim.keymap.set('n', '<leader>ca', crates.update_all_crates, { desc = '[C]rates: update all crates' })
    vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, { desc = '[C]rates: upgrade crate' })
    vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, { desc = '[C]rates: upgrade selected crates' })
    vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, { desc = '[C]rates: upgrade all crates' })
    vim.keymap.set('n', '<leader>cH', crates.open_homepage, { desc = '[C]rates: open homepage' })
    vim.keymap.set('n', '<leader>cR', crates.open_repository, { desc = '[C]rates: open repository' })
    vim.keymap.set('n', '<leader>cD', crates.open_documentation, { desc = '[C]rates: open documentation' })
    vim.keymap.set('n', '<leader>cC', crates.open_crates_io, { desc = '[C]rates: open crates.io' })
  end
end

