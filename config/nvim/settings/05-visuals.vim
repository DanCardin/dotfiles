if exists('+colorcolumn')
  :hi ColorColumn ctermbg=235 guibg=#2c2d27
  let &colorcolumn="80,100,120"
endif

colorscheme gruvbox8

hi CursorColumn ctermbg=233
hi CursorLine ctermbg=233

function! InactiveLine()
    return luaeval("require'status-line'.inActiveLine()")
endfunction

function! ActiveLine()
    return luaeval("require'status-line'.activeLine()")
endfunction

" Change statusline automatically
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveLine()
  autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveLine()
augroup END


function! TabLine()
    return luaeval("require'status-line'.TabLine()")
endfunction

set tabline=%!TabLine()

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}
