set nocompatible  " We don't want vi compatibility.
set visualbell
set wrap
set linebreak
set autoread
set laststatus=2
"let statusline="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))
set grepprg=ack

syntax on
syntax enable
filetype plugin indent on  " Automatically detect file types.
colorscheme monokai

setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.txt,*.html,README,*.rdoc set spell

map -a :call SyntaxAttr()<CR>
map -r :ruby finder.rescan!<CR>
set tabstop=2
set shiftwidth=2
set nobackup
set expandtab
set number

set incsearch
set ignorecase
set smartcase
set wildmode=longest,list,full

set guioptions-=T " remove toolbar
set guioptions-=l " remove left scrollbar
set guioptions-=L " remove left scrollbar
set guioptions-=r " remove right scrollbar
set guioptions-=R " remove right scrollbar
set guioptions-=b " remove bottom scrollbar
set guioptions-=h " remove bottom scrollbar


autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

if has("gui_running")
  "GUI is running or is about to start.
  "Maximize gvim window.
  "set guifont=Monaco:h18
  set guifont=Inconsolata-dz:h18
  "set guifont=Inconsolata-dz:h24
  "set guifont=Monofur:h22
  set lines=90 columns=130
endif

set linespace=1

let g:fuzzy_ignore = "*.log;*.png;*.jpg;*.gif;vendor/**;coverage/**;tmp/**"
let g:fuzzy_matching_limit = 100

let mapleader = ","
map <leader>t :FuzzyFinderTextMate<CR>

map <leader>nn :NERDTreeToggle<CR>
map <leader>mm :TlistToggle<CR>
 
set path+=**
map <silent> <F5> :source ~/.vimrc<CR>

map H ^
map L $

set nobackup
set nowritebackup
set noswapfile

