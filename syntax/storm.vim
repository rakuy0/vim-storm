" Storm syntax file for vim
" Maintainer: James Gross
if exists("b:current_syntax")
  finish
endif

let b:current_syntax="storm"

syn keyword stormBool True False
syn keyword stormLoops for while 
syn keyword stormKeywords break continue return yield in
syn keyword stormKeywords init fini
syn keyword stormKeywords not or and
syn keyword stormConditional switch if elif else

" So these aren't keywords *per se* and they conflict with things in $lib.time and $lib.service (so they
" get highlighted by this)
syn keyword stormCmds sleep service iden max min tee delnode limit count uniq spin

" Strings
syn region stormString start=+'+ skip=+\\\\\|\\'\|\\$+ end=+'+ end=+$+ excludenl keepend
syn region stormString start=+"+ skip=+\\\\\|\\"\|\\$+ end=+"+ end=+$+ excludenl keepend
"syn region stormExprStmt start="\\$\\(" end="\\)"


" Various operators
syn match stormOperator     "\V=\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|"
syn match stormOperator     "\V=\|?=\|->\|<-\|-+>\|<+-\|"
syn match stormOperator     "*in\||\|>=\|<=\|\~=\|>\|<\|@=\|+\|-"

" Fun times. These don't work if they're earlier in the files
syn region stormEditParens start="\[" end="\]"
syn region singleComment start="\v\/\/" end="\v$"
syn region multiComment start="\v\/\*" end="\v\*\/"
syn match stormTags   "\v#\w+(\.\w+)*"
syn match stormNumber "\v<[0-9]+>" display
"syn match stormNumber  "\v<[0-9]*[.]?[0-9]+>" display
syn match stormNumber  "\v<0[xX][0-9a-fA-F]+>" display
syn match stormFunctionName "\v[a-zA-Z_][a-zA-Z0-9_]*" contained
syn match stormFuncStmt "\v<function>" nextgroup=stormFunctionName skipwhite
syn match stormAbsProp "\v\w+(\:\.?\w+)+"
syn match stormRelProp "\v(\:\.?\w+)+"

hi def link stormFunctionName Function
hi def link stormFuncStmt Statement
hi def link stormNumber Constant
hi def link stormKeywords Statement
hi def link stormLoops Repeat
hi def link stormBool Boolean
hi def link stormConditional Conditional
hi def link stormString String
hi def link stormTags Statement
hi def link stormOperator Operator
hi def link stormAbsProp Type
hi def link stormRelProp Type
hi def link stormCmds Identifier
hi def link multiComment Comment
hi def link singleComment Comment

" So this isn't a constant, but in my colorscheme it's red and edits are SPICY, SO RED
hi def link stormEditParens Constant

