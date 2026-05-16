--[[
  plugins/oil.lua – 文件浏览器
  对应原 vim-dirvish，oil.nvim 提供类似体验但更强大
]]

return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = { "icon" },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        {"<C-p>", "actions.preview", "Toggle preview"},
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        border = "rounded",
      },
    })
    -- 快捷键像 dirvish 一样方便
    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true, silent = true, desc = "Open parent directory" })
  end,
}
