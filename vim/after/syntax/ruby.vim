" if !has('conceal')
"   finish
" endif

" syntax match rubyNiceOperator "!=" conceal cchar=≠
" syntax match rubyNiceOperator "=\~" conceal cchar=≅
" syntax match rubyNiceOperator "!\~" conceal cchar=≆
" syntax keyword rubyNiceOperator lambda conceal cchar=λ

" hi link rubyNiceOperator Operator
" hi link rubyNiceStatement Statement
" hi! link Conceal Operator

" set conceallevel=2
" set concealcursor=nc

