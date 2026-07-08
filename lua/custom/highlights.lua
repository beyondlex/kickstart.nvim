  local group = vim.api.nvim_create_augroup('custom-highlights', { clear = true })

  local function set_md_highlights()
    -- Tree-sitter highlight group for inline code
    vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', {
      fg = '#378600',
      bold = true,
    })
  end

  -- 启动时立即执行（因为 colorscheme 已经加载）
  set_md_highlights()

  -- 之后主题切换时也能生效
  vim.api.nvim_create_autocmd('ColorScheme', {
    group = group,
    pattern = '*',
    callback = set_md_highlights,
  })

  -- 用 FileType 事件确保只在 markdown 文件中设置
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'markdown',
    callback = set_md_highlights,
  })
