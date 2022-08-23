" Storm syntax file for vim
" Maintainer: James Gross
if exists("b:current_syntax")
  finish
endif

let b:current_syntax="storm"

syn keyword stormBool True False
syn keyword stormLoops for while 
syn keyword stormKeywords break continue return yield in
syn keyword stormKeywords init fini emit stop
syn keyword stormKeywords not or and divert uniq once tee spin delnode background
syn keyword stormConditional switch if elif else try catch

"syn region stormExprStmt start="\\$\\(" end="\\)"
syn match stormVariables    "\v\$(\w|\.)+"

" Various operators
syn match stormOperator "\V="
syn match stormOperator "\V@="
syn match stormOperator "\V*="
syn match stormOperator "\V^="
syn match stormOperator "\V!="
syn match stormOperator "\V?="
syn match stormOperator "\V>="
syn match stormOperator "\V<="
syn match stormOperator "\V~="
syn match stormOperator "\V>"
syn match stormOperator "\V<"
syn match stormOperator "\V->"
syn match stormOperator "\V<-"
syn match stormOperator "\V-+>"
syn match stormOperator "\V<+-"
syn match stormOperator "\V*in="
syn match stormOperator "\V+"
syn match stormOperator "\V-"
syn match stormOperator "\V*"
syn match stormOperator "\V/"
syn match stormOperator "\V&"
syn match stormOperator "\V%"
syn match stormOperator "\V|"

" Strings
syn region stormString start=+'+ skip=+\\\\\|\\'\|\\$+ end=+'+ end=+$+ excludenl keepend
syn region stormString start=+"+ skip=+\\\\\|\\"\|\\$+ end=+"+ end=+$+ excludenl keepend

" Fun times. These don't work if they're earlier in the files
syn region stormTripleSingleQuotes start="\'\'\'" end="\'\'\'"
syn region stormEditParens start="\[" end="\]"
syn region stormSubQueryBraces start="\v(\+|\-)\{" end="\}" keepend
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
hi def link stormVariables Identifier
hi def link multiComment Comment
hi def link singleComment Comment

" So this isn't a constant, but in my colorscheme it's red and edits are SPICY, SO RED
hi def link stormEditParens Structure
hi def link stormTripleSingleQuotes String
hi def link stormSubQueryBraces Special
