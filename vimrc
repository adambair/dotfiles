"
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

" Misc {{{

let mapleader = ","

set nocompatible      " We don't want vi compatibility.
set shell=$SHELL
set nobackup
set nowritebackup
set noswapfile
set dir=~/tmp
set history=9001      " remember more commands, OVER 9000!!!!

" set clipboard=unnamed
set clipboard=unnamedplus

set wildmode=longest,list,full
set wildignore+=*.swp,*.bak,*.pyc,*/log/*,*/tmp/*,*/images/*,*.pgdump,*/bundler_stubs/*,*.meta,*.unity,*.prefab,*/public/assets/*,*__pycache__*

" remap increment (add) to ctrl+j/k movements
noremap <C-K> <C-A>
" remap decrement (subtract) to ctrl+j/k movements
noremap <C-J> <C-X>

" turn off visual bell
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

set hidden            " hide buffers instead of closing them the current buffer
                      " can be put in the background without being written.

set switchbuf=useopen " reveal already opened files from the quickfix window
                      " instead of opening new buffers

" Allow saving of files as sudo when I forgot to start vim using sudo.
" https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

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

au BufNewFile,BufReadPost Procfile    set filetype=ruby
au BufNewFile,BufReadPost *.yml       set foldmethod=marker
au BufRead,BufNewFile *.md,*.wiki     set textwidth=80
au BufNewFile,BufReadPost *.go        set foldmethod=syntax foldnestmax=1
au BufNewFile,BufReadPost *.service   set filetype=gitconfig nospell

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set tabstop=4
au BufRead,BufNewFile *.py set softtabstop=4
au BufRead,BufNewFile *.py set shiftwidth=4

au BufRead,BufNewFile *.js set expandtab
au BufRead,BufNewFile *.js set tabstop=2
au BufRead,BufNewFile *.js set softtabstop=2
au BufRead,BufNewFile *.js set shiftwidth=2

au BufRead,BufNewFile *.html set expandtab
au BufRead,BufNewFile *.html set tabstop=2
au BufRead,BufNewFile *.html set softtabstop=2
au BufRead,BufNewFile *.html set shiftwidth=2


" }}}
" Folding {{{

set foldmethod=marker   " fold method
set foldnestmax=10      " max fold depth
" set foldenable          " do/don't fold files by default on open
set foldlevelstart=1    " start with fold level of x

" toggle fold
nnoremap <space> za

" close other folds
map zo zMzv

" }}}
" Config Reloading {{{

" Quickly open/reload vim config
nnoremap <leader>eve :e $MYVIMRC<CR>
nnoremap <leader>evr :source $MYVIMRC<CR>

" Quickly open color config as well?
nnoremap <leader>ece :e ~/.vim/colors/monokai.vim<CR>

" Quickly open/reload zsh config
nnoremap <leader>eze :e ~/.zshrc<CR>
nnoremap <leader>ezr :!. ~/.zshrc<CR>

" Preview Markdown with Pandoc
" Note: relies on ~/bin/gfm.css (styles for github-flavored markdown)
nnoremap <leader>p :!preview=/tmp/preview-$RANDOM.html && pandoc --self-contained -c $HOME/bin/gfm.css --to html % --metadata pagetitle=preview > $preview && echo "<article class=\"markdown-body entry-content\">"$(cat $preview)"</article>" > $preview && xdg-open $preview  &>/dev/null && sleep 1 && rm $preview<CR>

" }}}
" Date and Time {{{

map ,sdate  :let @z=strftime("%Y-%m-%d")<Cr>"zp
map ,stime  :let @z=strftime("%l:%M %p")<Cr>"zp
map ,sdt    :let @z=strftime("%Y-%m-%d %l:%M %p")<Cr>"zp
map ,sfdate :let @z=strftime("= %Y-%m-%d =")<Cr>"zp
map ,sftime :let @z=strftime("=== %l:%M %p ===")<Cr>"zp

" Standup
map ,sup :let @z=strftime("#standup ```\ny:\nt:\nb: none\n```")<Cr>"zp
" map ,ssup :let @z=strftime("#standup ```\ny:\n-\n\nt:\n-\n\nb:\n- none\n```\n\n#big3 ```\n1:\n2:\n3:\n```\n\n")<Cr>"zp


" }}}
" LOKAP {{{

map <leader>gl :tabnew ~/workspace/lokap/README.md<CR>:silent! lcd %:p:h<CR><leader>re<CR>h
map <leader>gs :e ~/workspace/lokap/scraps.rb<CR>

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
" Packages / vim-plug {{{

" Minimalist Vim Plugin Manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'romainl/idiomatic-vimrc'    " Guidelines for vim config files

" Linting
Plug 'w0rp/ale'

" Eyecandy
Plug 'ryanoasis/vim-devicons'   " Overridden with specific icons
Plug 'godlygeek/csapprox'
Plug 'SyntaxAttr.vim'           " Displays the syntax highlighting attributes
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'

" Searching
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'               " original

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'

" Editing
Plug 'ervandew/supertab'        " Tab completion
Plug 'scrooloose/nerdcommenter' " Excellent cross-language comment toggle
Plug 'tpope/vim-unimpaired'     " Pairs of handy bracket mappings
Plug 'tpope/vim-endwise'        " Insert ends, intelligently
Plug 'tpope/vim-surround'       " Change your surroundings
Plug 'tpope/vim-repeat'         " Repeat command support for certain plugins
Plug 'tpope/vim-fugitive'       " Git stuff, Gblame, etc
Plug 'tpope/vim-abolish'        " :Subvert/blog{,s}/post{,s}/g
Plug 'junegunn/vim-easy-align'  " A simple, easy-to-use Vim alignment plugin.

" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'              " React
Plug 'wannesm/wmgraphviz.vim'
Plug 'sheerun/vim-polyglot'


" Wiki
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" Advanced Sort
Plug 'inkarkat/vim-ingo-library'
Plug 'vim-scripts/AdvancedSorters' " Multiline-aware relies on ingo

" Unused?
" Plug 'easymotion/vim-easymotion'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
" Plug 'majutsushi/tagbar'
" Plug 'Konfekt/FastFold'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'kana/vim-textobj-user'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'ck3g/vim-change-hash-syntax'

call plug#end()

" }}}
" Packages / configuration {{{

" faith/vim-go {{{
let g:go_fmt_command = "goimports"

let g:go_highlight_types       = 1
let g:go_highlight_fields      = 0
let g:go_highlight_functions   = 1
let g:go_highlight_methods     = 1

let g:go_highlight_operators   = 1
let g:go_highlight_extra_types = 1

let g:go_highlight_build_constraints     = 1
let g:go_highlight_function_calls        = 0
" let g:go_highlight_variable_assignments  = 1
" let g:go_highlight_variable_declarations = 1
" }}}
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
let g:taskwiki_sort_order='priority'

"}}}
" vim-easy-align {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" vim-NERDTree {{{

let NERDSpaceDelims=1

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeCascadeSingleChildDir = 0 " do not cascade empty dirs
let g:NERDTreeWinSize=50
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Close pane on file selection
let NERDTreeQuitOnOpen=1

" Show/hide NERDTree
map <leader>nn :NERDTreeToggle<CR>

" Reveal current file
map <leader>re :NERDTreeFind<CR>

" }}}
" Graphviz {{{
map <silent> <leader>lv :silent GraphvizCompile<CR>:silent GraphvizShow<CR>:redraw!<CR>
map <leader>lc :GraphvizCompile<CR>
" }}}
" vim-ale ALE ale {{{
" let g:ale_sign_error = '✹'
" let g:ale_sign_warning = '⚠'
" 
" 
let g:ale_sign_error           = '•'
let g:ale_sign_warning         = '•'
let g:ale_echo_msg_error_str   = '✹ Error'
let g:ale_echo_msg_format      = '%severity%: %linter% - %s '
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_statusline_format    = ['E•%d', 'W•%d', 'OK']
let g:ale_set_highlights = 0

nmap <Leader>ap <Plug>(ale_previous)
nmap <Leader>an <Plug>(ale_next)
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
"
" z=  suggests spelling
" zg  adds to dictionary
" zug removes from dictionary

" spellchecker configuration
" setlocal spell spelllang=en_us
set spell spelllang=en_gb 
set spellcapcheck=
autocmd BufNewFile,BufRead *.txt,*.html,README,*.rdoc,*.wiki,*.md set spell
autocmd FileType coffee,go,service setlocal nospell

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

" go language
" let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           " \ 'v:variable;f:function'

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
" hi    ExtraWhitespace              ctermbg=red   guibg=red
" match ExtraWhitespace /\s\+$/

" highlight non ascii characters such as ' ' instead of ' '
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

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
set noshowmatch  " when a bracket is inserted, briefly jump to the matching one

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

" # vim: fdm=marker fdls=0
