--[[
  plugins/gitsigns.lua – Git 标记
  对应原 ~/.vimrc.d 中 vim-gitgutter
]]

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      current_line_blame = false,
      preview_config = {
        border = "rounded",
      },
    })
  end,
}
