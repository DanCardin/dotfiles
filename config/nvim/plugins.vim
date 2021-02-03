let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1

" vim-mundo
nnoremap <F6> :MundoToggle<CR>

" rhysd/git-messenger.vim
let g:git_messenger_no_default_mappings=v:true
nmap <Leader>m <Plug>(git-messenger)

" Yggdroot/indentLine
let g:indentLine_char='¦'
let g:indentLine_enabled=1
let g:vim_json_syntax_conceal = 0
let g:indentLine_concealcursor = &concealcursor

" christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 0
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

nnoremap <Leader>o <cmd>lua require'telescope.builtin'.git_files{}<CR>
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap gf <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap gt <cmd>lua require'telescope.builtin'.treesitter{}<CR>

" justinmk/vim-sneak
let g:sneak#streak=1

" roxma/vim-paste-easy
let g:paste_char_threshold = 8

" liuchengxu/vista.vim
map <C-s> :packadd vista.vim<BAR>Vista!!<CR>

" voldikss/vim-floaterm
nmap <silent> <Leader>fp :FloatermNew ptpython<cr>
nmap <silent> <Leader>fn :FloatermNew<cr>
nmap <silent> <Leader>ff :Clap floaterm<cr>

noremap  <silent> <Leader>fj :FloatermToggle<CR>
tnoremap  <silent> fj <C-\><C-n>:FloatermToggle<CR>

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
autocmd User Startified setlocal buflisted

" hrsh7th/vim-vsnip
let g:vsnip_snippet_dir='~/.config/nvim/vsnip'
imap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
smap <expr> <C-k>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-k>'
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" haorenW1025/diagnostic-nvim
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_virtual_text_prefix = ' '
let g:space_before_virtual_text = 5
let g:diagnostic_insert_delay = 1
let g:diagnostic_show_sign = 1

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ check_back_space#check_back_space() ? "\<TAB>" :
  \ compe#complete()
" completion#trigger_completion()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" Auto close popup menu when finish completion
autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

filetype plugin indent on
syntax on

nnoremap <silent> <leader>ii :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <leader>id :BufferOrderByDirectory<CR>
nnoremap <silent> <leader>il :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent> <leader>, :BufferPrevious<CR>
nnoremap <silent> <leader>. :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent> <M-,> :BufferMovePrevious<CR>
nnoremap <silent> <M-.> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent> <M-1> :BufferGoto 1<CR>
nnoremap <silent> <M-2> :BufferGoto 2<CR>
nnoremap <silent> <M-3> :BufferGoto 3<CR>
nnoremap <silent> <M-4> :BufferGoto 4<CR>
nnoremap <silent> <M-5> :BufferGoto 5<CR>
nnoremap <silent> <M-6> :BufferGoto 6<CR>
nnoremap <silent> <M-7> :BufferGoto 7<CR>
nnoremap <silent> <M-8> :BufferGoto 8<CR>
nnoremap <silent> <M-9> :BufferLast<CR>
" Close buffer
" nnoremap <silent> <leader>q :BufferClose<CR>
nnoremap <silent> <leader>q :BufferWipeout<CR>
