" Quick write session with F2
map <F2> :Obsess<cr>
" Load session with F3
map <F3> :source Session.vim<cr>

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" middle-click paste
noremap! <s-insert> <middlemouse>
" No Ex mode
nnoremap Q <nop>
" Half page up
nnoremap K <C-U>
" Half page down
nnoremap J <C-D>
" Move to beginning of line
nnoremap B ^
" Move to end of line
nnoremap E $
" Sets // to search for the visually selected text
vnoremap // y/<C-R>"<CR>
" Start a search!
map <Leader>a :Ag<space>""<left>
" Start a command
map <Leader>; :
" Open a terminal
map <Leader>tn :term<cr>
" Quick save
map <Leader>w :w!<cr>
" Quickly close files
map <Leader>q :Sayonara<cr>
" Quick previous tab
map <Leader>, :bprev<cr>
" Quick next tab
map <Leader>. :bnext<cr>
" Quick tabonly
map <Leader>to :tabonly<cr>
" Show error list
map <Leader>ee :botright cope<cr>
" Previous error
map <Leader>p :cp<cr>
" Next error
map <Leader>n :cn<cr>
" Close the current buffer
map <Leader>bd :q<cr>
" Close all the buffers
map <Leader>ba :1,1000 bd!<cr>
" Horizontal buffers
map <Leader>sh :sp<cr>
" Vertical buffers
map <Leader>sv :vs<cr>
" Force update the current file
map <Leader>e :e!<cr>
" Write the selected text out to less
vmap <Leader>z :write !less<cr>
" Sudo save
command! W w !sudo tee % > /dev/null

nmap <silent> <M-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-j> <Plug>(ale_next_wrap)
