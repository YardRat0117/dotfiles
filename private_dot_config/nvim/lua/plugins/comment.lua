--[[
  plugins/comment.lua – 注释切换
  对应原 vim-commentary
]]

return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
}
