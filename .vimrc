" Vundle https://github.com/gmarik/vundle
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set nocompatible
" filetype needs to be on before it's set off.
" See https://github.com/gmarik/vundle/wiki for more detail.
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle itself
Bundle 'gmarik/vundle'

" Text editing
Bundle 'surround.vim'

" Syntax highlight and check
Bundle 'Markdown'
Bundle 'HTML5-Syntax-File'
Bundle 'basyura/jslint.vim'
function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()
Bundle 'tpope/vim-rails'

" Theme
Bundle 'blackboard.vim'

" Utility
Bundle 'project.tar.gz'
Bundle 'taglist.vim'
Bundle 'https://github.com/thinca/vim-quickrun.git'
let g:quickrun_config = {}
" Build vimproc with 'make -f make_mingw.mak' after installing it.
Bundle 'https://github.com/Shougo/vimproc.git'
Bundle 'https://github.com/Shougo/vimshell.git'
Bundle 'sudo.vim'
Bundle 'scrooloose/nerdtree'
"autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
Bundle 'mattn/gist-vim'
let g:github_user = 'shuhei'
let g:github_token = $GITHUB_TOKEN
let g:gist_clip_command = 'pbcopy'

filetype on
filetype plugin indent on

set termencoding=utf-8
set encoding=utf-8

set fileencodings=iso-2022-jp,utf-8,euc-jp,ucs-2le,ucs-2,cp932

set backspace=indent,eol,start
set incsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
syntax on
set background=dark

set number

set wildmenu

" Unlimited yank buffer
set viminfo='100,h

" Color scheme
colorscheme blackboard
" colorscheme evening

" Keep tabs in C#
autocmd FileType cs setlocal noexpandtab

" Do not stop cursor on line head or end
set whichwrap=b,s,h,l,<,>,[,]

" RSpec
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec -c'}

" Vim Shell shortcuts
nnoremap <silent> ,is :VimShell<CR>
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
vmap <silent> ,ss :VimShellSendString<CR>
nnoremap <silent> ,ss :VimShellSendString<CR>

" Auto recognition of character encodings
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " check if iconv meets eucJP-ms
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc_jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " Build fileencodings
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis . ',' . s:enc_jis
    let &fileencodings = &fileencodings . ',' . s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings . ',' . s:enc_jis
    set fileencodings+=utf-8,ucs-2lw,ucs-2
    if &encoding =~# '^\(euc-jp\leuc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencodings = s:enc_euc
    else
      let &fileencodings = &fileencodings . ',' . s:enc_euc
    endif
  endif
  " throw off constants
  unlet s:enc_euc
  unlet s:enc_jis
endif
" Use encoding as fileencoding if the file has no Japanese
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" Auto recognition of break line code
set fileformats=unix,dos,mac
" Keep cursor position even if rect or triangle symbol exists
if exists('&ambiwidth')
  set ambiwidth=double
endif

