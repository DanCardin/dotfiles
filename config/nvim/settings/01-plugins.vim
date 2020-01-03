let g:python_host_prog = $HOME . '/.nix-profile/bin/nvim-python'
let g:python3_host_prog = $HOME . '/.nix-profile/bin/nvim-python3'

let g:loaded_netrwPlugin = 1
call plug#begin($HOME . '/.local/share/nvim/site/plugged')
Plug 'junegunn/vim-plug'

if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif

" Plug 'posva/vim-vue'

" Visual Additions
Plug 'mhinz/vim-signify'                   " Show git modifications in the gutter
Plug 'hkupty/iron.nvim'                    " Support REPLs
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
Plug 'elzr/vim-json', { 'for': 'json' }    " Highlight keys/values differently
Plug 'luochen1990/rainbow'                 " Highlight nested braces differently
Plug 'machakann/vim-highlightedyank'       " Highlight yanked text
Plug 'morhetz/gruvbox'                     " Theme
Plug 'Yggdroot/indentLine'                 " Highlight indents

" Filetype Support
Plug 'sheerun/vim-polyglot'
Plug 'direnv/direnv.vim'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }  " Show csvs prettily

" Actions
Plug 'wellle/targets.vim'                  " Add additional text objects
Plug 'christoomey/vim-tmux-navigator'
Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'
Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }
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
" Plug 'Konfekt/FastFold'
" Plug 'tmhedberg/SimpylFold'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'voldikss/vim-floaterm'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

luafile $HOME/.config/nvim/settings/plugins.lua

filetype plugin indent on
syntax on

" voldikss/vim-floaterm
noremap  <silent> <F12>           :FloatermToggle<CR>
noremap! <silent> <F12>           <Esc>:FloatermToggle<CR>
tnoremap <silent> <F12>           <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_winblend = 20
let g:floaterm_position = 'center'
autocmd User Startified setlocal buflisted

" vim-clap
nnoremap <C-p> :Clap! files ++externalfilter=maple<CR>
map <Leader>o :Clap! gfiles ++externalfilter=maple<CR>
map ; :Clap! buffers ++externalfilter=maple<CR>
map <Leader>gc :Clap! bcommits ++externalfilter=maple<CR>
map <Leader>gf :Clap! grep ++externalfilter=maple<CR>

" justinmk/vim-sneak
let g:sneak#streak=1

" simnalamburt/vim-mundo
nnoremap <F6> :MundoToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_section_y = ''

" luochen1990/rainbow
let g:rainbow_active=1

" Yggdroot/indentLine
let g:indentLine_char='¦'
let g:indentLine_enabled=1
let g:vim_json_syntax_conceal = 0
let g:indentLine_concealcursor = &concealcursor

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

" christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 0
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

let g:coc_global_extensions = [
\ 'coc-ultisnips',
\ 'coc-json',
\ 'coc-python',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-tsserver',
\ 'coc-vetur',
\ 'coc-rust-analyzer',
\ 'coc-yank',
\ ]

" call coc#config('python', {
" \   'pythonPath': split(execute('!which python'), '\n')[-1]
" \ })

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> <Leader>p <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>n <Plug>(coc-diagnostic-next)

func! Format()
  call CocAction('format')
  call CocAction('runCommand', 'editor.action.organizeImport')
endfunc

command! -nargs=0 Format :call Format()

nmap <silent> <Leader>f :Format<cr>
autocmd BufWritePre *.py :Format

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

nnoremap <expr><M-j> coc#util#has_float() ? coc#util#float_scroll(1) : "\<M-j>"
nnoremap <expr><M-k> coc#util#has_float() ? coc#util#float_scroll(0) : "\<M-k>"

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
lua require'colorizer'.setup({'*';}, { css = true, mode = 'background' })

" Remove trailing whitespace and lines, respectively
autocmd BufWritePre * :%s/\s+$//e
autocmd BufWritePre * %s#\($\n\s*\)\+\%$##e
" autocmd BufWritePre *.py :call CocActionAsync('runCommand', 'editor.action.organizeImport')


" glacambre/firenvim
if exists('g:started_by_firenvim')
  set laststatus=0
  set cmdheight=1

  nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>

  au BufEnter github.com_*.txt set filetype=markdown
endif
