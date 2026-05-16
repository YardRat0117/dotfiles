--[[
  core/options.lua – 基础编辑器选项
  对应原 ~/.vimrc.d/basic.vim
]]

local opt = vim.opt

-- 行号
opt.number = true
opt.relativenumber = true

-- 折行
opt.wrap = true
opt.linebreak = true

-- 显示命令
opt.showcmd = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.softtabstop = 0

-- 搜索
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- 编码
opt.encoding = "utf-8"
opt.fileencodings = "utf-8,gbk,latin1"
-- termencoding 在 Neovim 中不可用，默认即为 utf-8

-- 窗口分割
opt.splitbelow = true
opt.splitright = true

-- 语法
vim.cmd("syntax enable")

-- Conceal
opt.conceallevel = 2
opt.concealcursor = ""

-- 光标高亮
opt.cursorcolumn = true
opt.cursorline = true

-- 其他常用
opt.termguicolors = true -- 默认启用 true color
opt.mouse = "a"          -- 允许鼠标
opt.clipboard = "unnamedplus" -- 系统剪贴板
opt.updatetime = 300     -- 更新间隔（ms），gitsigns 等需要

-- 空格/末尾
opt.list = true
opt.listchars = { trail = "·", tab = "→ " }

-- 补全菜单
opt.completeopt = { "menu", "menuone", "noselect" }

-- 备份/交换文件放到 tmp 目录
opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup//"
opt.directory = os.getenv("HOME") .. "/.local/share/nvim/swap//"
opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo//"
opt.undofile = true

-- 关闭可选 provider 警告（不影响功能）

