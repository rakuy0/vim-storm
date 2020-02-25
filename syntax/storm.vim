" Storm syntax file for vim
" Maintainer: James Gross
if exists("b:current_syntax")
  finish
endif
let b:current_syntax="storm"

" syn match stormFunction '[a-zA-Z_][a-zA-Z0-9_]*' display contained
" syn match stormFunction '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*' display contained

syn keyword stormBool True False
syn keyword stormLoops for while 
syn keyword stormKeywords break continue return yield spin uniq count in limit delnode iden max min sleep tee
syn keyword stormKeywords init fini service
syn keyword stormKeywords not or and
syn keyword stormConditional switch if elif else

"syn keyword stormFuncStmt function nextgroup=stormFunction skipwhite


" Various operators
syn match stormOperator     '\V=\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|'
syn match stormOperator     '\V=\|?=\|->\|<-\|-+>\|<+-\|'
syn match stormOperator     '*in\||\|>=\|<=\|\~=\|>\|<\|@=\|+\|-'

" Comments
syn match singleComment /\/\/[^\n]*/
syn region multiComment start='\/\*' end='\*\/'

" Strings
syn region stormString start=+'+ skip=+\\\\\|\\'\|\\$+ end=+'+ end=+$+ excludenl keepend
syn region stormString start=+"+ skip=+\\\\\|\\"\|\\$+ end=+"+ end=+$+ excludenl keepend
"syn region stormExprStmt start="\\$\\(" end="\\)"

syn region stormEditParens start='\[' end='\]'

" Fun times. These don't work if they're earlier in the files
syn match stormTags   "\v#\w+(\.\w+)*"
syn match stormNumber "\v<[0-9]+>" display
syn match stormNumber  "\v<[0-9]*[.]?[0-9]+>" display
syn match stormNumber  "\v<0[xX][0-9a-fA-F]+>" display

"hi def link stormFunction Function
"hi def link stormFuncStmt Statement
hi def link stormNumber Constant
hi def link stormKeywords Statement
hi def link stormLoops Repeat
hi def link stormBool Boolean
hi def link stormConditional Conditional
hi def link stormString String
hi def link stormTags Statement
" hi def link stormVariable Identifier
" hi def link stormCmpr Operator
hi def link stormOperator Operator
"hi def link stormAbsForm Identifier
"hi def link stormRelProp Identifier

hi def link multiComment Comment
hi def link singleComment Comment

" So this isn't a constant, but in my colorscheme it's red and edits are dangerous SO RED
hi def link stormEditParens Constant

