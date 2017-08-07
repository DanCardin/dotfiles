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
" Copy to clipboard
nmap Y "+y
vmap Y "+y

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
map <Leader>ee :botright cope<cr>
" Previous error
map <Leader>p :cp<cr>
" Next error
map <Leader>n :cn<cr>
" Close the current buffer
map <Leader>bd :q<cr>
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



" Window split settings
highlight TermCursor ctermfg=red guifg=red

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>
map <C-b> :IronRepl<cr>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    " execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
    "             \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor
