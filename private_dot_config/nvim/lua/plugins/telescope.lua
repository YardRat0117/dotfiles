--[[
  plugins/telescope.lua – 模糊搜索（新增）:Files/:Grepper/:Buffers 等
]]

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git", "target", "build" },
          layout_strategy = "horizontal",
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          prompt_prefix = "   ",
          selection_caret = " ",
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
