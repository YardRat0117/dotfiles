--[[
  core/keymaps.lua – 快捷键映射
  对应原 ~/.vimrc.d/hotkey.vim，保留所有原有习惯
]]

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader 键（保持空格键为默认 leader）
vim.g.mapleader = " "

-- ── n- 开头：行号和搜索相关 ──
map("n", "nd", ":set number relativenumber<CR>", opts)
map("n", "nf", ":set nonumber norelativenumber<CR>", opts)
map("n", "nh", ":set hlsearch<CR>", opts)
map("n", "nn", ":set nohlsearch<CR>", opts)
map("n", "nk", "N", opts)
map("n", "nl", "n", opts)

-- ── m- 开头：缓冲区相关 ──
map("n", "mx", ":bdelete<CR>", opts)
map("n", "ml", ":bnext<CR>", opts)
map("n", "mk", ":bprevious<CR>", opts)

-- ── mw- 开头：窗口操作 ──
map("n", "mv", ":vsplit<CR>", opts)
map("n", "ms", ":split<CR>", opts)
map("n", "mwh", "<C-w>h", opts)
map("n", "mwj", "<C-w>j", opts)
map("n", "mwk", "<C-w>k", opts)
map("n", "mwl", "<C-w>l", opts)

-- ── f- 开头：宏相关 ──
map("n", "fr", "qz", opts)
map("n", "fs", "q", opts)
map("n", "ft", "@z", opts)
map("n", "fh", "@@", opts)

-- ── g- 开头：LSP 相关（稍后也会在 lsp.lua 中定义，避免冲突） ──
map("n", "gq", ":cclose<CR>", opts)
-- gf / gh / gr / gd / gn 由 lsp.lua 或 individual plugins 定义，避免重复

-- ── 新增：Telescope 快捷键 ──
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- ── 新增：窗口导航更顺手 ──
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
