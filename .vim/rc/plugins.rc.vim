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
" <TAB>: completion.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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
  \   'mode': 'active',
  \ }
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_checkers = ['mri', 'rubocop']

let g:syntastic_javascript_jscs_args = '--preset=google'
let g:syntastic_javascript_checkers = ['jscs', 'eslint']

let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-', 'proprietary attribute "ui-']

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
nnoremap <Leader>gbr :Gbrowse<CR>
nnoremap <Leader>gd :Gdiff<CR>

" http://stackoverflow.com/questions/21931116/getting-git-grep-to-work-effectively-in-vim
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
nnoremap <Leader>gg :Ggr <cword><CR>

"===============================
" gitv
"===============================
nnoremap <Leader>gv :Gitv<CR>

"===============================
" vim-airline
"===============================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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
  \   },
  \   'cucumber': {
  \      'command': './bin/rspec'
  \   }
  \ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

"===============================
" Align.vim
"===============================
let g:Align_xstrlen = 3

"===============================
" unite.vim
"===============================
" http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/
" let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

nnoremap [unite] <Nop>
nmap <Leader>u [unite]

" file
nnoremap <silent> [unite]f :<C-u>Unite file -buffer-name=files<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep word under the cursor
nnoremap <silent> [unite]gc :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep again
nnoremap <silent> [unite]gr :<C-u>UniteResume search-buffer<CR>

" Use ag for unite grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_greo_recursive_opt = ''
endif

"===============================
" vim-indent-guides
"===============================
let g:indent_guides_enable_on_vim_startup = 1

"===============================
" jours
"===============================
let g:jours_dir = '~/notes'

"===============================
" previm
"===============================
let g:previm_open_cmd = 'open -a "Google Chrome"'

"===============================
" javascript-libraries-syntax
"===============================
let g:used_javascript_libs = 'underscore,angularjs,jasmine'

"===============================
" ctrlp
"===============================
let g:ctrlp_custom_ignore =
  \ {
  \  'dir': '\v[\/](coverage|node_modules|bower_components)$'
  \ }
nnoremap <C-o> :CtrlPClearAllCaches<CR>

"===============================
" vim-easy-align
"===============================
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"===============================
" vim-jsdoc
"===============================
nnoremap <Leader>d :JsDoc<CR>

"===============================
" incsearch.vim
"===============================
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"===============================
" vim-better-whitespace
"===============================
let g:better_whitespace_filetypes_blacklist = ['vimfiler']

"===============================
" vim-better-whitespace
"===============================
nnoremap <Leader>m :Merginal<CR>

"===============================
" vim-pencil
"===============================
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
