" My .vimrc
" Created by Andrew C. Pacífico <andrewcpacifico@gmail.com>

" Define <leader> key
let mapleader= ","

" Vundle configuration
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
"  " required! 
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" original repos on github
"  Plugin 'tpope/vim-fugitive'

" vim-scripts repos
" Plugin 'L9'

" non github repos
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (ie. when working on your own plugin)
" Plugin 'file:///Users/gmarik/path/to/plugin'

" Surround
Plugin 'tpope/vim-surround'

" Autoclose parenthesis, brackets etc
"Plugin 'Townk/vim-autoclose'
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

"Sparkup
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" PHP Syntax
Plugin 'StanAngeloff/php.vim'

" HTML5 Syntax
Plugin 'othree/html5.vim'

" CSS3 Syntax
Plugin 'hail2u/vim-css3-syntax'

" Colorschemes
Plugin 'tomasr/molokai'

" Make gvim-only colorschemes work transparently in terminal vim
Plugin 'godlygeek/csapprox'

" Block indentation highlight
Plugin 'Yggdroot/indentLine'


" CtrlP
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|.git)$'

" Snippet Plugin
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-j>'
let g:snips_author='Andrew C. Pacifico <andrewpacifico@neemu.com>'

" Snippets
Plugin 'honza/vim-snippets'

" NERDTree
Plugin 'scrooloose/nerdtree'
" Open NERDTree automatically when vim starts up if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowHidden=0 " Show Hidden Files
nnoremap <leader>nt :NERDTreeToggle<cr>

" Temporarily removed because of performance issues
" Plugin 'scrooloose/syntastic'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1 "Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' "Show just the file name
let g:airline#extensions#tabline#show_buffers = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required!

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" My Vim options

" Define default file encoding
set encoding=utf-8

set nowrap

set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

" Enable Syntax Highlighting
syntax on
" Syntax highlighting only until 120º column, to speed up vim
set synmaxcol=120

" Show cursor position
set ruler

" Highlight current line
set cursorline

" Replace tabs with spaces "
set expandtab

" Make tabs 4 spaces wide "
set tabstop=4
set shiftwidth=4

" If I am in an indented block of code, keep the indentation level when I "
" press enter "
set autoindent

" Show line numbers "
set number

" Highlight column 81 to help keep lines of code 80 characters or less "
set colorcolumn=81

" Sets colorscheme
"set background=dark
"let g:molokai_original = 1
colorscheme molokai

" Keybindings
"
" Save files
inoremap <leader>s <Esc>:w<CR>i
nnoremap <leader>s :w<cr>

" Edit .vimrc in split mode
nnoremap <leader>ev :rightbelow vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Exit insert mode
inoremap jk <esc>l
inoremap <esc> <nop>

" Some buffer configurations
"
set hidden

" Switch buffers
nnoremap <leader><Tab> :bnext<cr>
nnoremap <leader><S-Tab> :bprevious<cr>

nnoremap <leader>1 :call BufferNumbered(1)<cr>
nnoremap <leader>2 :call BufferNumbered(2)<cr>
nnoremap <leader>3 :call BufferNumbered(3)<cr>
nnoremap <leader>4 :call BufferNumbered(4)<cr>
nnoremap <leader>5 :call BufferNumbered(5)<cr>
nnoremap <leader>6 :call BufferNumbered(6)<cr>
nnoremap <leader>7 :call BufferNumbered(7)<cr>
nnoremap <leader>8 :call BufferNumbered(8)<cr>
nnoremap <leader>9 :call BufferNumbered(9)<cr>

" Close current buffer and switch to previous
nnoremap <leader>bq :bp <bar> bd #<cr>

" Commenting blocks of code.
autocmd FileType c,cpp,javcala,php,javascript,scss let b:comment_leader = '// '
autocmd FileType cfg,sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Override syntax highlight on phpDoc blocks
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Jump to a numbered buffer
function! BufferNumbered(num)
    execute ':bfirst'
    let c = a:num - 1

    while c > 0
        execute ':bnext'
        let c -= 1
    endwhile
endfunction

" Custom line right margin for different type of files
autocmd FileType html setlocal cc=121
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal shiftwidth=2

" Custom tab size for javascript files
autocmd FileType javascript setlocal tabstop=2
autocmd FileType javascript setlocal shiftwidth=2

" Custom tab size for css/scss files
autocmd FileType css setlocal tabstop=2
autocmd FileType css setlocal shiftwidth=2
autocmd FileType scss setlocal tabstop=2
autocmd FileType scss setlocal shiftwidth=2
