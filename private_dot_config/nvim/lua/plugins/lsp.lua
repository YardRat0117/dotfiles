--[[
  plugins/lsp.lua – LSP 配置
  对应原 ~/.vimrc.d/lsp.vim，使用 nvim-lspconfig + mason.nvim
]]

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",           -- C/C++
          "gopls",            -- Go
          "rust_analyzer",    -- Rust
          "vtsls",            -- TypeScript/JavaScript
          "vue_language_server", -- Vue (volar)
          "lua_ls",           -- Lua
          "pyright",          -- Python
          "bashls",           -- Bash
          "yamlls",           -- YAML
          "jsonls",           -- JSON
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        -- 快捷键
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gh", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
        -- gq 已在 core/keymaps.lua 中定义为 :cclose，保持原习惯
        -- gn 已在 aerial.lua 中定义为 AerialToggle
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        -- 对应 vim-lsp 的 LspDocumentFormat
        if client.server_capabilities.documentFormattingProvider then
          vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end
      end

      -- LSP 服务器配置
      local servers = {
        "clangd",
        "gopls",
        "rust_analyzer",
        "vtsls",
        "lua_ls",
        "pyright",
        "bashls",
        "yamlls",
        "jsonls",
      }

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
          on_attach = on_attach,
        }

        -- TypeScript 专用：vtsls
        if server == "vtsls" then
          opts.settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
              },
            },
          }
        end

        -- Lua 专用
        if server == "lua_ls" then
          opts.settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          }
        end

        lspconfig[server].setup(opts)
      end

      -- 诊断符号
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- 诊断符号
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
