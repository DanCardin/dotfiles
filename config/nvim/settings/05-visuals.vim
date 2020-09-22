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

augroup your_config_scrollbar_nvim
    autocmd!
    autocmd BufEnter    * silent! lua require('scrollbar').show()
    autocmd BufLeave    * silent! lua require('scrollbar').clear()

    autocmd CursorMoved * silent! lua require('scrollbar').show()
    autocmd VimResized  * silent! lua require('scrollbar').show()

    autocmd FocusGained * silent! lua require('scrollbar').show()
    autocmd FocusLost   * silent! lua require('scrollbar').clear()
augroup end
