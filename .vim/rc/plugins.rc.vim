if dein#tap('vimfiler.vim')
  let g:vimfiler_as_default_explorer = 1
  nnoremap <leader>f :VimFilerExplorer<CR>
endif

if dein#tap('coc.nvim')
  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  let g:coc_global_extensions =
    \ [
    \   'coc-prettier',
    \   'coc-tsserver',
    \   'coc-json',
    \   'coc-css',
    \   'coc-rls',
    \   'coc-yaml',
    \ ]
endif

if dein#tap('vim-endwise')
  " To avoid breaking <cr> with coc.nvim.
  " https://github.com/neoclide/coc.nvim/issues/617
  let g:endwise_no_mappings = 1
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
  " Turn this off if markdown editing is unbearably slow.
  " https://thoughtbot.com/blog/profiling-vim
  let g:markdown_fenced_languages =
      \ [
      \   'viml=vim',
      \   'bash=sh',
      \   'sh',
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

if dein#tap('open-browser.vim')
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
	nmap gx <Plug>(openbrowser-smart-search)
	vmap gx <Plug>(openbrowser-smart-search)
endif

if dein#tap('json5.vim')
  autocmd BufRead,BufNewFile .babelrc set filetype=json5
endif

if dein#tap('jsonc.vim')
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
  autocmd BufRead,BufNewFile coc-setttings.json set filetype=jsonc
endif
