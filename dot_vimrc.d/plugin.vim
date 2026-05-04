vim9script

call plug#begin('~/.vim/plugged')
# Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/battery.vim'

# Icons
Plug 'ryanoasis/vim-devicons'

# Directory
Plug 'justinmk/vim-dirvish'

# Theme
Plug 'kaicataldo/material.vim'

# Editing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

# Git
Plug 'airblade/vim-gitgutter'

# Highlight
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/vim-cursorword'
Plug 'machakann/vim-highlightedyank'

# LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'liuchengxu/vista.vim'

# Search
Plug 'osyo-manga/vim-anzu'

# LLM
Plug 'madox2/vim-ai'

# Buffer
Plug 'moll/vim-bbye'

# Common
Plug 'tpope/vim-sensible'
call plug#end()
