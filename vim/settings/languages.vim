augroup configgroup " {
    au FileType python setlocal commentstring=#\ %s
    au FileType python setlocal foldmethod=indent
    au FileType python setlocal nosmartindent

    au FileType css,scss setlocal tabstop=2 shiftwidth=2
    au FileType css,scss setlocal foldmethod=marker foldmarker={,}

    au FileType html setlocal tabstop=2 shiftwidth=2
augroup END " }
