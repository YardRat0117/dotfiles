--[[
  plugins/aerial.lua – 符号大纲
  对应原 ~/.vimrc.d/vista.vim，Vista 替代品
]]

return {
  "stevearc/aerial.nvim",
  branch = "nvim-0.11",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      -- 对应 vista 的 vim_lsp executive
      backends = { "lsp", "treesitter", "markdown" },
      layout = {
        max_width = { 40, 0.2 },
        min_width = 30,
        default_direction = "right",
      },
      show_guides = true,
      icons = {
        -- 保持 vista 风格图标
        Array = "󰅪 ",
        Boolean = "󰨙 ",
        Class = "󰠱 ",
        Constant = "󰏿 ",
        Constructor = " ",
        Enum = "󰕘",
        EnumMember = " ",
        Event = " ",
        Field = "󰜢 ",
        File = "󰈙 ",
        Function = "󰊕 ",
        Interface = " ",
        Key = "󰌋 ",
        Method = "󰆧 ",
        Module = "󰏗 ",
        Namespace = "󰅩 ",
        Null = "󰟢 ",
        Number = "󰎠 ",
        Object = "󰅩 ",
        Operator = "󰆕 ",
        Package = "󰏗 ",
        Property = "󰜢 ",
        String = "󰉿 ",
        Struct = "󰙅 ",
        TypeParameter = "󰅲 ",
        Variable = "󰆧 ",
      },
    })

    -- 对应原 gn 快捷键
    vim.keymap.set("n", "gn", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
  end,
}
