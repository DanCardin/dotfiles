let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

let g:loaded_netrwPlugin = 1
call plug#begin($HOME . '/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif

" Visual Additions
Plug 'mhinz/vim-signify'                   " Show git modifications in the gutter
" Plug 'ap/vim-buftabline'                   " Show buffers on the tabline
Plug 'hkupty/iron.nvim'                    " Support REPLs
" Plug 'itchyny/lightline.vim'               " Fancy statsline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature'               " Show marks in the gutter
Plug 'simnalamburt/vim-mundo'              " Undo tree
Plug 'rhysd/git-messenger.vim'
" git-messenger {{{
let g:git_messenger_no_default_mappings=v:true
nmap <Leader>m <Plug>(git-messenger)
" }}}

" Colors and Highlighting
Plug 'Valloric/MatchTagAlways'             " Always highlight current context's tags
Plug 'elzr/vim-json'                       " Highlight keys/values differently
Plug 'junegunn/fzf.vim'                    " Fuzzy search for files
Plug 'luochen1990/rainbow'                 " Highlight nested braces differently
Plug 'machakann/vim-highlightedyank'       " Highlight yanked text
Plug 'morhetz/gruvbox'                     " Theme
Plug 'unblevable/quick-scope'              " f and F highlight first and other char instances
Plug 'Yggdroot/indentLine'                 " Highlight indents
Plug 'RRethy/vim-hexokinase'                      " Highlight hex/rgb colors
Plug 'mgedmin/coverage-highlight.vim'      " Highlighting based on coverage runs.
Plug 'meain/vim-package-info', { 'do': 'npm install' }  " Highlight deps updated verions.

" Filetype Support
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/csv.vim'                    " Show csvs prettily
Plug 'rust-lang/rust.vim'

" Actions
Plug 'wellle/targets.vim'                  " Add additional text objects
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'                   " Match matchable symbol pairs
Plug 'FooSoft/vim-argwrap'                 " Automatically expand single line arguments
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'pbrisbin/vim-restore-cursor'         " Restore cursor to its original position
Plug 'roxma/vim-paste-easy'                " Set and unset paste
Plug 'roxma/vim-tmux-clipboard'            " different vim instances on tmux share the same clipboard
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tmux-plugins/vim-tmux-focus-events'  " tmux helper
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'                    " Automatically set tabwidth based on file
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'chemzqm/vim-easygit'                 " Git staging
Plug 'jreybert/vimagit'                    " Git actions (git blame and such)
Plug 'tpope/vim-git'                       " Git runtime files

call plug#end()

filetype plugin indent on
syntax on



" FooSoft/vim-argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>
let g:argwrap_tail_comma = 1

" unblevable/quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"junegunn/fzf.vim
nnoremap <C-p> :Files<cr>
map <Leader>o :GitFiles<cr>
map <Leader>b :Buffers<CR>

" justinmk/vim-sneak
let g:sneak#streak=1

" simnalamburt/vim-mundo
nnoremap <F6> :MundoToggle<CR>

" " itchyny/lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'mode_map': { 'c': 'NORMAL' },
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ale', 'cocstatus'] ]
"       \ },
"       \ 'component_function': {
"       \   'modified': 'LightLineModified',
"       \   'ale': 'LinterStatus',
"       \   'cocstatus': 'coc#status',
"       \   'readonly': 'LightLineReadonly',
"       \   'fugitive': 'LightLineFugitive',
"       \   'filename': 'LightLineFilename',
"       \   'fileformat': 'LightLineFileformat',
"       \   'filetype': 'LightLineFiletype',
"       \   'fileencoding': 'LightLineFileencoding',
"       \   'mode': 'LightLineMode',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_section_y = ''
let g:airline#extensions#ale#enabled = 1

" luochen1990/rainbow
let g:rainbow_active=1

" Yggdroot/indentLine
let g:indentLine_char='¦'
let g:indentLine_enabled=1
let g:vim_json_syntax_conceal = 0

" w0rp/ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = [' %d', '⚠ %d', '']
let g:ale_linters = {
\   'python': ['flake8', 'pydocstyle', 'mypy', 'pyls'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['isort', 'black'],
\   'rust': ['rustfmt'],
\}
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_python_mypy_options = '--ignore-missing-imports --python-version 3.6'
nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
nmap <silent> <Leader>n <Plug>(ale_next_wrap)

" chrisbra/csv.vim
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024
let g:csv_no_column_highlight = 1

" chemzqm/vim-easygit
let g:easygit_enable_command = 1

" haya14busa/incsearch.vim
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" haya14busa/incsearch-fuzzy.vim
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" lfv89/vim-interestingwords
map <leader>i :call InterestingWords('n')<cr>
map <leader>I :call UncolorAllWords()<cr>

" christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" hkupty/iron.nvim
let g:iron_map_defaults=0
map <C-b> :IronRepl<cr>
nmap <Leader>tt <Plug>(iron-send-motion)
vmap <Leader>tt <Plug>(iron-send-motion)

" roxma/vim-paste-easy
let g:paste_char_threshold = 8

" Shougo/neosnippet
let g:neosnippet#enable_completed_snippet = 1


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"
" Tab and shift-tab through the completion list
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Use <cr> for confirm completion.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" RRethy/vim-hexokinase
let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_virtualText = '██████'
let g:Hexokinase_refreshEvents = ['TextChanged', 'TextChangedI']
let g:Hexokinase_ftAutoload = ['*']
