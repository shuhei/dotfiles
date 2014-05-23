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

set number

let mapleader = ","

" Use `colorscheme random` to look for new theme.
colorscheme asu1dark

" Encoding
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp,ucs-2le,ucs-2,cp932

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Cursor
autocmd InsertLeave * set cul
autocmd InsertEnter * set nocul

" Do not stop cursor on line head or end
set whichwrap=b,s,h,l,<,>,[,]

" Use clipboard
set clipboard+=unnamed

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
" Mappings
"===============================
" Widen, narrow, heighten and shorten window.
" http://vim.wikia.com/wiki/Resize_splits_more_quickly
nnoremap <Leader>> :exe "vertical resize " . (winwidth(0) * 5 / 4)<CR>
nnoremap <Leader>< :exe "vertical resize " . (winwidth(0) * 4 / 5)<CR>
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 5 / 4)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 4 / 5)<CR>

"===============================
" Load rc files.
"===============================
call s:source_rc('plugins.rc.vim')
