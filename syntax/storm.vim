" Storm syntax file for vim
" Maintainer: James Gross
if exists("b:current_syntax")
  finish
endif

let b:current_syntax="storm"

" the default vim syntax keyword doesn't include a period. Include that here.
syntax iskeyword @,48-57,192-255,$,_,.

syn keyword stormBool True False
syn keyword stormLoops for while 
syn keyword stormKeywords break continue return yield in
syn keyword stormKeywords init fini emit stop empty
syn keyword stormKeywords not or and divert uniq once tee spin delnode background batch help diff
syn keyword stormKeywords copyto merge movetags movenodes limit max min reindex count iden
syn keyword stormKeywords graph sleep background parallel tree scrape
syn keyword stormKeywords view.exec lift.byverb edges.del tag.prune runas intersect
syn keyword stormConditional switch if elif else try catch

"syn region stormExprStmt start="\\$\\(" end="\\)"

" Various operators
syn match stormOperator "\V=" containedIn=stormEditParens
syn match stormOperator "\V@=" containedIn=stormEditParens
syn match stormOperator "\V*=" containedIn=stormEditParens
syn match stormOperator "\V^=" containedIn=stormEditParens
syn match stormOperator "\V!=" containedIn=stormEditParens
syn match stormOperator "\V?=" containedIn=stormEditParens
syn match stormOperator "\V>=" containedIn=stormEditParens
syn match stormOperator "\V<=" containedIn=stormEditParens
syn match stormOperator "\V~=" containedIn=stormEditParens
syn match stormOperator "\V>" containedIn=stormEditParens
syn match stormOperator "\V<" containedIn=stormEditParens
syn match stormOperator "\V->" containedIn=stormEditParens
syn match stormOperator "\V<-" containedIn=stormEditParens
syn match stormOperator "\V-+>" containedIn=stormEditParens
syn match stormOperator "\V<+-" containedIn=stormEditParens
syn match stormOperator "\V*in=" containedIn=stormEditParens
syn match stormOperator "\V+" containedIn=stormEditParens
syn match stormOperator "\V-" containedIn=stormEditParens
syn match stormOperator "\V*" containedIn=stormEditParens
syn match stormOperator "\V/" containedIn=stormEditParens
syn match stormOperator "\V&" containedIn=stormEditParens
syn match stormOperator "\V%" containedIn=stormEditParens
syn match stormOperator "\V|" containedIn=stormEditParens
syn match stormOperator "\V*in" containedIn=stormEditParens
syn match stormOperator "\V*near" containedIn=stormEditParens
syn match stormOperator "\V*unset" containedIn=stormEditParens
syn match stormOperator "\V*range" containedIn=stormEditParens

" Strings
syn region stormString start=+'+ skip=+\\\\\|\\'\|\\$+ end=+'+ end=+$+ excludenl keepend
syn region stormString start=+"+ skip=+\\\\\|\\"\|\\$+ end=+"+ end=+$+ excludenl keepend
syn region stormFormatString start=+`+ skip=+\\\\\|\\'\|\\$+ end=+`+ end=+$+ excludenl keepend
syn match stormVariables    "\v\$(\w)+"

" Fun times. These don't work if they're earlier in the files
syn region stormArrayFilter start="\V*[" end="\V]" containedIn=stormEditParens
syn region stormLightEdgeN1 start="\V<(" end="\V)+" end="\V)-" containedIn=stormEditParens
syn region stormLightEdgeN2 start="\V-(" start="\V+(" end="\V)>" containedIn=stormEditParens


syn region stormTripleSingleQuotes start="\'\'\'" end="\'\'\'"
syn region stormEditParens start="\[" end="\]"
syn region stormSubQueryBraces start="\v(\+|\-)\{" end="\}" keepend containedIn=stormEditParens
syn region singleComment start="\v\/\/" end="\v$"
syn region multiComment start="\v\/\*" end="\v\*\/"
syn match stormTags   "\v#\w+(\.\w+)*" containedIn=stormEditParens
syn match stormNumber "\v<[0-9]+>" display
"syn match stormNumber  "\v<[0-9]*[.]?[0-9]+>" display
syn match stormNumber  "\v<0[xX][0-9a-fA-F]+>" display

syn match stormFuncCall '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\$\)\%([^[:cntrl:][:punct:][:space:]]\|_\|\$\)*\ze\%(\s*(\)'
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
hi def link stormFormatString String
hi def link stormTags Tag
hi def link stormOperator Operator
hi def link stormAbsProp Type
hi def link stormRelProp Type
hi def link stormVariables Identifier
hi def link multiComment Comment
hi def link singleComment Comment
hi def link stormFuncCall Function

hi def link stormEditParens Added
hi def link stormTripleSingleQuotes String
hi def link stormSubQueryBraces Special

" Doesn't quite map to anything vim knows about
hi def link stormLightEdgeN1 Macro
hi def link stormLightEdgeN2 Macro
hi def link stormArrayFilter Removed
