--[[
  plugins/autopairs.lua – 自动括号
  对应原 auto-pairs
]]

return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
    -- 集成 nvim-cmp
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
