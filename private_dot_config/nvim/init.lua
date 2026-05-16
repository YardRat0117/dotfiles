--[[
  init.lua – Neovim 入口
  不动原有 ~/.vimrc，独立全新的 Lua 配置
]]

-- 加载核心模块
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- ── lazy.nvim 引导 ──
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false,
  },
  install = {
    colorscheme = { "material" },
  },
  checker = {
    enabled = false,
  },
  ui = {
    border = "rounded",
  },
})

-- 透明背景（等效你的 vim: hi Normal guibg=NONE）
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = nil })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = nil })
  end,
})
