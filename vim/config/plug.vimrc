call plug#begin('~/.vim/plugged')

Plug 'godlygeek/csappro' " Currently clashing with pathogen version
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
" Plug 'ryanoasis/vim-devicons' " Overridden with specific icons

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-fugitive'

Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'Konfekt/FastFold'

Plug 'ntpeters/vim-better-whitespace'
Plug 'ck3g/vim-change-hash-syntax'

call plug#end()
