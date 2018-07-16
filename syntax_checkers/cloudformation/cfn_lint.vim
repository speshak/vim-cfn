"============================================================================
"File:        cfn_lint.vim
"Description: CloudFormation linting for syntastic
"Maintainer:  Scott Peshak
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_cloudformation_cfn_lint_checker')
    finish
endif
let g:loaded_syntastic_cloudformation_cfn_lint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_cloudformation_cfn_lint_GetLocList() dict
    let makeprg = self.makeprgBuild({
        \ "exe": 'cfn-lint',
        \ "args": "--template" })

    " 2018-07-13 15:08:51,941 - cfnlint - ERROR - Template alb.template contains duplicates: "HasDefaultTargetGroupTCP" (line 282)
    let errorformat = '%*\d{4}-%*\d{2}-%*\d{2} %*\d{2}:%*\d{2}:%*\d{2}\,%\d{3} - cfnlint - %t%*[a-zA-Z] - %m \(line %l\),%EE%n\ %m,%C%f:%l:%c,%WW%n\ %m,%-G%.%#'

    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })

    for e in loclist
        if e['type'] ==? 'W'
            let e['subtype'] = 'Style'
        endif
    endfor

    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'cloudformation',
    \ 'name': 'cfn_lint',
    \ 'exec': 'cfn-lint' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
