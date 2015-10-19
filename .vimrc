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

" HackLang Syntax
Plugin 'hhvm/vim-hack'

" Colorschemes
Plugin 'modess/vim-phpcolors'
Plugin 'baskerville/bubblegum'
Plugin 'tomasr/molokai'

" Make gvim-only colorschemes work transparently in terminal vim
Plugin 'godlygeek/csapprox'

" Java auto complete
Plugin 'javacomplete'

" Block indentation highlight
Plugin 'Yggdroot/indentLine'

" Snippets
Plugin 'honza/vim-snippets'

" Plugins that require any configurations
"

" CtrlP
Plugin 'kien/ctrlp.vim'

" Snippet Plugin
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-j>'
let g:snips_author='Andrew C. Pacifico <andrewpacifico@neemu.com>'

" NERDTree
Plugin 'scrooloose/nerdtree'
" Open NERDTree automatically when vim starts up if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowHidden=0 " Show Hidden Files
nnoremap <leader>nt :NERDTreeToggle<cr>

" PHP auto complete
Plugin 'shawncplus/phpcomplete.vim'
let g:phpcomplete_parse_docblock_comments = 1

"TagList
Plugin 'taglist.vim'
autocmd vimenter * if !argc() | TlistToggle | endif
nnoremap <leader>t :TlistToggle<CR>
let Tlist_Use_Right_Window=1 "Shows TagList on right
let Tlist_Sort_Type="name"
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_File_Fold_Auto_Close=1
"Choose which tags should be displayed in php files
let tlist_php_settings='php;c:Classes;f:Functions' 

Plugin 'scrooloose/syntastic'

" Airline
Plugin 'bling/vim-airline'
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1 "Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' "Show just the file name
let g:airline#extensions#tabline#show_buffers = 1
"let g:airline_powerline_fonts=1
"let g:airline_enable_branch=1
"let g:airline_enable_syntastic=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_detect_paste=1
"enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 1

" fugitive
Plugin 'tpope/vim-fugitive'

" Supertab
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabMappingForward = '<nul>'

" PDV: PhpDocGenerator
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
let g:pdv_cfg_Author = "Andrew C. Pacifico <andrewcpacifico@gmail.com>"
autocmd FileType php nnoremap <leader>gd :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <leader>gd :call PhpDocRange()<CR>

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

" Enable autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" Keybindings
"
" Ctrl+S to save files
inoremap <leader>s <Esc>:w<CR>i
nnoremap <leader>s :w<cr>

" Ctrl+C to copy selected text to clipboard
vnoremap <C-c> "+yi

" Ctrl+V to paste clipboard content
inoremap <C-v> <Esc> "+pi

" Ctrl+Z to undo changes
inoremap <C-z> <Esc>ui

" Ctrl+D to delete the selected line
"inoremap <C-d> <Esc>ddi
"nnoremap <C-d> dd

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

" Close current buffer and switch to previous
nnoremap <leader>bq :bp <bar> bd #<cr>

" Commenting blocks of code.
autocmd FileType c,cpp,javcala,php,javascript let b:comment_leader = '// '
autocmd FileType cfg,sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>a

" Override syntax highlight on phpDoc blocks
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
