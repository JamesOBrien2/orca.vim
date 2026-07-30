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

  " 'End' or Compound's 'EndRun' → dedent one level.
  if curline =~? '^\s*end\%(run\)\?\>'
    return max([0, indent(prev) - shiftwidth()])
  endif

  " Compound branch boundaries and closers align with their opener.
  if curline =~? '^\s*\%(else\>\|endfor\>\|endif\>\|step_end\>\)'
    return max([0, indent(prev) - shiftwidth()])
  endif

  " Compound control-flow and calculation-step openers increase indentation.
  if prevline =~? '^\s*\%(for\>.*\sdo\|if\>.*\sthen\|else\>\|new_step\>\)'
    return indent(prev) + shiftwidth()
  endif

  " A bare %compound starts an inline Compound block. The file form does not.
  if prevline =~? '^\s*%compound\s*$'
    return shiftwidth()
  endif

  " After a normal %block line → indent one level relative to its header.
  " Inline directives and file-form %compound are excluded.
  if prevline =~? '^\s*%\w' && prevline !~? '^\s*%\(compound\|moinp\|maxcore\|moread\)\>'
    return indent(prev) + shiftwidth()
  endif

  " Keep previous indent
  return indent(prev)
endfunction
