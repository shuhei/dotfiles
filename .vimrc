" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'AndrewRadev/switch.vim'
Plugin 'AndrewRadev/vim-eco'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'amix/vim-zenroom2'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'derekwyatt/vim-scala'
Plugin 'elzr/vim-json'
Plugin 'eudisd/vim-csapprox'
Plugin 'flazz/vim-colorschemes'
Plugin 'groenewege/vim-less'
Plugin 'hspec/hspec.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'junegunn/goyo.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()
filetype plugin indent on

syntax on

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

" Cursor
autocmd InsertLeave * set cul
autocmd InsertEnter * set nocul

" Use clipboard
set clipboard+=unnamed

" colorscheme random
colorscheme asu1dark

" vimfiler
let g:vimfiler_as_default_explorer = 1

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

" http://kazuph.hateblo.jp/entry/2013/01/19/193745
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" neosnippet
let g:neosnippet#snippets_directory = "~/.vim/snippets/"

" nerdcommenter
let NERDSpaceDelims = 1

" syntastic
" http://qiita.com/yuku_t/items/0ac33cea18e10f14e185
let g:sysntastic_mode_map =
  \ {
  \   'mode': 'passive',
  \   'active_filetypes': ['ruby']
  \ }
let g:syntastic_ruby_checkers = ['rubocop']

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
