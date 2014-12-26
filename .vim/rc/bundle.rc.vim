NeoBundleFetch 'Shougo/neobundle.vim'

if !has('gui_running')
  NeoBundle 'godlygeek/csapprox'
endif

NeoBundle 'AndrewRadev/switch.vim'
NeoBundleLazy 'Shougo/neocomplete.vim', {
  \ 'depends': 'Shougo/context_filetype.vim',
  \ 'insert': 1
  \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build': {
  \   'windows': 'make -f make_ming32.mak',
  \   'cygwin': 'make -f make_cygwin.mak',
  \   'mac': 'make -f make_mac.mak',
  \   'unix': 'make -f make_unix.mak'
  \   }
  \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim', {
  \ 'depends': 'Shougo/unite.vim'
  \ }
NeoBundle 'amix/vim-zenroom2'
NeoBundle 'bling/vim-airline'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'digitaltoad/vim-jade'
NeoBundleLazy 'elzr/vim-json', { 'filetypes': 'javascript' }
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'gregsexton/gitv'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hspec/hspec.vim'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'mhinz/vim-signify'
NeoBundleLazy 'moll/vim-node', { 'filetypes': 'javascript' }
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'othree/javascript-libraries-syntax.vim', { 'filetypes': 'javascript' }
NeoBundle 'othree/html5.vim'
NeoBundleLazy 'pangloss/vim-javascript', { 'filetypes': 'javascript' }
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shuhei/vim-jours'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'tpope/vim-haml', { 'filetypes': 'haml' }
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tyru/open-browser.vim'
NeoBundleLazy 'vim-ruby/vim-ruby', { 'filetypes': 'ruby' }
NeoBundleLazy 'vim-scripts/java.vim', { 'filetypes': 'java' }
