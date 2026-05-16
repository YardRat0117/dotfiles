--[[
  plugins/flash.lua – 搜索增强
  对应原 vim-anzu，提供更好的 n/N 高亮和跳转
]]

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = false,
      },
    },
    highlight = {
      backdrop = false,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        label = "FlashLabel",
      },
    },
    label = {
      rainbow = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
  },
}
