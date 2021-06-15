" noremap  <silent> <Leader>fj :FloatermToggle<CR>
" tnoremap  <silent> fj <C-\><C-n>:FloatermToggle<CR>

augroup MyTermMappings
  autocmd!
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>, <C-\><C-n>:FloatermPrev<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>. <C-\><C-n>:FloatermNext<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>q <C-\><C-n>:FloatermToggle<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fd <C-\><C-n>:q<cr>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fj <C-\><C-n>:FloatermToggle<CR>

  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fm <C-\><C-n>:FloatermUpdate height=1.0 width=1.0 pos='center'<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fn <C-\><C-n>:FloatermUpdate height=0.8 width=0.8 pos='center'<CR>
augroup END

nmap <Leader>ft yy:FloatermToggle<CR><C-\><C-n>pi<CR>
vmap <Leader>ft y:FloatermToggle<CR><C-\><C-n>pi<CR>

let g:floaterm_winblend = 20
let g:floaterm_position = 'center'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

" hrsh7th/vim-vsnip
let g:vsnip_snippet_dir='~/.config/nvim/vsnip'
imap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
smap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ check_back_space#check_back_space() ? "\<TAB>" :
  \ compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

nnoremap <silent> <leader>b :BufferLinePick<CR>
" Move to previous/next
nnoremap <silent> <leader>, :BufferLineCyclePrev<CR>
nnoremap <silent> <leader>. :BufferLineCycleNext<CR>
" Re-order to previous/next
nnoremap <Leader><leader>, :BufferLineMovePrev<CR>
nnoremap <Leader><leader>. :BufferLineMoveNext<CR>
" Close buffer
nnoremap <silent> <leader>q :bwipeout<CR>
