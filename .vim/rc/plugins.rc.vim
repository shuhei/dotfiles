if dein#tap('vimfiler.vim')
  let g:vimfiler_as_default_explorer = 1
  nnoremap <leader>f :VimFilerExplorer<CR>
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

if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? deoplete#close_popup() : "\<CR>"
  endfunction
  " http://blog.muuny-blue.info/c95d62c68196b2d0c1c1de8c7eeb6d50.html#deopletenvim
  " <TAB>: completion
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()
  function! s:check_back_space() abort "{{{
    let col = col(".") - 1
    return !col || getline('.')[col - 1] =~ '\s'
  endfunction"}}}
  " <S-TAB>: completion back
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  " <BS>: close popup
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
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
  " https://github.com/ElmCast/elm-vim
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1

  let g:syntastic_ignore_files = ['\m/db/schema\.rb']
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']

  let g:syntastic_javascript_checkers = ['eslint', 'flow']

  " To use custom elements and attributes in Angular and WebComponents.
  let g:syntastic_html_tidy_ignore_errors =
    \ [
    \   '> is not recognized!',
    \   'proprietary attribute "',
    \   'discarding unexpected <'
    \ ]
endif

if dein#tap('switch.vim')
  autocmd FileType ruby let b:switch_custom_definitions =
    \ [
    \   ['to', 'not_to']
    \ ]
  " https://gist.github.com/othree/5655583
  let g:switch_custom_definitions =
      \ [
      \   {
      \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
      \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
      \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
      \     '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
      \     '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
      \   }
      \ ]

  nnoremap - :Switch<CR>
endif

if dein#tap('vim-markdown')
  let g:markdown_fenced_languages =
      \ [
      \   'viml=vim',
      \   'bash=sh',
      \   'js=javascript',
      \   'rb=ruby',
      \   'hs=haskell'
      \ ]

  if has('persistent_undo')
    set noundofile
  endif
endif

if dein#tap('goyo.vim')
  nnoremap <leader><Space> :Goyo<CR>
endif

if dein#tap('vim-fugitive')
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>
  nnoremap <leader>gb :Gblame<CR>
  nnoremap <leader>ge :Gedit<CR>
  nnoremap <leader>ges :Gsplit<CR>
  nnoremap <leader>gev :Gvsplit<CR>
  nnoremap <leader>get :Gtabedit<CR>
  nnoremap <leader>gm :Gmove<CR>
  nnoremap <leader>gr :Gremove<CR>
  nnoremap <leader>gbr :Gbrowse<CR>
  nnoremap <leader>gd :Gdiff<CR>

  " http://stackoverflow.com/questions/21931116/getting-git-grep-to-work-effectively-in-vim
  command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
  nnoremap <leader>gg :Ggr <cword><CR>
endif

if dein#tap('gitv')
  nnoremap <leader>gv :Gitv<CR>
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
  nmap <leader>u [unite]

  " files
  nnoremap <silent> [unite]f :<C-u>Unite file_rec/async -buffer-name=files<CR>
  " tabs
  nnoremap <silent> [unite]t :<C-u>Unite tab -buffer-name=tabs<CR>
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
  nnoremap <leader>d :JsDoc<CR>
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
  nnoremap <leader>m :Merginal<CR>
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

" http://www.stephendiehl.com/posts/vim_2016.html
if dein#tap('ghcmod-vim')
  autocmd FileType haskell nnoremap <buffer> tt :GhcModType<CR>
  autocmd FileType haskell nnoremap <buffer> tc :GhcModTypeClear<CR>
  autocmd FileType haskell nnoremap <buffer> ti :GhcModTypeInsert<CR>
  autocmd FileType haskell nnoremap <buffer> ts :GhcModSplitFunCase<CR>
  autocmd FileType haskell nnoremap <buffer> tf :GhcModInfo<CR>
  autocmd FileType haskell nnoremap <buffer> tp :GhcModInfoPreview<CR>
endif

if dein#tap('elm-vim')
  let g:elm_syntastic_show_warnings = 1
  let g:elm_format_autosave = 1
  let g:elm_format_fail_silently = 0
endif

if dein#tap('vim-tmux-navigator')
  nnoremap <silent> <C-w>h :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-w>j :TmuxNavigateDown<CR>
  nnoremap <silent> <C-w>k :TmuxNavigateUp<CR>
  nnoremap <silent> <C-w>l :TmuxNavigateRight<CR>
endif

if dein#tap('vim-flow')
  let g:flow#enable = 0
  let g:flow#omnifunc = 0

  autocmd FileType javascript nnoremap <buffer> <leader>t :FlowType<CR>
  autocmd FileType javascript nnoremap <buffer> td :FlowJumpToDef<CR>
  autocmd FileType javascript nnoremap <buffer> tm :FlowMake<CR>
endif

if dein#tap('ale')
  let g:airline#extensions#ale#enabled = 1
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  let g:ale_linters_explicit = 1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint', 'prettier'],
  \}
  nmap <silent> <leader>N <Plug>(ale_previous_wrap)
  nmap <silent> <leader>n <Plug>(ale_next_wrap)
  " Toggle fixer
  " https://github.com/w0rp/ale/issues/1353#issuecomment-424677810
  command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
endif

if dein#tap('tsuquyomi')
  let g:tsuquyomi_completion_detail = 1

  autocmd FileType typescript nnoremap <buffer> td :TsuDefinition<CR>
  autocmd FileType typescript nnoremap <buffer> tsd :TsuSplitDefinition<CR>
  autocmd FileType typescript nnoremap <buffer> tt :TsuTypeDefinition<CR>
  autocmd FileType typescript nnoremap <buffer> tst :TsuSplitTypeDefinition<CR>
  autocmd FileType typescript nnoremap <buffer> tb :TsuGoBack<CR>
  autocmd FileType typescript nnoremap <buffer> tr :TsuReferences<CR>
  autocmd FileType typescript nnoremap <buffer> <leader>tr :TsuRenameSymbol<CR>
  autocmd FileType typescript nnoremap <buffer> <leader>trc :TsuRenameSymbolC<CR>
  " Show a type hint
  autocmd FileType typescript nnoremap <buffer> <leader>t : <C-u>echo tsuquyomi#hint()<CR>
	" Remap omni completion
	" TODO: Should I move this to global config?
  autocmd FileType typescript inoremap <buffer> <C-Space> <C-x><C-o>
endif

if dein#tap('FlyGrep.vim')
  " Map FlyGrep to <C-/>
  " https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
  nnoremap <C-_> :FlyGrep<cr>
endif
