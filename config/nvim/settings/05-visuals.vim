" Highlight 80, 100, and 120 and beyond
if exists('+colorcolumn')
:hi ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,100,".join(range(120,500),",")
endif

colorscheme gruvbox

hi CursorColumn ctermbg=233
hi CursorLine ctermbg=233
