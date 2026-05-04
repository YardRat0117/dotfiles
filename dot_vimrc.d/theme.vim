vim9script

colorscheme material
# enable true color
if $COLORTERM =~ 'truecolor'
   set termguicolors
endif
if &termguicolors
    hi Normal guibg=NONE
    hi NormalNC guibg=NONE
else
    hi Normal ctermbg=NONE
    hi Normal ctermbg=NONE
endif
