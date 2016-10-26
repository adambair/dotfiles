"
" Personal preference .vimrc file
" Maintained by Adam Bair <adambair@gmail.com>
"
" Currently disorganized, will improve. I promise.
"
" Resources
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://github.com/nvie/vimrc/blob/master/vimrc
"

set encoding=utf8
set backspace=indent,eol,start

" Pathogen
" Eases installation of runtime files and plugins
" https://github.com/tpope/vim-pathogen
" call pathogen#infect()

highlight ExtraWhitespace ctermbg=red guibg=red 
match ExtraWhitespace /\s\+$/

" True color support
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set guicolors
colorscheme monokai
set t_Co=256

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

" Highlight columns at 80 and 120 (the warning track lol)
" You can even highlight a range of columns
"   let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn="80,81,120,121"

" Persistent undo across exits
"================================
au BufWritePre /tmp/* setlocal noundofile
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer
"================================

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Make scrolling and highlighters fast
" Fixes slow scrolling in complex syntax files
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting/16920294#16920294
" https://www.reddit.com/r/vim/comments/3tk66r/vim_slow_scrolling_in_iterm2/cx77dbj
set regexpengine=1
set ttyfast
set lazyredraw


set nocompatible  " We don't want vi compatibility.
set visualbell
set linebreak
set autoread

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%)))
set statusline+=\ %{SyntaxItem()}

set grepprg=ack
set scrolloff=5
set shell=$SHELL

set nobackup
set nowritebackup

set swapfile
set dir=~/tmp

set undofile
set undodir=~/tmp

let mapleader = ","

set showtabline=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nu

set cursorline " underline current line in console

set ignorecase
set smartcase
set showmatch
set wildmode=longest,list,full
set wildignore+=*.swp,*.bak,*.pyc,*/log/*,*/tmp/*,*/images/*,*.pgdump,*/bundler_stubs/*,*.meta,*.unity,*.prefab,*/public/assets/*

set smarttab

set hidden " hide buffers instead of closing them
           "   the current buffer can be put in the background without being
           "   written.

set switchbuf=useopen " reveal already opened files from the quickfix window instead of opening new buffers

set history=1000    " remember more commands
set undolevels=1000 " remember more levels of undo"

set guioptions-=T " remove toolbar
set guioptions-=l " remove left scrollbar
set guioptions-=L " remove left scrollbar
set guioptions-=r " remove right scrollbar
set guioptions-=R " remove right scrollbar
set guioptions-=b " remove bottom scrollbar
set guioptions-=h " remove bottom scrollbar

set nofoldenable
set foldlevel=1
set foldmethod=syntax

set linespace=1
set path+=**

set clipboard=unnamed

syntax on
syntax enable
filetype plugin indent on  " Automatically detect file types.

set hlsearch
set incsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" --START-FRESHIES------------------

" Minimalist Vim Plugin Manager
" https://github.com/junegunn/vim-plug
execute 'source' '~/.vim/config/vim-plug.vimrc'
execute 'source' '~/.vim/config/nerdtree.vimrc'

" Quickly open color config
" nnoremap <leader>ece :e ~/.vim/colors/monokai.vim<CR>

" Quickly open color config as well?
" nnoremap <leader>ece :e ~/.vim/colors/monokai.vim<CR>
" nnoremap <leader><leader> <c-^>
nnoremap <leader>ece <c-^>


" Quickly open/reload vim config
nnoremap <leader>eve :e $MYVIMRC<CR>
nnoremap <leader>evr :source $MYVIMRC<CR>

" Quickly open/reload zsh config
nnoremap <leader>eze :e ~/.zshrc<CR>
nnoremap <leader>ezr :!. ~/.zshrc<CR>

" --END-FRESHIES--------------------

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let wiki = {}
let wiki.path = '~/vimwiki'
let wiki.diary_index = 'daily'
let wiki.diary_rel_path = 'daily/'
let wiki.nested_syntaxes = {'ruby': 'ruby', 'eruby': 'eruby'}
let g:vimwiki_list = [wiki]
let g:vimwiki_camel_case = 0

let g:vimwiki_browsers=['open']
let vimwiki_folding=0
let vimwiki_use_calendar=1

map <leader>wn :VimwikiDiaryNextDay<CR>
map <leader>wp :VimwikiDiaryPrevDay<CR>

map <leader>gl :tabnew ~/workspace/lokap/README.md<CR>:silent! lcd %:p:h<CR>
map <leader>gs :e ~/workspace/lokap/scraps.rb<CR>
map <leader>go :tabnew ~/workspace/openbay-web/README.md<CR>:silent! lcd %:p:h<CR>

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>

map gc :e <cfile><CR>

" spellchecker configuration
setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.txt,*.html,README,*.rdoc,*.wiki,*.md set spell
autocmd BufReadPost *.yml set syntax=ansible
autocmd FileType coffee setlocal nospell
autocmd BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Procfile
autocmd BufNewFile,BufReadPost Procfile set filetype=ruby

map -a :call SyntaxAttr()<CR>

map <leader>mm :TlistToggle<CR>


map H ^
map L $

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

map ,sdate :let @z=strftime("%Y-%m-%d")<Cr>"zp
map ,stime :let @z=strftime("%l:%M %p")<Cr>"zp
map ,sdt   :let @z=strftime("%Y-%m-%d %l:%M %p")<Cr>"zp

map ,sfdate :let @z=strftime("= %Y-%m-%d =")<Cr>"zp
map ,sftime :let @z=strftime("=== %l:%M %p ===")<Cr>"zp
map ,ssup :let @z=strftime("#standup ```\ny:\n-\n\nt:\n-\n\nb:\n- none\n```\n\n#big3 ```\n1:\n2:\n3:\n```\n\n")<Cr>"zp
map ,sup :let @z=strftime("#standup ```\ny:\nt:\nb: none\n```")<Cr>"zp

map th :tabfirst<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>
map tl :tablast<CR>
map tc :tabnew<CR>
map tk :tabclose<CR>

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

let g:SuperTabDefaultCompletionType = "<c-n>"

set statusline+=%#warningmsg#
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
" let g:syntastic_sort_aggregated_errors = 0

let g:syntastic_ruby_checkers = ['reek', 'flog', 'rubocop']

let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

map <leader>s :SyntasticCheck<CR>

" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

nnoremap <leader>t :Files<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :History<CR>
nnoremap <silent> <leader>f :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>F :execute 'grep ' . input('grep: ')<CR>


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-compkete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.yml set foldmethod=marker

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif



