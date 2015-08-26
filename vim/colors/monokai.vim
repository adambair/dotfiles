" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" Modifications By: Adam Bair <adambair@gmail.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="monokai"

hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#1fde0c
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#f42873
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffAdded       guifg=#1dff0e
hi DiffRemoved     guifg=#ec0d11
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#AE81FF
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Function        guifg=#A6E22E
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#FFFFFF guibg=#455354
" marks column

hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#465457               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
hi SpecialKey      guifg=#888A85               gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

hi TabLineFill                   guibg=#262825

hi Statement       guifg=#F92672               gui=bold
hi StatusLine      guifg=#262825 guibg=#455354
hi StatusLineNC    guifg=#262825 guibg=#455354
hi StorageClass    guifg=#FD971F               gui=italic
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

hi Normal          guifg=#F8F8F2 guibg=#000000
hi Comment         guifg=#b2ad90
hi CursorLine                    guibg=#262825
hi ColorColumn                   guibg=#262825
hi CursorColumn                  guibg=#000000
hi LineNr          guifg=#BCBCBC guibg=#232526
hi NonText         guifg=#BCBCBC guibg=#000000

hi rubyDefine                   gui=none        guifg=#f42873
hi rubyInclude                  guifg=#f42873
hi rubyInstanceVariable        guifg=#d300fe
hi rubyStringDelimiter          gui=bold        guifg=#1fde0c
hi rubySymbol                   gui=bold        guifg=#8988e1
hi rubyInterpolationDelimiter guifg=#FFFFFF
hi rubyBlockParameter guifg=#d300fe
hi erubyExpression guibg=#000000
hi erubyDelimiter guibg=#000000

" coffeeStatement
" coffeeRepeat
" coffeeConditional
" coffeeException
" coffeeKeyword
" hi coffeeOperator guifg=#FFFFFF
hi coffeeExtendedOp guifg=#FFFFFF
hi coffeeSpecialOp guifg=#FFFFFF
" coffeeBoolean
" coffeeGlobal
hi coffeeSpecialIdent guifg=#d300fe
" coffeeObject
" coffeeConstant
" coffeeString
" coffeeNumber
" coffeeFloat
" coffeeReservedError
" coffeeObjAssign
" coffeeComment
" coffeeBlockComment
" coffeeEmbed
" coffeeRegex
" coffeeHeregex
" coffeeHeredoc
" coffeeSpaceError
" coffeeSemicolonError
hi coffeeDotAccess guifg=#FFFFFF
" coffeeProtoAccess
hi coffeeCurlie guifg=#FFFFFF
hi coffeeBracket guifg=#FFFFFF
hi coffeeParen guifg=#FFFFFF
hi coffeeSpecialVar guifg=#ff9925
hi coffeeObjAssign guifg=#bcd92a
hi coffeeAssignmentBinding guifg=#F92672
hi coffeeInterpDelim guifg=#FFFFFF
hi coffeeConsoleLog guisp=#FFFFFF gui=undercurl
