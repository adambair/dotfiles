" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" Modifications By: Adam Bair <adambair@gmail.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

" hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="monokai"

hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#1fde0c
hi Conditional     guifg=#F92672               gui=none
hi Constant        guifg=#AE81FF               gui=none
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=none
hi Define          guifg=#f42873
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffAdded       guifg=#1dff0e
hi DiffRemoved     guifg=#ec0d11
hi DiffText                      guibg=#4C4745 gui=italic,none

hi Directory       guifg=#A6E22E               gui=none
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=none
hi Exception       guifg=#A6E22E               gui=none
hi Float           guifg=#AE81FF
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Function        guifg=#A6E22E
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808081
hi IncSearch       guifg=#C4BE90 guibg=#000000

hi Keyword         guifg=#F92672               gui=italic cterm=italic
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#FFFFFF guibg=#555555 gui=none
" hi MatchParen      guifg=#FFCC00 guibg=#000000
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=none
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=none

" hi Search          guifg=#FFFFFF guibg=#455354
" hi Search          guifg=#FFFFFF guibg=#F92672
" hi Search          guifg=#000000 guibg=#FFCC00
" hi Search          guifg=#000000 guibg=#DFBA69
" hi Search          guifg=#DFBA69 guibg=black cterm=underline gui=underline term=underline
hi Search          guifg=#FFCC00 guibg=black cterm=underline gui=underline term=underline

" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526

hi SpecialChar     guifg=#F92672               gui=none
hi SpecialComment  guifg=#465457               gui=none
hi Special         guifg=#66D9EF gui=italic
hi SpecialKey      guifg=#888A85               gui=italic

hi TabLine           guifg=#888888 guibg=#111111 gui=none
hi TabLineSel        guifg=#FFFFFF guibg=#262825 gui=none
hi TabLineFill       guifg=#000000 guibg=#000000 gui=none

hi Statement         guifg=#F92672               gui=none
hi StatusLine        guifg=#262825 guibg=#888888
hi StatusLineNC      guifg=#262825 guibg=#888888
hi StorageClass      guifg=#FD971F               gui=italic
hi Structure         guifg=#66D9EF
hi Tag               guifg=#F92672               gui=italic
hi Title             guifg=#ef5939
hi Todo              guifg=#DDDDDD guibg=#000000 gui=none cterm=none

hi Typedef           guifg=#66D9EF
hi Type              guifg=#66D9EF               gui=none
hi Underlined        guifg=#808080               gui=underline

hi VertSplit         guifg=#262825 guibg=#080808 gui=none
hi VisualNOS                       guibg=#403D3D
hi Visual                          guibg=#403D3D
hi WarningMsg        guifg=#FFFFFF guibg=#333333 gui=none
hi WildMenu          guifg=#66D9EF guibg=#000000

hi Normal            guifg=#F8F8F2
hi NonText           guifg=#BCBCBC 

hi Comment           guifg=#b2ad90               gui=italic cterm=italic
hi CursorLine                      guibg=#262825 gui=none cterm=none
hi ColorColumn                     guibg=#262825
hi CursorColumn                    guibg=#000000
hi LineNr            guifg=#BCBCBC guibg=#232526
hi CursorLineNr      guifg=#FFFFFF guibg=#262825 gui=none

" Ruby Stuffs
hi rubyDefine                   gui=none        guifg=#f42873
hi rubyInclude                  guifg=#f42873   gui=italic cterm=italic
hi rubyInstanceVariable         guifg=#d300fe
hi rubyStringDelimiter          gui=bold        guifg=#1fde0c
hi rubySymbol                   gui=bold        guifg=#8988e1
hi rubySymbolDelimiter          gui=bold        guifg=#8988e1
" hi rubySymbol                   gui=bold        guifg=#9493e4
" hi rubyInterpolationDelimiter   guifg=#FFFFFF
hi rubyInterpolationDelimiter   guifg=#b2ad90

hi rubyBlockParameter           guifg=#d300fe
hi rubyAccess                   guifg=#f42873   gui=italic cterm=italic
hi rubyInclude                                  gui=italic cterm=italic
hi erubyExpression              guibg=#000000
hi erubyDelimiter               guibg=#000000
hi rubyRailsTestSubject         guifg=#FFCC00   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#FF3F21   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#AC4311   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#CC830E   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#A37E58   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#F38A8A   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#875346   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#F7E4C6   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#8F776A   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#DFBA69   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#FF6338   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#AD7544   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#f5d932   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#ffcf00   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#AB9D94   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#c1bc27   gui=italic cterm=italic
" hi rubyRailsTestSubject         guifg=#FFFF4C   gui=italic cterm=italic

" hi rubyPseudoVariable           guifg=#AE81FF   gui=italic cterm=italic
" hi rubyRailsARAssociationMethod guifg=#A6E22E gui=italic, cterm=italic
" hi rubyRailsARCallbackMethod    guifg=#A6E22E gui=italic, cterm=italic
" hi rubyRailsARClassMethod       guifg=#A6E22E gui=italic, cterm=italic

hi SyntasticError         guibg=#ffffff
" hi SyntasticWarning
" hi SyntasticErrorSymbol
hi SyntasticErrorLine     guibg=#ffffff
hi SyntasticWarningLine   guibg=#654321

" CoffeeScript Stuffs
hi coffeeExtendedOp        guifg=#FFFFFF
hi coffeeSpecialOp         guifg=#FFFFFF
hi coffeeSpecialIdent      guifg=#FD971F
hi coffeeDotAccess         guifg=#FFFFFF
hi coffeeCurlie            guifg=#FFFFFF
hi coffeeBracket           guifg=#FFFFFF
hi coffeeParen             guifg=#FFFFFF
hi coffeeSpecialVar        guifg=#ff9925
hi coffeeObjAssign         guifg=#bcd92a
hi coffeeAssignmentBinding guifg=#F92672
hi coffeeInterpDelim       guifg=#FFFFFF
hi coffeeConsoleLog        guisp=#FFFFFF gui=undercurl
hi gitcommitSummary        guifg=#FFFFFF gui=none cterm=none

" Vimwiki
hi VimwikiHeader1 guifg=#f42873 gui=bold
hi VimwikiHeader2 guifg=#A6E22E gui=bold
hi VimwikiHeader3 guifg=#ff9925 gui=bold
hi VimwikiHeader4 guifg=#66D9EF gui=bold
hi VimwikiHeader5 guifg=#7070F0 gui=bold

hi VimwikiListTodo guifg=#ff9925 gui=none

" Golang
" hi goStatement guifg=#f92672 gui=italic cterm=italic
hi goDeclaration guifg=#f42873 gui=italic cterm=italic
" hi goDeclType guifg=#AE81FF gui=italic cterm=italic
hi goDeclType guifg=#8988e1 gui=italic cterm=italic
" hi goType guifg=#C4BE89

hi goTypeConstructor guifg=#FD971F
hi goType guifg=#FD971F
hi goSignedInts guifg=#FD971F
hi goExtraType guifg=#FD971F
" hi goFunctionCall guifg=#ffffff gui=bold cterm=bold


if has("spell")
  hi clear SpellBad
  hi SpellBad gui=undercurl guifg=#FF0000
  " hi SpellBad cterm=none,italic ctermfg=red
  " hi SpellBad    guisp=#FF0000 gui=undercurl
  hi SpellCap    guisp=#7070F0 gui=undercurl
  hi SpellLocal  guisp=#70F0F0 gui=undercurl
  hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

"""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""
"ALE {
hi ALEErrorSign guibg=#232526
hi ALEWarningSign guibg=#232526
"}
