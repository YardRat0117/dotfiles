--[[
  plugins/whichkey.lua – 快捷键提示弹窗（新增）
]]

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>f", group = "[F]ind / Telescope" },
      { "<leader>l", group = "[L]SP" },
      { "m",         group = "[M] Buffer / Window" },
      { "mw",        group = "[M] [W]indow" },
      { "n",         group = "[N] Line / Search" },
      { "f",         group = "[F] Macro" },
      { "g",         group = "[G] LSP / Symbol" },
    },
  },
}
