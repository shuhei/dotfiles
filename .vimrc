"===============================
" Utils
"===============================
function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

"===============================
" Vundle
"===============================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
call s:source_rc('bundle.rc.vim')
call vundle#end()
filetype plugin indent on

"===============================
" General Config
"===============================
syntax on

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp,ucs-2le,ucs-2,cp932

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set number

let mapleader = ","

" Cursor
autocmd InsertLeave * set cul
autocmd InsertEnter * set nocul

" Do not stop cursor on line head or end
set whichwrap=b,s,h,l,<,>,[,]

" Use clipboard
set clipboard+=unnamed

" colorscheme random
colorscheme asu1dark

"===============================
" Spell check
"===============================
" http://robots.thoughtbot.com/vim-spell-checking
" Use `zg` to add words to the dictionary.
set spelllang=en_us,cjk
set complete+=kspell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

"===============================
" Load rc files.
"===============================
call s:source_rc('plugins.rc.vim')
call s:source_rc('tabline.rc.vim')
