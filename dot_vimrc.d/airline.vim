vim9script

g:airline_theme = 'material'
g:airline_powerline_fonts = 1
g:airline#extensions#tabline#enabled = 1
g:airline#extensions#tabline#formatter = 'unique_tail'
g:battery#update_interval = 10
g:airline#extensions#whitespace#enabled = 1
g:airline_section_a = airline#section#create(['mode'])
g:airline_section_b = '%{strftime("%m-%d %A %H:%M")}'
g:airline_section_z = '%{airline#extensions#battery#status()}'
