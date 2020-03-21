let g:python_host_prog = $HOME . '/.nix-profile/bin/nvim-python'
let g:python3_host_prog = $HOME . '/.nix-profile/bin/nvim-python3'

call plug#begin($HOME . '/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

Plug 'kshenoy/vim-signature'               " Show marks in the gutter

Plug 'simnalamburt/vim-mundo'              " Undo tree
nnoremap <F6> :MundoToggle<CR>

Plug 'rhysd/git-messenger.vim'
let g:git_messenger_no_default_mappings=v:true
nmap <Leader>m <Plug>(git-messenger)

" Plug 'wellle/context.vim'
" let g:context_enabled = 0

Plug 'luochen1990/rainbow'                 " Highlight nested braces differently
let g:rainbow_active=1

Plug 'lifepillar/vim-gruvbox8'
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1

Plug 'Yggdroot/indentLine'                 " Highlight indents
let g:indentLine_char='¦'
let g:indentLine_enabled=1
let g:vim_json_syntax_conceal = 0
let g:indentLine_concealcursor = &concealcursor

" Filetype Support
Plug 'sheerun/vim-polyglot'
Plug 'direnv/direnv.vim'
Plug 'posva/vim-vue'

Plug 'chrisbra/csv.vim', { 'for': 'csv' }  " Show csvs prettily
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024
let g:csv_no_column_highlight = 1

" Actions
Plug 'axelf4/vim-strip-trailing-whitespace'
nmap <Leader>s :StripTrailingWhitespace<cr>

" Plug 'wellle/targets.vim'                  " Add additional text objects

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 0
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

Plug 'Raimondi/delimitMate'

Plug 'haya14busa/incsearch.vim'
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
let g:clap_provider_grep_opts='-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
nnoremap <C-p> :Clap! files<CR>
map <Leader>o :Clap! files<CR>
map ; :Clap! buffers<CR>
map <Leader>gc :Clap! bcommits<CR>
map <Leader>gf :Clap! grep<CR>

autocmd FileType clap_input call s:clap_mappings()
function! s:clap_mappings()
	nnoremap <silent> <buffer> q     :<c-u>call clap#handler#exit()<CR>
	nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>
endfunction

function! s:ensure_closed() abort
  call clap#floating_win#close()
  silent! autocmd! ClapEnsureAllClosed
endfunction

function! MyClapOnEnter() abort
  augroup ClapEnsureAllClosed
    autocmd!
    autocmd BufEnter,WinEnter,WinLeave * call s:ensure_closed()
  augroup END
endfunction

autocmd User ClapOnEnter call MyClapOnEnter()

Plug 'justinmk/vim-sneak'
let g:sneak#streak=1

Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'pbrisbin/vim-restore-cursor'         " Restore cursor to its original position

Plug 'roxma/vim-paste-easy'                " Set and unset paste
let g:paste_char_threshold = 8

Plug 'tmux-plugins/vim-tmux-focus-events'  " tmux helper
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'                    " Automatically set tabwidth based on file
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'machakann/vim-sandwich'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-json',
\ 'coc-python',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-tsserver',
\ 'coc-vetur',
\ 'coc-rust-analyzer',
\ 'coc-yank',
\ 'coc-docker',
\ 'coc-sh',
\ 'coc-git',
\ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
    \ "\<C-h>"

let g:coc_snippet_next = '<tab>'

nmap <silent> <Leader>p <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>n <Plug>(coc-diagnostic-next)

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

nmap <Leader>if :call CocAction('format')<cr>
nmap <Leader>ii :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
nmap <leader>ic  <Plug>(coc-codeaction)
" autocmd BufWritePre *.py :call CocAction('format')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

nnoremap <expr><M-j> coc#util#has_float() ? coc#util#float_scroll(1) : "\<M-j>"
nnoremap <expr><M-k> coc#util#has_float() ? coc#util#float_scroll(0) : "\<M-k>"

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"
" Tab and shift-tab through the completion list
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Use <cr> for confirm completion.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

Plug 'voldikss/vim-floaterm'
nmap <silent> <Leader>fp :FloatermNew ptpython<cr>
nmap <silent> <Leader>fn :FloatermNew<cr>
nmap <silent> <Leader>ff :Clap floaterm<cr>
tnoremap <silent> fd <C-\><C-n>:q<cr>

noremap  <silent> <Leader>fj :FloatermToggle<CR>
tnoremap  <silent> fj <C-\><C-n>:FloatermToggle<CR>

augroup MyTermMappings
  autocmd!
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>, <C-\><C-n>:FloatermPrev<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>. <C-\><C-n>:FloatermNext<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>q <C-\><C-n>:FloatermToggle<CR>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fd <C-\><C-n>:q<cr>
  autocmd TermOpen * nnoremap <buffer> <silent> <localleader>fj <C-\><C-n>:FloatermToggle<CR>
augroup END

nmap <Leader>ft yy:FloatermToggle<CR><C-\><C-n>pi<CR>
vmap <Leader>ft y:FloatermToggle<CR><C-\><C-n>pi<CR>

let g:floaterm_winblend = 20
let g:floaterm_position = 'center'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
autocmd User Startified setlocal buflisted

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'gruvbox'
Plug 'rbong/vim-crystalline'

Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

filetype plugin indent on
syntax on

runtime macros/sandwich/keymap/surround.vim
lua require'colorizer'.setup()
