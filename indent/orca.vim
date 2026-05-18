if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=OrcaIndent(v:lnum)
setlocal indentkeys=!^F,o,O,0=end
setlocal nosmartindent
setlocal shiftwidth=4
setlocal expandtab

if exists("*OrcaIndent")
  finish
endif

function! OrcaIndent(lnum)
  let prev = prevnonblank(a:lnum - 1)
  if prev == 0
    return 0
  endif

  let curline  = getline(a:lnum)
  let prevline = getline(prev)

  " 'end' on current line → column 0
  if curline =~? '^\s*end\>'
    return 0
  endif

  " After a %block line → indent one level (4 spaces)
  if prevline =~? '^\s*%\w'
    return shiftwidth()
  endif

  " Keep previous indent
  return indent(prev)
endfunction
