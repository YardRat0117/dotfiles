--[[
  core/autocmds.lua – 自动命令
  对应原 ~/.vimrc.d/autocmd.vim
]]

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- 恢复光标位置
autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Yank 时高亮（替代 vim-highlightedyank）
autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- 进入终端时自动进入插入模式
autocmd("TermOpen", {
  group = augroup,
  command = "startinsert",
})

-- 离开插入模式时切换输入法（如需要，可启用）
-- autocmd("InsertLeave", {
--   group = augroup,
--   command = "!fcitx5-remote -c",
-- })
