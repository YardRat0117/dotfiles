--[[
  plugins/misc.lua – 各种小工具集合
  对应原插件：vim-trailing-whitespace, vim-cursorword, vim-sensible, vim-bbye
]]

return {
  -- 高亮光标下的单词（替代 vim-cursorword）
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 200,
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "alpha",
          "NvimTree",
          "lazy",
          "neo-tree",
          "TelescopePrompt",
        },
      })
    end,
  },

  -- 更强大的 init.lua 支持 & 文件管理
  {
    "folke/snacks.nvim",
    lazy = true,
  },

  -- 保持文件末尾/行尾空格干净（替代 vim-trailing-whitespace）
  -- 内置 autocmd 已处理；plus 插件可选：
  {
    "echasnovski/mini.trailspace",
    event = "BufWritePre",
    config = function()
      -- 保存时自动清除末尾空格
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          require("mini.trailspace").trim()
        end,
      })
    end,
  },

  -- bufdelete（替代 vim-bbye）
  -- 原 mx 已映射到 :bdelete，不需要额外插件
}
