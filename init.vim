" TODOS:
" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" https://github.com/bitboxer/dotfiles/blob/master/tilde/config/nvim/init.vim
" Add plugins with:
" :PlugInstall
"
"
"
""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set mouse=a           " Use mouse
set cursorline
set title
set noswapfile        " I don't like Swapfiles
set nobackup          " Don't make a backup before overwriting a file.
set nowritebackup     " As above
let mapleader=" "
"let g:python_host_prog = "/usr/bin/python"
"let g:loaded_python_provider = 1
"let g:python_host_skip_check = 1
"let g:python3_host_prog = "/usr/local/lib/python3.5"
""
"" Movement
""
nnoremap <S-k> 5k
nnoremap <S-j> 5j
nnoremap <S-L> W
nnoremap <S-h> B

nnoremap <S-Up> 5k
vnoremap <S-Up> 5k
nnoremap <S-Down> 5j
vnoremap <S-Down> 5j
nnoremap <S-Right> W
vnoremap <S-Right> W
nnoremap <S-Left> B
vnoremap <S-Left> B
nnoremap <Leader>. $
nnoremap <M-Right> $
nnoremap <Leader>, ^
nnoremap <D-Left> ^

nnoremap <Leader>d diw
nnoremap <Leader>c bye

" Move lines up and down with ALT+k\j
nnoremap √ :m .+1<CR>==
nnoremap ª :m .-2<CR>==
inoremap √ <Esc>:m .+1<CR>==gi
inoremap ª <Esc>:m .-2<CR>==gi
vnoremap √ :m '>+1<CR>gv=gv
vnoremap ª :m '<-2<CR>gv=gv


""
"" Plugins
""
call plug#begin('~/.config/nvim/plugged')

" Themes
" Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" Status bar at bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Search with Leader-ff
Plug 'eugen0329/vim-esearch'

" Git integration
Plug 'tpope/vim-fugitive'

"Plug 'slashmili/alchemist.vim'
" Code completetion | Doesnt work correctly Requires python3
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " let g:deoplete#enable_at_startup = 1
  " use tab for completion
  " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'ervandew/supertab'

" Language support
Plug 'sheerun/vim-polyglot'

" File browser. Start with :NERTDTreeToggle
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Vim navigation in Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" Vim navigation in Phoenix
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features

" Copy pase with QC, QP, QX
Plug 'NLKNguyen/copy-cut-paste.vim'

" Remove trailing whitespace with :FixWhitespace
Plug 'bronson/vim-trailing-whitespace'

" Multiple Cursors with Ctrl-n
Plug 'terryma/vim-multiple-cursors'

" Run Rails specs with leader-r | Doesnt seem to work properly
Plug 'skalnik/vim-vroom'

" lets you zoom into a window and out again using Ctrl-W o
Plug 'vim-scripts/ZoomWin'

" list, select and switch between buffers Leader-b
Plug 'jeetsukumaran/vim-buffergator'

" Fuzzy file opener with Ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

" Test runner
Plug 'janko-m/vim-test'

" Allows you to visually select increasingly larger regions of text using
Plug 'terryma/vim-expand-region'

call plug#end()

""
"" Theme
""

set background=dark
set syntax=on
colorscheme molokai

let NERDTreeHijackNetrw = 1
let g:NERDTreeWinPos = "right"
let g:airline_theme='simple'

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""
set hlsearch         " highlight matches
set incsearch        " incremental searching
set ignorecase       " searches are case insensitive...
set smartcase        " ... unless they contain at least one capital letter
map <CR> :noh<CR>    " stop highlighting on enter after search

""
"" Wild settings
""
" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

""
"" Deoplete
""
let g:deoplete#enable_at_startup = 1
" use tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""
"" NERDcommenter
""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Use ALT-c to toggle comment
nnoremap ç :call NERDComment(0,"toggle")<CR>
vnoremap ç :call NERDComment(0,"toggle")<CR>

