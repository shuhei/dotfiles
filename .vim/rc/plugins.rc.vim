"===============================
" vimfiler
"===============================
let g:vimfiler_as_default_explorer = 1
nnoremap <Leader>f :VimFilerExplorer<CR>

"===============================
" neocomplete
"===============================
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

"===============================
" neosnippet
"===============================
" http://kazuph.hateblo.jp/entry/2013/01/19/193745
" <TAB>: completion.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key mappings.
imap <C-f> <Plug>(neosnippet_expand_or_jump)
smap <C-f> <Plug>(neosnippet_expand_or_jump)
xmap <C-f> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory = "~/.vim/snippets/"

"===============================
" nerdcommenter
"===============================
let NERDSpaceDelims = 1

"===============================
" syntastic
"===============================
" http://qiita.com/yuku_t/items/0ac33cea18e10f14e185
let g:sysntastic_mode_map =
  \ {
  \   'mode': 'passive',
  \   'active_filetypes': ['ruby', 'coffee']
  \ }
let g:syntastic_ruby_checkers = ['rubocop']

"===============================
" switch.vim
"===============================
autocmd FileType ruby let b:switch_custom_definitions =
  \ [
  \   ['to', 'not_to']
  \ ]

nnoremap - :Switch<cr>

"===============================
" vim-markdown
"===============================
let g:vim_markdown_folding_disabled = 1

if has('persistent_undo')
  set noundofile
endif

"===============================
" goyo.vim
"===============================
nnoremap <Leader><Space> :Goyo<CR>

"===============================
" vim-fugitive
"===============================
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>ges :Gsplit<CR>
nnoremap <Leader>gev :Gvsplit<CR>
nnoremap <Leader>get :Gtabedit<CR>
nnoremap <Leader>gm :Gmove<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gg :Ggrep<CR>
nnoremap <Leader>gbr :Gbrowse<CR>
nnoremap <Leader>gd :Gdiff<CR>

"===============================
" vim-airline
"===============================
let g:airline#extensions#tabline#enabled = 1

"===============================
" vim-quickrun
"===============================
" http://d.hatena.ne.jp/osyo-manga/20130311/1363012363
" http://shirusu-ni-tarazu.hatenablog.jp/entry/2012/04/17/090805
let g:quickrun_config =
  \ {
  \   '_': {
  \      'runner': 'vimproc',
  \      'runner/vimproc/updatetime': 60,
  \      'outputter/buffer/into': 1
  \   },
  \   'ruby.rspec': {
  \      'command': './bin/rspec'
  \   }
  \ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  autocmd BufWinEnter,BufNewFile *.feature set filetype=ruby.rspec
augroup END
