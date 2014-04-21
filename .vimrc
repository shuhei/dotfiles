execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

set termencoding=utf-8
set encoding=utf-8

set fileencodings=iso-2022-jp,utf-8,euc-jp,ucs-2le,ucs-2,cp932

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set number

let mapleader = ","

colorscheme vividchalk

" nerdcommenter
let NERDSpaceDelims = 1

" switch.vim
autocmd FileType ruby let b:switch_custom_definitions =
  \ [
  \   ['to', 'not_to']
  \ ]

nnoremap - :Switch<cr>

" vim-markdown
let g:vim_markdown_folding_disabled=1

if has('persistent_undo')
  set noundofile
endif

" Do not stop cursor on line head or end
set whichwrap=b,s,h,l,<,>,[,]

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
