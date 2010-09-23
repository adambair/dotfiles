"
" Personal preference .vimrc file
" Maintained by Adam Bair <adambair@gmail.com>
"
" My main editor is MacVim though this will work in standard Vim.
" Currently disorganized, will improve. I promise.
"
" Resources
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://github.com/nvie/vimrc/blob/master/vimrc
"

set nocompatible  " We don't want vi compatibility.
set visualbell
set nowrap
set linebreak
set autoread
set laststatus=2
"let statusline="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))
set grepprg=ack
set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

let NERDSpaceDelims=1
let mapleader = ","

syntax on
syntax enable
filetype plugin indent on  " Automatically detect file types.
colorscheme monokai " dark, standard
" colorscheme pyte  " light, for presenting

" spellchecker configuration
setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.txt,*.html,README,*.rdoc set spell

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number

set cursorline " underline current line in console

set incsearch
set ignorecase
set smartcase
set showmatch
set wildmode=longest,list,full

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

if has("autocmd")
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
endif

if has("gui_running")
  "GUI is running or is about to start.
  "Maximize gvim window.
  "set guifont=Monaco:h18
  " set guifont=Inconsolata-dz:h18
  " set guifont=Inconsolata-dz:h26
  set guifont=Inconsolata-dz:h22
  "set guifont=Monofur:h22
  set lines=90 columns=130
endif

set linespace=1

map -a :call SyntaxAttr()<CR>
map -r :CommandTFlush<CR>

map <leader>nn :NERDTreeToggle<CR>
map <leader>mm :TlistToggle<CR>

set path+=**
map <silent> <F5> :source ~/.vimrc<CR>

map H ^
map L $

" Shortcuts
noremap ; :

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

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
" nmap <leader>r :registers<CR>

