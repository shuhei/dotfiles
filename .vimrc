"===============================
" Utils
"===============================
function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

"===============================
" NeoBundle
"===============================
if has('vim_starting')
  set nocompatible
  set rtp+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
call s:source_rc('bundle.rc.vim')
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"===============================
" General Config
"===============================
syntax on

set number

let mapleader = ","

" Use `colorscheme random` to look for new theme.
colorscheme asu2dark

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

" Search
set ignorecase
set smartcase
set hlsearch

" Exclude underscore from keyword so that you can use `cw` nicely.
set iskeyword-=_

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

" New tab
nnoremap <Leader>t :tabnew<CR>

"===============================
" Journal
"===============================
" TODO: Extract as a Vim plugin.
" TODO: Add config for file name format.
let g:journal_dir = '$HOME/notes'

function g:journal_today_path()
  let l:today = strftime("%Y%m%d")
  return g:journal_dir . '/' . l:today . '.md'
endfunction

command! JournalEditToday execute 'edit' g:journal_today_path()
command! JournalWriteToday execute 'write' g:journal_today_path()
command! JournalSaveToday execute 'save' g:journal_today_path()
command! JournalCd execute 'cd' g:journal_dir

"===============================
" Load rc files.
"===============================
call s:source_rc('plugins.rc.vim')
