-- Utility functions for kickstart custom plugins

local M = {}

-- GitHub 仓库 URL 快捷生成
---@param repo string
---@return string
M.gh = function(repo)
  return 'https://github.com/' .. repo
end

return M
