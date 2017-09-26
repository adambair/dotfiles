"               88
"               ``
"  8b       d8  88  88,dPYba,,adPYba,   8b,dPPYba,   ,adPPYba,
"  `8b     d8'  88  88P'   `88`    `8a  88P`   `Y8  a8`     ``
"   `8b   d8'   88  88      88      88  88          8b
"    `8b,d8'    88  88      88      88  88          "8a,   ,aa
"      `8`      88  88      88      88  88           `"Ybbd8"'
"
"
" Personal preference .vimrc file
" Maintained by Adam Bair <adambair@gmail.com>
"
" Resources
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://github.com/nvie/vimrc/blob/master/vimrc
" https://github.com/dougblack/dotfiles/blob/master/.vimrc

" Buffers {{{

set hidden            " hide buffers instead of closing them the current buffer
                      " can be put in the background without being written.

set switchbuf=useopen " reveal already opened files from the quickfix window
                      " instead of opening new buffers

" }}}
" Fast Rendering {{{

" Make scrolling and highlighters fast
" Fixes slow scrolling in complex syntax files
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting/16920294#16920294
" https://www.reddit.com/r/vim/comments/3tk66r/vim_slow_scrolling_in_iterm2/cx77dbj

set regexpengine=1
set ttyfast
set lazyredraw

" }}}
" Filetypes {{{

set autoread
set modelines=1       " Allow the last line/comment of a file to configure vim
set encoding=utf8     " Allow weird characters ;)

filetype plugin indent on

autocmd BufNewFile,BufReadPost Procfile set filetype=ruby
autocmd BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufReadPost *.yml set syntax=ansible
" autocmd BufNewFile,BufReadPost *.md,*.wiki set filetype=markdown
autocmd BufNewFile,BufReadPost *.yml set foldmethod=marker

" }}}
" Folding {{{

set foldmethod=syntax   " fold based on indent level
set foldnestmax=0       " max 10 depth
set foldenable          " do/don't fold files by default on open
set foldlevelstart=1    " start with fold level of 1

" toggle fold
nnoremap <space> za

" close other folds
map zo zMzv

" }}}
" Macros {{{

" Config Reloading {{{

" Quickly open color config as well?
nnoremap <leader>ece :e ~/.vim/colors/monokai.vim<CR>

" Quickly open/reload vim config
nnoremap <leader>eve :e $MYVIMRC<CR>
nnoremap <leader>evr :source $MYVIMRC<CR>

" Quickly open/reload zsh config
nnoremap <leader>eze :e ~/.zshrc<CR>
nnoremap <leader>ezr :!. ~/.zshrc<CR>

" }}}
" Date and Time {{{

map ,sdate  :let @z=strftime("%Y-%m-%d")<Cr>"zp
map ,stime  :let @z=strftime("%l:%M %p")<Cr>"zp
map ,sdt    :let @z=strftime("%Y-%m-%d %l:%M %p")<Cr>"zp
map ,sfdate :let @z=strftime("= %Y-%m-%d =")<Cr>"zp
map ,sftime :let @z=strftime("=== %l:%M %p ===")<Cr>"zp

" }}}

" LOKAP {{{

map <leader>gl :tabnew ~/workspace/lokap/README.md<CR>:silent! lcd %:p:h<CR><leader>re<CR>h
map <leader>gs :e ~/workspace/lokap/scraps.rb<CR>

" }}}
" Openbay {{{

map <leader>go :tabnew ~/workspace/openbay-web/README.md<CR>:silent! lcd %:p:h<CR>

map ,ssup   :let @z=strftime("#standup ```\ny:\n-\n\nt:\n-\n\nb:\n- none\n```\n\n#big3 ```\n1:\n2:\n3:\n```\n\n")<Cr>"zp
map ,sup    :let @z=strftime("#standup ```\ny:\nt:\nb:\n- none\n```")<Cr>"zp

" }}}

" Change working directory to the directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" }}}
" Markers {{{

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" }}}
" Misc {{{

let mapleader = ","

set nocompatible      " We don't want vi compatibility.
set shell=$SHELL
set nobackup
set nowritebackup
set noswapfile
set dir=~/tmp

set history=9001      " remember more commands, OVER 9000!!!!
set path+=**

" set clipboard=unnamed
set clipboard=unnamedplus

set wildmode=longest,list,full
set wildignore+=*.swp,*.bak,*.pyc,*/log/*,*/tmp/*,*/images/*,*.pgdump,*/bundler_stubs/*,*.meta,*.unity,*.prefab,*/public/assets/*

" remap increment (add) to ctrl+j/k movements
noremap <C-K> <C-A>
" remap decrement (subtract) to ctrl+j/k movements
noremap <C-J> <C-X>

" turn off visual bell
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

" }}}
" Packages / vim-plug {{{

" Minimalist Vim Plugin Manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'godlygeek/csapprox'
" Plug 'ap/vim-css-color'         " Show css color background on css hex codes
Plug 'chrisbra/Colorizer'
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'                 " +timers +job +channel
Plug 'scrooloose/nerdcommenter' " Excellent cross-language comment toggle
Plug 'ryanoasis/vim-devicons'   " Overridden with specific icons

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'               " original
Plug 'junegunn/vim-easy-align'

Plug 'wannesm/wmgraphviz.vim'
Plug 'vim-ruby/vim-ruby'

Plug 'mbbill/undotree'
Plug 'taglist.vim'
Plug 'SyntaxAttr.vim'
Plug 'ervandew/supertab'        " Tab completion

Plug 'tpope/vim-unimpaired'     " Pairs of handy bracket mappings
Plug 'tpope/vim-endwise'        " Insert ends, intelligently
Plug 'tpope/vim-surround'       " Change your surroundings
Plug 'tpope/vim-repeat'         " Repeat command support for certain plugins
" Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'              " :Subvert/blog{,s}/post{,s}/g

Plug 'kchmck/vim-coffee-script'

Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'Konfekt/FastFold'

Plug 'ntpeters/vim-better-whitespace'
Plug 'ck3g/vim-change-hash-syntax'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'tbabej/taskwiki'

call plug#end()

" }}}
" Packages / configuration {{{

" chrisbra/Colorizer {{{

let g:colorizer_auto_filetype = 'css,html,sass,haml,scss'
let g:colorizer_colornames    = 0

" }}}
" vim-supertab {{{

let g:SuperTabDefaultCompletionType = "<c-n>"

" }}}
" vim-wiki {{{

let wiki                 = {}
let wiki.path            = '~/.lokal/wiki/'
let wiki.diary_index     = 'daily'
let wiki.diary_rel_path  = 'daily/'
let wiki.nested_syntaxes = {'ruby': 'ruby', 'eruby': 'eruby'}
let g:vimwiki_list       = [wiki]
let g:vimwiki_camel_case = 0
let g:vimwiki_browsers   = ['open']
let vimwiki_folding      = '' " do not fold by default

map <leader>wn :VimwikiDiaryNextDay<CR>
map <leader>wp :VimwikiDiaryPrevDay<CR>

let g:taskwiki_disable_concealcursor='disable'

"}}}
" vim-easy-align {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" vim-syntastic {{{

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0
let g:syntastic_aggregate_errors         = 1
let g:syntastic_id_checkers              = 1
let g:syntastic_sort_aggregated_errors   = 0
let g:syntastic_ruby_checkers            = ['reek', 'flog', 'rubocop', 'brakeman']

let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

sign define SyntasticError        text=>>
sign define SyntasticWarning      text=>>
sign define SyntasticStyleError   text=
sign define SyntasticStyleWarning text=

" map <leader>sc :SyntasticCheck<CR>
" map <leader>sr :SyntasticReset<CR>

"}}}
" vim-NERDTree {{{

let NERDSpaceDelims=1

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinSize=50

" Show/hide NERDTree
map <leader>nn :NERDTreeToggle<CR>

" Reveal current file
map <leader>re :NERDTreeFind<CR>

" }}}
" Graphviz {{{
map <silent> <leader>lv :silent GraphvizCompile<CR>:silent GraphvizShow<CR>:redraw!<CR>
map <leader>lc :GraphvizCompile<CR>
" }}}

" }}}
" Quickfix {{{

nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" }}}
" Reveal Syntax {{{

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

map -a :call SyntaxAttr()<CR>

" }}}
" Searching {{{

set ignorecase  " ignore case in vim searches and commands
set smartcase   " only care about case, if I use uppercase letters

" Using ripgrep to power fzf -- https://github.com/BurntSushi/ripgrep
let $FZF_DEFAULT_COMMAND = "rg --files --no-ignore --hidden --follow --glob '!.git/*'"

set hlsearch
set incsearch

" clears higlighting for '/' searches (:noh :nohlsearch)
nnoremap <CR> :noh<CR><CR>
nnoremap <silent>; :noh<CR><CR>

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

" }}}
" Spellchecker {{{

" spellchecker configuration
" setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.txt,*.html,README,*.rdoc,*.wiki,*.md set spell
autocmd FileType coffee setlocal nospell

" }}}
" Tabs {{{

set showtabline=2  " configures how tab page labels will be displayed:
                   "     0: never
                   "     1: only if there are at least two tab pages
                   "     2: always

set smarttab

map th :tabfirst<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>
map tl :tablast<CR>
map tc :tabnew<CR>
map tk :tabclose<CR>

" }}}
" Tags {{{

let Tlist_Ctags_Cmd='ctags'
map <leader>mm :TlistToggle<CR>

" }}}
" Theme / Colors {{{

" True color support
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"

" Italic support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set termguicolors

colorscheme monokai

" Highlight columns at 80 and 120 (the warning track lol)
" You can even highlight a range of columns
"   let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn="80,81,120,121"

" Not sure why I have to specify these here, but they don't work in my
" colorscheme file :/
hi    ExtraWhitespace              ctermbg=red   guibg=red
match ExtraWhitespace /\s\+$/

" Status Line {{{

set laststatus=2
set statusline+=%#warningmsg#
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=%*

set laststatus=2
"let statusline="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%)))
set statusline+=\ %{SyntaxItem()}
" }}}

" }}}
" Typing, Spaces, and Tabs {{{

set backspace=indent,eol,start

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showmatch  " when a bracket is inserted, briefly jump to the matching one

map H ^
map L $

" }}}
" Undo {{{
" (persistent across exits)

au BufWritePre /tmp/* setlocal noundofile
set undodir=~/.vim/undodir
set undofile

                    " It's OVER NINE THOUSAND!!!!
set undolevels=9001 " maximum number of changes that can be undone
set undoreload=9001 " maximum number lines to save for undo on a buffer

" }}}
" UI / Interface {{{


set nu                " show line numbers
set visualbell        " don't beep
syntax enable         " enable syntax, keep current color settings

set guioptions-=T     " remove toolbar
set guioptions-=l     " remove left scrollbar
set guioptions-=L     " remove left scrollbar
set guioptions-=r     " remove right scrollbar
set guioptions-=R     " remove right scrollbar
set guioptions-=b     " remove bottom scrollbar
set guioptions-=h     " remove bottom scrollbar

set cursorline        " underline current line in console
set scrolloff=5       " line padding between cursor and top/bottom of screen

set linespace=1

" }}}

" Post config hacks {{{

" vim-webdevicons
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Italics
" In order to have italics show up I need to re-source my config (no idea why)
autocmd VimEnter * source $MYVIMRC

" }}}

" highlight non ascii characters such as ' ' instead of ' '
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" vim:foldmethod=marker:foldlevel=0
