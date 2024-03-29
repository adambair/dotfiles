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

set wrap linebreak nolist
set formatoptions-=t

" set clipboard=unnamed
set clipboard=unnamedplus

set wildmode=longest,list,full
set wildignore+=*.swp,*.bak,*.pyc,*/log/*,*/tmp/*,*/images/*,*.pgdump,*/bundler_stubs/*,*.meta,*.unity,*.prefab,*/public/assets/*,*__pycache__*,*_build*,*/node_modules/*,*/coverage/*,*/docs_js/*,*/build/*

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

" set regexpengine=1
set ttyfast
set lazyredraw
"
" NOTE: This actually slows things down in later versions of vim

" }}}
" Filetypes {{{

set autoread
set modelines=1       " Allow the last line/comment of a file to configure vim
set encoding=utf8     " Allow weird characters ;)

filetype plugin indent on

au BufNewFile,BufRead *.ini      set nospell
au BufNewFile,BufRead Procfile   set filetype=ruby nospell
au BufNewFile,BufRead *.wiki     set textwidth=80 expandtab tabstop=2 softtabstop=2 shiftwidth=2 shiftwidth=2 spell
au BufNewFile,BufRead *.md       set textwidth=80 expandtab tabstop=2 softtabstop=2 shiftwidth=2 shiftwidth=2 spell
au BufNewFile,BufRead *.scss,*.sass   set textwidth=80 expandtab tabstop=2 softtabstop=2 shiftwidth=2 shiftwidth=2
au BufNewFile,BufRead *.service  set filetype=gitconfig nospell

au BufNewFile,BufRead *.json     set expandtab tabstop=2 softtabstop=2 shiftwidth=2 nospell
au BufNewFile,BufRead *.js,*.jsx set filetype=javascript expandtab tabstop=2 softtabstop=2 shiftwidth=2 nospell
au BufNewFile,BufRead *.html,*.erb set expandtab tabstop=2 softtabstop=2 shiftwidth=2 shiftwidth=2 nospell

" au BufNewFile,BufReadPost *.go        set foldmethod=syntax foldnestmax=1
" au BufRead,BufReadPost,BufNewFile *.py            set expandtab tabstop=4 softtabstop=4 shiftwidth=4 nospell


" }}}
" Folding {{{

" Change format of folded text
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('-' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn

    "return foldtextstart . repeat(foldchar, 104-foldtextlength) . foldtextend
    "return foldtextstart . repeat(foldchar, 88-foldtextlength) . foldtextend
    "return foldtextstart . repeat(foldchar, 128-foldtextlength) . foldtextend
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()
set foldnestmax=10      " max fold depth
set foldlevelstart=1    " start with fold level of x
set foldenable          " do/don't fold files by default on open
set fdc=1               " add fold indicator to status column

au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

" toggle fold
nnoremap <space> za

" create fold (visual select)
vmap <space> zf

" close other folds
map zo zMzv

" }}}
" Config Reloading {{{

" Quickly open/reload vim config
nnoremap <leader>eve :e $MYVIMRC<CR>
nnoremap <leader>evr :source $MYVIMRC<CR> :e<CR>

" Quickly open color config as well?
nnoremap <leader>ece :e ~/.vim/colors/monokai.vim<CR>

" Quickly open/reload zsh config
nnoremap <leader>eze :e ~/.zshrc<CR>
nnoremap <leader>ezr :!. ~/.zshrc<CR>

" Preview Markdown with Pandoc
" Note: relies on ~/bin/gfm.css (styles for github-flavored markdown)
nnoremap <leader>p :!preview=/tmp/preview-$RANDOM.html && pandoc -f markdown+hard_line_breaks --wrap=preserve --self-contained -c $HOME/bin/gfm.css --to html % --metadata pagetitle=preview > $preview && echo "<article class=\"markdown-body entry-content\">"$(cat $preview)"</article>" > $preview && xdg-open $preview  &>/dev/null && sleep 1 && rm $preview<CR>

" }}}
" Date and Time {{{

" map ,sdate  :let @z=strftime("%Y-%m-%d")<Cr>"zp
" map ,stime  :let @z=strftime("%l:%M %p")<Cr>"zp
" map ,sdt    :let @z=strftime("%Y-%m-%d %l:%M %p")<Cr>"zp
map ,sd :let @z=strftime("%Y-%m-%d")<Cr>"zp
map ,st :let @z=strftime("%I:%M %p")<Cr>"zp

map ,sfdate :let @z=strftime("**%Y-%m-%d**")<Cr>"zp
map ,sftime :let @z=strftime("_%I:%M %p_")<Cr>"zp

" consider syntax for highlight date and timestamps in wiki journal

" Standup
map ,sup :let @z=strftime("## Workload\n\n(y)esterday:\n-\n\n(t)oday:\n-\n\n(b)lockers:\n-\n\n(p)otentials:\n-\n\n(w)ishlist:\n-\n\n## Worklog\n")<Cr>"zp

" }}}
" Navigation {{{

" next/previous definition
map m ]m
map M [m

" maximize, equalize window views
map <C-w>m <C-W>_
map <C-w>M <C-W>=

" }}}
" ctags {{{

" Go to definition
map <leader>gd <C-]>

" when saving a .py file, rebuild all .py tags in the working dir
" au BufWritePost *.py, silent! !ctags -R --kinds-python=-i **/*.py

" }}}
" LOKAP {{{

map <leader>gl :tabnew ~/workspace/lokap/README.md<CR>:silent! lcd %:p:h<CR><leader>re<CR>
map <leader>gs :tabnew ~/workspace/lokap/scraps.rb<CR>:silent! lcd %:p:h<CR><leader>re<CR>

" Change working directory to the directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Strip all trailing whitespace from a file, using ,W
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

" Plug 'romainl/idiomatic-vimrc'    " Guidelines for vim config files

" Linting
"Plug 'w0rp/ale'
" Plug 'dense-analysis/ale'
" I dunno, this one is funky
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Eyecandy
Plug 'ryanoasis/vim-devicons'   " Overridden with specific icons
Plug 'godlygeek/csapprox'
Plug 'vim-scripts/SyntaxAttr.vim'           " Displays the syntax highlighting attributes
Plug 'airblade/vim-gitgutter'

"Plug 'chrisbra/Colorizer'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Searching
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'

" Editing
Plug 'ervandew/supertab'        " Tab completion
Plug 'preservim/nerdcommenter' " Excellent cross-language comment toggle
Plug 'tpope/vim-unimpaired'     " Pairs of handy bracket mappings
"Plug 'tpope/vim-endwise'        " Insert ends, intelligently
Plug 'tpope/vim-surround'       " Change your surroundings
Plug 'tpope/vim-repeat'         " Repeat command support for certain plugins
Plug 'tpope/vim-fugitive'       " Git stuff, Gblame, etc
Plug 'tpope/vim-abolish'        " :Subvert/blog{,s}/post{,s}/g
Plug 'junegunn/vim-easy-align'  " A simple, easy-to-use Vim alignment plugin.

" Languages
Plug 'vim-ruby/vim-ruby'
" Plug 'kchmck/vim-coffee-script'
" Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'mxw/vim-jsx'              " React
Plug 'wannesm/wmgraphviz.vim'
Plug 'tikhomirov/vim-glsl'
" Plug 'vim-python/python-syntax' " Python
" Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'
" Plug 'yuezk/vim-js'
" Plug 'cespare/vim-toml'



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
" {{{ vim-stay
set viewoptions=cursor,folds,slash,unix
" }}}
" {{{ vim-gitgutter
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified = '~~'
" }}}
"{{{ vim-fugitive

" git history
nmap <leader>gh :0Glog<CR>
" git who
nmap <leader>gw :Gblame<CR>

"}}}
" python-syntax {{{

" let g:python_highlight_all = 1

" }}}
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
" }}}
"{{{ vim-hexokinase

let g:Hexokinase_highlighters = [ 'backgroundfull' ]
" Default
" let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

"}}}
" vim-supertab {{{

let g:SuperTabDefaultCompletionType = "<c-n>"

" }}}
" vim-wiki {{{

let daily_wiki                  = {}
let daily_wiki.path             = '~/.lokal/wiki/'
let daily_wiki.diary_index      = 'daily'
let daily_wiki.diary_rel_path   = 'daily/'
let daily_wiki.syntax           = 'markdown'
let daily_wiki.nested_syntaxes  = {}
let daily_wiki.ext              = 'md'

let g:vimwiki_list        = [daily_wiki]
let g:vimwiki_camel_case  = 0
let g:vimwiki_url_maxsave = 0
let g:vimwiki_browsers    = ['open']
let g:vimwiki_folding     = '' " do not fold by default
let g:vimwiki_ext2syntax  = {'.md': 'markdown'}


" let g:markdown_fenced_languages = ['ruby', 'html', 'css', 'js=javascript', 'json=javascript']
" let g:markdown_syntax_conceal = 1

map <leader>wn :VimwikiDiaryNextDay<CR>
map <leader>wp :VimwikiDiaryPrevDay<CR>

let g:taskwiki_disable_concealcursor='disable'
let g:taskwiki_sort_order='priority'

" Hrmmm
" inoremap <C-@> <c-x><c-o>

map <C-@> :VimwikiToggleListItem<CR>

"}}}
" vim-easy-align {{{

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" vim-devicons {{{
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" }}}
" preservim/nerdcommenter {{{
let NERDSpaceDelims = 1
let NERDCommentEmptyLines = 1
let NERDTrimTrailingWhitespace = 1
let NERDDefaultAlign = 'left'
" }}}
" vim-NERDTree {{{
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeCascadeSingleChildDir = 0 " do not cascade empty dirs
let g:NERDTreeWinSize=40
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules', 'coverage', 'docs_js']

" Close pane on file selection
let NERDTreeQuitOnOpen=1

" Show/hide NERDTree
map <leader>nn :NERDTreeToggle<CR>

" Reveal current file
map <leader>re :NERDTreeFind<CR>

" }}}
" wmgraphviz {{{
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
let g:ale_set_highlights       = 0

nmap <Leader>ap <Plug>(ale_previous)
nmap <Leader>an <Plug>(ale_next)
" }}}
" vim-javascript {{{

let g:javascript_plugin_jsdoc = 1
"}}}
" }}}
" Quickfix {{{

nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>
nnoremap <leader>cw :cw<CR>

" Add quickfix list to args for use with argdo for project-wide search/replace
"
"   ,f                       # search files for content
"   Ag/ testing              # search for files containg the word 'testing'
"   :Qargs                   # adds quickfix list to argument list
"   :argdo %s/foo/bar/       # operate on all the files in argument list
"
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

map <leader>as :call SyntaxAttr()<CR>
map <leader>af :echo &filetype<CR>

" }}}
" Searching / FZF {{{

set ignorecase  " ignore case in vim searches and commands
set smartcase   " only care about case, if I use uppercase letters

" Using ripgrep for filename search
let rg_ignore = "--hidden" .
      \" -g '!.git/*'" .
      \" -g '!.venv/*'" .
      \" -g '!*build/*'" .
      \" -g '!.mypy_cache/*'" .
      \" -g '!*node_modules*'" .
      \" -g '!*coverage*'" .
      \" -g '!*docs_js*'" .
      \" -g '!*.rst'" .
      \" -g '!*static/dist/*'"

let $FZF_DEFAULT_COMMAND = "rg --files --no-ignore --follow " . rg_ignore
let g:fzf_layout = { 'down':  '40%'}
let g:fzf_preview_window = []

" Using silver_searcher (ag) for filename search
let ag_ignore = '--hidden ' .
      \' --ignore "*build/*"' .
      \' --ignore "*.git"' .
      \' --ignore "*.venv/*"' .
      \' --ignore "*node_modules*"' .
      \' --ignore "*coverage*"' .
      \' --ignore "*docs_js*"' .
      \' --ignore "*.rst"' .
      \' --ignore "*static/dist/*"'

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, ag_ignore, <bang>0)

set hlsearch
set incsearch

" hitting 'enter' clears higlighting for '/' searches (:noh :nohlsearch)
nnoremap <CR> :noh<CR><CR>
nnoremap <silent>; :noh<CR>

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
set nospell
au BufNewFile,BufRead *.txt,README,*.rdoc,*.md set spell
au BufNewFile,BufRead *.git/COMMIT_EDITMSG set ft=gitcommit
au FileType fugitiveblame,coffee,go,service setlocal nospell

map zn ]s
map zp [s
map z; z=\|1<cr>\|:spellr<cr>

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
hi    ExtraWhitespace guifg=#000000 guibg=#8B0000 ctermbg=2
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

" highlight non ascii characters such as ' ' instead of ' '
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=#8B0000 ctermbg=2

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

"https://github.com/ryanoasis/vim-devicons/wiki/Extra-Configuration

syn region conflictStart start=/^<<<<<<< .*$/ end=/^\ze\(=======$\||||||||\)/
syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
syn region conflictEnd start=/^\(=======$\||||||| |\)/ end=/^>>>>>>> .*$/

" Italics
" In order to have italics show up I need to re-source my config (no idea why)
autocmd VimEnter * source $MYVIMRC

" }}}



" # vim: fdm=marker fdls=0
