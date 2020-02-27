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

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif

  if a:width > 80
    let l:s .= ' %f%h%w%m%r '
  endif

  let l:s .= '%='

  let l:s .= crystalline#left_mode_sep('') . '%{StatusDiagnostic()}' . crystalline#right_mode_sep('')
  let l:s .= crystalline#left_mode_sep('') . '%l/%L' . crystalline#right_mode_sep('')
  if a:width > 80
    let l:s .= crystalline#left_mode_sep('') . '%{&fenc!=#""?&fenc:&enc}|%{&ff}' . crystalline#right_mode_sep('')
  endif
  let l:s .= ' %P '

  return l:s
endfunction

function! TabLine()
  return crystalline#bufferline(0, 0, 1)
endfunction
