vim9script

# n - line number & search related
nnoremap nd :set number relativenumber<CR>
nnoremap nf :set nonumber norelativenumber<CR>
nnoremap nh :set hlsearch<CR>
nnoremap nn :set nohlsearch<CR>
nnoremap nk N
nnoremap nl n

# m - buffer related
nnoremap mx :bdelete<CR>
nnoremap ml :bnext<CR>
nnoremap mk :bprevious<CR>

# mw - window related
nnoremap mv :vsplit<CR>
nnoremap ms :split<CR>
nnoremap mwh <C-w>h
nnoremap mwj <C-w>j
nnoremap mwk <C-w>k
nnoremap mwl <C-w>l

# f - marco related
nnoremap fr qz
nnoremap fs q
nnoremap ft @z
nnoremap fh @@

# g - LSP related
nnoremap gq :cclose<CR>
nnoremap gf :LspDocumentFormat<CR>
nnoremap gh :LspCodeAction<CR>
nnoremap gr :LspReferences<CR>
nnoremap gd :LspDefinition<CR>
nnoremap gn :Vista!!<CR>
