syn match JiraTicket 'KAFKA-\d*'
syn match GithubIssue '\([a-z]\)\@<!#\d*'
syn match GithubPR 'PR#\d*'

hi link JiraTicket Boolean
hi link GithubIssue Boolean
hi link GithubPR Boolean

" Open in default browser
function! OpenTicket(defaultBrowser='xdg-open')
  let wordUnderCursor = expand("<cWORD>")
  let syntax = SyntaxItem()
  let url = FetchUrl(syntax, wordUnderCursor)

  if len(url) > 0
    exe 'silent! !'.a:defaultBrowser.' "'.url.'" &> /dev/null &'
  endif

  redraw!
endfunction

" Lookup url schem based on syntax
function! FetchUrl(syntax, word)
  if a:syntax == 'JiraTicket'
    return 'https://verica.atlassian.net/browse/'.a:word
  elseif a:syntax == 'GithubIssue'
    let issue = split(a:word, '#')[0]
    return 'https://github.com/verica/verica/issues/'.issue
  elseif a:syntax == 'GithubPR'
    let issue = split(a:word, '#')[1]
    return 'https://github.com/verica/verica/pull/'.issue
  else
    return
  endif
endfunction

" Copy ticket url into clipboard
function! YankTicket()
  let wordUnderCursor = expand("<cWORD>")
  let syntax = SyntaxItem()
  let url = FetchUrl(syntax, wordUnderCursor)

  if len(url) > 0
    exec "normal ciW".url
    exec "normal yiW"
    exec "normal u"
  endif
endfunction

" Insert url after ticket (or end of line)
function! InsertTicket(place='after')
  let cursor = getpos('.')
  let wordUnderCursor = expand("<cWORD>")
  let syntax = SyntaxItem()
  let url = FetchUrl(syntax, wordUnderCursor)

  if len(url) == 0
    return
  endif

  if a:place == 'end'
    exec "normal $a ".url
  else
    exec "normal Wi".url.' '
  endif

  call setpos('.', cursor)
endfunction

nmap <leader>go :call OpenTicket()<CR>
nmap <leader>gy :call YankTicket()<CR>
nmap <leader>gi :call InsertTicket()<CR>
nmap <leader>gI :call InsertTicket('end')<CR>
