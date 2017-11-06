map <Leader>h :vertical resize -2<cr>
map <Leader>j :resize -2<cr>
map <Leader>k :resize +2<cr>
map <Leader>l :vertical resize +2<cr>

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
" Copy to clipboard
nmap Y "+y
vmap Y "+y

" Sets // to search for the visually selected text
vnoremap // y/<C-R>"<CR>

" Start a command
map <Leader>; :
" Quick save
map <Leader>w :w!<cr>
" Quickly close files
map <Leader>q :Sayonara!<cr>
" Open a terminal
map <Leader>tn :term<cr>
" Quick previous tab
map <Leader>, :bprev<cr>
" Quick next tab
map <Leader>. :bnext<cr>
" Quick tabonly
map <Leader>ee :botright cope<cr>
" Previous error
map <Leader>p :cp<cr>
" Next error
map <Leader>n :cn<cr>
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

" Window split settings
highlight TermCursor ctermfg=red guifg=red

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
