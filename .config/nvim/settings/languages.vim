augroup configgroup " {
    au FileType python setlocal commentstring=#\ %s
    au FileType python setlocal nosmartindent

    au FileType python setlocal foldmethod=indent
    au FileType coffee setlocal foldmethod=indent
    au FileType css,scss setlocal foldmethod=marker foldmarker={,}
augroup END " }
