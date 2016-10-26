call plug#begin('~/.vim/plugged')

Plug 'godlygeek/csapprox'
Plug 'ap/vim-css-color'       " Show css color background on css hex codes
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'ryanoasis/vim-devicons' " Overridden with specific icons

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

Plug 'vim-ruby/vim-ruby'

Plug 'mbbill/undotree'
Plug 'taglist.vim'
Plug 'ervandew/supertab' " Tab completion

Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'

Plug 'kchmck/vim-coffee-script'

Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'Konfekt/FastFold'

Plug 'ntpeters/vim-better-whitespace'
Plug 'ck3g/vim-change-hash-syntax'

call plug#end()
