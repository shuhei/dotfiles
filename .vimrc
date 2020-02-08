let mapleader = ","

"===============================
" Dein
"===============================
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  let s:toml_path = '~/.vim/rc/dein.toml'
  let s:toml_lazy_path = '~/.vim/rc/deinlazy.toml'
  call dein#begin('~/.cache/dein', [$MYVIMRC, s:toml_path, s:toml_lazy_path])
  call dein#load_toml(s:toml_path, { 'lazy': 0 })
  call dein#load_toml(s:toml_lazy_path, { 'lazy': 1 })
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Clean up unused plugins
command! DeinClean call s:dein_clean()
function s:dein_clean()
	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endfunction

source ~/.vim/rc/plugins.rc.vim

filetype plugin indent on

"===============================
" General Config
"===============================
syntax on

set number

" Show messages in English.
set langmenu=en_US
let $LANG = 'en_US'

" Enable true colors
if (has("termguicolors"))
  set termguicolors
endif

" colorscheme dracula
" let g:gruvbox_contrast_dark="hard"
" colorscheme gruvbox
colorscheme nord
" let ayucolor="light"
" let ayucolor="mirage"
" let ayucolor="dark"
" colorscheme ayu
" set background=light
" colorscheme PaperColor

highlight htmlH1 term=underline ctermfg=228 guifg=#f6f080
highlight htmlH2 term=underline ctermfg=228 guifg=#f6f080
highlight htmlH3 term=underline ctermfg=228 guifg=#f6f080
highlight htmlH4 term=underline ctermfg=228 guifg=#f6f080
highlight htmlH5 term=underline ctermfg=228 guifg=#f6f080
highlight htmlH6 term=underline ctermfg=228 guifg=#f6f080

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

set cursorline

" Do not stop cursor on line head or end
set whichwrap=b,s,h,l,<,>,[,]

" Use clipboard (cross-platform)
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard^=unnamed,unnamedplus

" Search
set ignorecase
set smartcase
set hlsearch

" Exclude some symbols from keyword so that you can use `cw` nicely.
set iskeyword-=.

" To fix slow syntax highlighting on ruby files, use the older regexp engine.
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1

"===============================
" File types
"===============================
autocmd BufRead,BufNewFile *.es6 set filetype=javascript
autocmd BufRead,BufNewFile *.js.flow set filetype=javascript
" Make plugins for javascript/typescript work for .jsx/.tsx.
" Some plugins work only with javascript/typescript filetypes instead of
" javascriptreact/typescriptreact, which Vim sets by default.
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx

" Show help in a vertical split
" https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window
autocmd FileType help wincmd H

"===============================
" File specific indentation
"===============================
autocmd FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType make setlocal noexpandtab

"===============================
" Spell check
"===============================
" http://robots.thoughtbot.com/vim-spell-checking
" Use `zg` to add words to the dictionary.
set spelllang=en_us,cjk
set complete+=kspell
autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
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

" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <Leader>hl :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
