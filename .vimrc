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

" Use clipboard
set clipboard+=unnamed

" Vundler
set nocompatible
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-sensible'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'
Bundle 'eudisd/vim-csapprox'
Bundle 'elzr/vim-json'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'derekwyatt/vim-scala'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdcommenter'
Bundle 'AndrewRadev/vim-eco'
Bundle 'amix/vim-zenroom2'
Bundle 'junegunn/goyo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'AndrewRadev/switch.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'hspec/hspec.vim'

filetype on

" colorscheme random
colorscheme asu1dark

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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

" goyo.vim
nnoremap <Leader><Space> :Goyo<CR>

" Do not stop cursor on line head or end
set whichwrap=b,s,h,l,<,>,[,]

"
" Tab line
" http://qiita.com/wadako111/items/755e753677dd72d8036d
"

function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]
    let no = i
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%' . i . 'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' .title
    let s .= mod
    let s .= '%#TabLineFill#'
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!' . s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

"
" Auto recognition of character encodings
"
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
