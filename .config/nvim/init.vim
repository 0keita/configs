set nocompatible               " Be iMproved
filetype off                   " Required!

if 0 | endif

" dein
if has('vim_starting')
	if &compatible
		set nocompatible
	endif
	" Add the dein installation directory into runtimepath
	set runtimepath+=~/.config/nvim/.dein/repos/github.com/Shougo/dein.vim

	if dein#load_state('~/.config/nvim/.dein')
		call dein#begin('~/.config/nvim/.dein')

		call dein#add('~/.config/nvim/.dein/repos/github.com/Shougo/dein.vim')

    " General
    "" color theme
    ""call dein#add('ayu-theme/ayu-vim')

    "" highlighted in yank
    call dein#add('machakann/vim-highlightedyank')
    let g:highlightedyank_highlight_duration = 80

    "" remove trailing whitespace
    call dein#add('bronson/vim-trailing-whitespace')
    nnoremap <silent>,dsp :FixWhitespace<CR>

    "" smart replace
    call dein#add('tpope/vim-abolish')

    " File
    "" FileTree
    call dein#add('preservim/nerdtree')
    nnoremap <silent><C-e> :NERDTreeToggle<CR>

    "" Unite
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    let g:unite_enable_start_insert = 1
    let g:unite_enable_split_vertically = 0
    let g:unite_winwidth = 40
    nnoremap <silent> ,um :<C-u>Unite file_mru -tab <CR>
    nnoremap <silent> ,uf :<C-u>Unite file_rec -tab <CR>

    " Git
    "" git command
    call dein#add('tpope/vim-fugitive')

    "" READ_LATER : https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
    " grep検索の実行後にQuickFix Listを表示する
    autocmd QuickFixCmdPost *grep* cwindow
    au FileType fugitiveblame nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
    nnoremap <silent>gn :cn<CR>
    nnoremap <silent>gp :cp<CR>
    let QFix_Edit = 'tab'
    let QFix_PreviewEnable = 1
    nnoremap <silent> :gg :Ggrep

    " development
    "" comment out
    call dein#add('tomtom/tcomment_vim')

    "" surround
    call dein#add('tpope/vim-surround')

    " Ruby
    "" jump to `end`
    call dein#add('vim-scripts/ruby-matchit')
    call dein#add('ftdetect/ruby.vim')
    call dein#add('indent/ruby.vim')

    if ((has('nvim')) && has('python3')) && system('pip3 show neovim') !=# ''
      call dein#add('Shougo/deoplete.nvim')
			let g:deoplete#enable_at_startup = 1
      let g:python3_host_prog = system('which python')
      call dein#add('Shougo/neosnippet.vim')
      call dein#add('Shougo/neosnippet-snippets')

      let g:neosnippet#enable_snipmate_compatibility = 1
      call dein#add('Shougo/deoplete-rct')
      call dein#add('fishbullet/deoplete-ruby')
      if system('which neovim-ruby-host') !=# ''
        let g:ruby_host_prog = system('which neovim-ruby-host')
      endif

      call dein#add('osyo-manga/vim-monster')
      let g:monster#completion#rcodetools#backend = "async_rct_complete"
      let g:deoplete#sources#omni#input_patterns = {
        \ "ruby" : '[^. *\t]\.\w*\|\h\w*::',
        \}

      " Plugin key-mappings.
      imap <C-k>     <Plug>(neosnippet_expand_or_jump)
      smap <C-k>     <Plug>(neosnippet_expand_or_jump)
      xmap <C-k>     <Plug>(neosnippet_expand_target)

      " SuperTab like snippets behavior.
      imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
      smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
       \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"

      " For snippet_complete marker.
      if has('conceal')
        set conceallevel=2 concealcursor=i
      endif
    elseif has('lua')
      call dein#add('Shougo/neocomplete.vim')
      let g:neocomplete#enable_at_startup = 1
      inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    endif

    "" add 'end' automatically
    call dein#add('tpope/vim-endwise')

    " method jump
    "" TODO
    call dein#add('universal-ctags/ctags')
    augroup AlpacaTags
      autocmd!
      if exists(':Tags')
        autocmd BufWritePost Gemfile TagsBundle
        autocmd BufEnter * TagsSet
        autocmd BufWritePost * TagsUpdate
      endif
    augroup END

    "" toggle true/false
    call dein#add('AndrewRadev/switch.vim')
    let g:switch_mapping="!"
    autocmd FileType ruby let b:switch_custom_definitions =
      \ [
      \   {
      \     'true': 'false',
      \     'present?': 'blank?',
      \     'blank?': 'present?',
      \     '&&': '||',
      \     'if': 'unless',
      \     'unless': 'if',
      \     ':\(\k\+\)\s\+=>': '\1:',
      \     '\<\(\k\+\):': ':\1 =>',
      \     'should ': 'should_not ',
      \   },
      \ ]

    " slim file
    "" slim syntax highlighting for vim.
    call dein#add('slim-template/vim-slim.git')

    "" indent補助
    call dein#add('nathanaelkane/vim-indent-guides')
    if expand("%:t") =~ ".*\.slim"
      let g:indent_guides_auto_colors=0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=248
      let g:indent_guides_enable_on_vim_startup=1
      let g:indent_guides_guide_size=1
    endif

		if !has('nvim')
			call dein#add('roxma/nvim-yarp')
			call dein#add('roxma/vim-hug-neovim-rpc')
		endif

		call dein#end()
		call dein#save_state()
	endif
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" dein end

set number
set hlsearch
set incsearch

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" 検索の時の対象の大文字小文字の区別
set ignorecase
set smartcase

set wildmenu
set wildmode=full
set pastetoggle=,v

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
if expand("%:t") =~ ".*\.rb"
  inoremap # #{}<LEFT>
endif

"color theme
syntax enable

if (has("termguicolors"))
 set termguicolors
endif
colorscheme tender
""hi Normal guibg=NONE ctermbg=NONE

" for vim practice
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
