if dein#tap('vimfiler.vim')
  let g:vimfiler_as_default_explorer = 1
  nnoremap <leader>f :VimFilerExplorer<CR>
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

  " Use ale as the completion source for TypeScript
  " https://github.com/dense-analysis/ale#2iii-completion
  call deoplete#custom#option('sources', {
    \ 'typescript': ['ale']
    \})

  " <S-TAB>: completion back
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  " <BS>: close popup
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
endif

if dein#tap('nerdcommenter')
  let NERDSpaceDelims = 1
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

if dein#tap('vim-jours')
  let g:jours_dir = '~/notes'
endif

if dein#tap('fzf.vim')
  " Only files in Git
  nnoremap <C-p> :GFiles<CR>
  " All files
  nnoremap <C-a> :Files!<CR>
  " Git commit history
  nnoremap <C-c> :Commits!<CR>

  " https://github.com/junegunn/fzf.vim#example-git-grep-wrapper
  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
  nnoremap <C-g> :GGrep!<CR>
endif

if dein#tap('vim-easy-align')
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
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

  " autocmd FileType javascript nnoremap <buffer> <leader>t :FlowType<CR>
  " autocmd FileType javascript nnoremap <buffer> td :FlowJumpToDef<CR>
  " autocmd FileType javascript nnoremap <buffer> tm :FlowMake<CR>
endif

if dein#tap('ale')
  let g:airline#extensions#ale#enabled = 1
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1

  " Linters
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  " Only run linters named in ale_linters settings.
  let g:ale_linters_explicit = 1
  " Don't apply tsserver to JavaScript. It complains about Flow type
  " annotations. Use `:ALEInfo` to see available linters in JavaScript.
  let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow'],
  \ 'typescript': ['tsserver', 'eslint'],
  \ 'rust': ['rls', 'cargo'],
  \}
  " Rust:
  "   rustup component add rls rust-analysis rust-src rustfmt clippy
  " Use clippy as a cargo linter.
  let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

  " Fixers
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint', 'prettier'],
  \ 'typescript': ['eslint', 'prettier'],
  \ 'json': ['prettier'],
  \ 'yaml': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'rust': ['rustfmt'],
  \}

  " Go to the next/previous error/warning
  nmap <silent> <leader>n <Plug>(ale_next_wrap)
  nmap <silent> <leader>N <Plug>(ale_previous_wrap)

  " LSP features
  nmap <silent> <leader>h <Plug>(ale_hover)
  nmap <silent> <leader>r <Plug>(ale_find_references)
  nmap <silent> <leader>d <Plug>(ale_go_to_definition)
  nmap <silent> <leader>dv <Plug>(ale_go_to_definition_in_vsplit)
  " ale_go_to_definition* don't work with TypeScript...
  nmap <silent> <leader>t <Plug>(ale_go_to_type_definition)
  nmap <silent> <leader>tv <Plug>(ale_go_to_type_definition_in_split)

  " Toggle fixer
  " https://github.com/w0rp/ale/issues/1353#issuecomment-424677810
  command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
endif

if dein#tap('open-browser.vim')
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
	nmap gx <Plug>(openbrowser-smart-search)
	vmap gx <Plug>(openbrowser-smart-search)
endif
