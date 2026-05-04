vim9script

g:lsp_settings_filetype_typescript = 'vtsls'

g:lsp_log_file = expand('~/.vim/lsp.log')

g:lsp_settings_filetype_vue = ['volar-server', 'vtsls']

if executable('clangd')
    call lsp#register_server({'name': 'clangd', 'cmd': ['clangd'], 'allowlist': ['cpp']})
endif

if executable('gopls')
    call lsp#register_server({'name': 'gopls', 'cmd': ['gopls'], 'allowlist': ['go']})
endif

if executable('rust-analyzer')
    call lsp#register_server({'name': 'rust-analyzer', 'cmd': ['rust-analyzer'], 'allowlist': ['rust']})
endif

