if dein#tap('vimfiler.vim')
  let g:vimfiler_as_default_explorer = 1
  nnoremap <Leader>f :VimFilerExplorer<CR>
endif

if dein#tap('neocomplete.vim')
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
endif

if dein#tap('neosnippet.vim')
  " <TAB>: completion.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
endif

if dein#tap('nerdcommenter')
  let NERDSpaceDelims = 1
endif

if dein#tap('syntastic')
  " http://qiita.com/yuku_t/items/0ac33cea18e10f14e185
  let g:syntastic_mode_map =
    \ {
    \   'mode': 'active',
    \ }
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_check_on_wq = 0

  let g:syntastic_ignore_files = ['\m/db/schema\.rb']

  let g:syntastic_ruby_checkers = ['mri', 'rubocop']

  let g:syntastic_javascript_jscs_args = '--preset=google'
  let g:syntastic_javascript_checkers = ['jscs', 'eslint']

  let g:syntastic_html_tidy_ignore_errors =
    \ [
    \   'proprietary attribute "ng-',
    \   'proprietary attribute "dk-',
    \   'proprietary attribute "ui-'
    \ ]
endif

if dein#tap('switch.vim')
  autocmd FileType ruby let b:switch_custom_definitions =
    \ [
    \   ['to', 'not_to']
    \ ]

  nnoremap - :Switch<cr>
endif

if dein#tap('vim-markdown')
  let g:vim_markdown_folding_disabled = 1

  if has('persistent_undo')
    set noundofile
  endif
endif

if dein#tap('goyo.vim')
  nnoremap <Leader><Space> :Goyo<CR>
endif

if dein#tap('vim-fugitive')
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
endif

if dein#tap('gitv')
  nnoremap <Leader>gv :Gitv<CR>
endif

if dein#tap('vim-airline')
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
endif

if dein#tap('vim-quickrun')
  " http://d.hatena.ne.jp/osyo-manga/20130311/1363012363
  " http://shirusu-ni-tarazu.hatenablog.jp/entry/2012/04/17/090805
  let g:quickrun_config =
    \ {
    \   '_': {
    \     'runner': 'vimproc',
    \     'runner/vimproc/updatetime': 60,
    \     'outputter/buffer/into': 1
    \   },
    \   'ruby.rspec': {
    \     'command': './bin/rspec'
    \   },
    \   'cucumber': {
    \     'command': './bin/rspec'
    \   },
    \   'scheme': {
    \     'command': 'scheme',
    \     'exec': '%c < %s'
    \   }
    \ }
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

  augroup RSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  augroup END
endif

if dein#tap('unite.vim')
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
endif

if dein#tap('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 1
endif

if dein#tap('vim-jours')
  let g:jours_dir = '~/notes'
endif

if dein#tap('javascript-libraries-syntax')
  let g:used_javascript_libs = 'underscore,angularjs,jasmine'
endif

if dein#tap('ctrlp.vim')
  " https://github.com/kien/ctrlp.vim/issues/58
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  nnoremap <C-o> :CtrlPClearAllCaches<CR>
endif

if dein#tap('vim-easy-align')
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
endif

if dein#tap('vim-jsdoc')
  nnoremap <Leader>d :JsDoc<CR>
endif

if dein#tap('incsearch.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif

if dein#tap('vim-better-whitespace')
  let g:better_whitespace_filetypes_blacklist = ['vimfiler']
endif

if dein#tap('vim-merginal')
  nnoremap <Leader>m :Merginal<CR>
endif

if dein#tap('vim-pencil')
  let g:pencil#wrapModeDefault = 'soft'

  augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init({'wrap': 'hard'})
  augroup END
endif

if dein#tap('rainbow')
  let g:rainbow_active = 1
  " https://github.com/luochen1990/rainbow/blob/master/README.md
  let g:rainbow_conf = {
  \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \   'operators': '_,_',
  \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold']
  \}
endif
