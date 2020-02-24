" Storm syntax file for vim
" Maintainer: James Gross


if exists("b:current_syntax")
  finish
endif


let b:current_syntax = "storm"

syn match singleComment /\/\/[^\n]*/
syn match stormAbsForm '\V[a-zA-Z_]\:[a-zA-Z0-9_]*'
" syn match stormRelProp ''
syn match stormNumber '\<\d\=\>'

syn match stormFunction '[a-zA-Z_][a-zA-Z0-9_]*' display contained
" syn match stormFunction '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*' display contained

syn keyword stormBool True False
syn keyword stormLoops for while 
syn keyword stormKeywords break continue return yield spin uniq count in
syn keyword stormKeywords init fini
syn keyword stormKeywords not or and
syn keyword stormConditional switch if elif else
syn keyword stormFuncStmt function nextgroup=stormFunction skipwhite

" syn match stormVariable "\$[a-zA-Z_][a-zA-Z0-9_]*"

syn match stormOperator '\V=\|-\|+\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|'
syn match stormOperator '\V=\|?=\|->\|<-\|-+>\|<+-\|'
syn match stormOperator '|\|>=\|<=\|\~=\|>\|<\|@='

syn region multiComment start='\/\*' end='\*\/'
syn region stormString start=+'+ skip=+\\'+ end=+'+
syn region stormString start=+"+ skip=+\\"+ end=+"+
"syn region stormExprStmt start="\\$\\(" end="\\)"

syn region stormEditParens start='\[' end='\]'

hi def link stormFunction Function
hi def link stormFuncStmt Statement
hi def link stormKeywords Statement
hi def link stormNumber Constant
hi def link stormLoops Repeat
hi def link stormBool Boolean
hi def link stormConditional Conditional
hi def link stormString String
" This highlights a bunch of things
" hi def link stormVariable Identifier
hi def link stormCmpr Operator
hi def link stormOperator Operator
hi def link stormAbsForm Identifier

hi def link multiComment Comment
hi def link singleComment Comment
" So this isn't a constant, but in my colorscheme it's red and edits are dangerous SO RED
hi def link stormEditParens Constant
