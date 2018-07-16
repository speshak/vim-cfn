" Vim syntastic plugin helper
" Language: CloudFormation

if exists("g:loaded_syntastic_cloudformaiton_filetype")
  finish
endif
let g:loaded_syntastic_cloudformaiton_filetype = 1
let s:save_cpo = &cpo
set cpo&vim


if exists('g:syntastic_extra_filetypes')
    call add(g:syntastic_extra_filetypes, 'cloudformation')
else
    let g:syntastic_extra_filetypes = ['cloudformation']
endif

let &cpo = s:save_cpo
unlet s:save_cpo
