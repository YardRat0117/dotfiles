--[[
  plugins/theme.lua – 主题
  使用你原版 kaicataldo/material.vim，等同于原来 ~/.vimrc.d/theme.vim
]]

return {
  "kaicataldo/material.vim",
  name = "material",
  priority = 1000,
  lazy = false,
  config = function()
    vim.cmd.colorscheme("material")
    -- 透明背景（lazy.nvim 禁用 autocmd 期间直接设）
    vim.api.nvim_set_hl(0, "Normal", { bg = nil })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = nil })
  end,
}
