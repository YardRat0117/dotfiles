--[[
  plugins/treesitter.lua – Tree-sitter 语法高亮
]]

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "c", "cpp", "go", "rust",
        "lua", "vim", "vimdoc",
        "python", "bash",
        "html", "css", "javascript", "typescript", "vue",
        "json", "yaml", "toml",
        "markdown", "markdown_inline",
        "gitcommit", "gitignore",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
