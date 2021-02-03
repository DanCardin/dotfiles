autocmd VimEnter * call s:setup()

function! s:setup() abort
  colorscheme doom-one
" colorscheme gruvbox-material

  lua require('self.plugins').setup()
  runtime macros/sandwich/keymap/surround.vim

  autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
  \ :lua require'lsp_extensions'.inlay_hints{
  \   prefix = ' » ',
    \   aligned = true,
    \   highlight = "NonText"
  \ }

  if exists('+colorcolumn')
    " :hi ColorColumn ctermbg=235 guibg=#2c2d27
    :hi ColorColumn ctermbg=235 guibg=#232323
    let &colorcolumn="80,100,120"
  endif
endfunction

lua require 'self.init'

execute 'source ~/.config/nvim/plugins.vim'
execute 'source ~/.config/nvim/mappings.vim'

augroup LargeFile
  let g:large_file = 10485760 " 10MB

  autocmd!
  autocmd BufReadPre *
    \ let f=expand("<afile>") |
    \ if getfsize(f) > g:large_file |
      \ set eventignore+=FileType |
    \ else |
      \ set eventignore-=FileType |
    \ endif
augroup END

hi link GitSignsAddNr DiffAdd
hi link GitSignsChangeNr DiffModified
hi link GitSignsDeleteNr DiffDelete
