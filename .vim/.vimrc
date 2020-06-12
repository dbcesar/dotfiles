set encoding=utf-8
" Requirements for use Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set plugins to runtimepath
set rtp^=~/.vim/plugin/amake.vim
set rtp^=~/.vim/plugin/DoxygenToolkit.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb' "extension to fugitive to use Gbrowser on github
Plugin 'shumphrey/fugitive-gitlab.vim' "extension to fugitive to use Gbrowser on gitlab
Plugin 'Valloric/YouCompleteMe'
Plugin 'L9'   " Required by FuzzyFinder 
Plugin 'FuzzyFinder'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'cespare/vim-toml' " enhance toml files
Plugin 'maralla/vim-toml-enhance' " enhance toml files
Plugin 'leafgarland/typescript-vim' " enhance typescript files
Plugin 'derekwyatt/vim-fswitch' " plugin for alternate between header and source files

" for ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" YouCompleteMe configurations
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0

" Ultisnip config (compatible with ycm)
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


"Personal configurations
"
imap jj <Esc> " maps jj to escape the insert mode
nnoremap ff :YcmCompleter GoTo<CR>
nnoremap fi :YcmCompleter FixIt<CR>
nnoremap ft :YcmCompleter GetType<CR>
nnoremap fs :FSHere<CR>
nnoremap fb :b#<cr>

"Vim Fugitive maps
nnoremap gs :Gstatus<CR>
nnoremap gb :Gblame<CR>

" load buffers
nnoremap fl :buffers<CR>:buffer<Space>
" Remove all trailing whitespace by pressing fs
nnoremap fr :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" vim FuzzyFinder
nnoremap <F4> :FufFile **/<CR>

set tabstop=4
set shiftwidth=4
set expandtab

set ai "auto indent
set si "smart indent
set wrap "Wrap lines

" Search
set ignorecase      " Do case insensitive matching
set smartcase       " Fall back to case sensitive if search pattern has a upper case character
set incsearch       " Incremental search
set hlsearch        " Highlight search
map <F10> :nohlsearch<CR>   " Temporarily disable highlighting, reenabled for the next search

"highliht the characters after the 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
augroup END
" need to aplly both color schems to achieve what I liked. They isolated are
" not as good as combined :)
silent! colorscheme minimalist
silent! colorscheme afterglow
" for working under sunlight
" silent! colorscheme mayansmoke

set number
" set cursorline
" hi CursorLine ctermbg=grey
"
" autocmd InsertEnter * set nocursorline
" autocmd InsertLeave * set cursorline

syntax on
filetype on
au BufNewFile,BufRead *.orogen set filetype=ruby

" Change the command line autocompletion when tab is pressed. This
" will complete as much as possible when tab is first hit instead of
" automatically autocomplete even with multiple matches
set wildmode=longest:full,full
set wildmenu

" Automaticall set the spell check and the make program for .tex files
autocmd Filetype tex set makeprg=pdflatex | set spell spelllang=en_us
" Makes vimgrep to ignore build folder
set wildignore+=build/**

" Nerdtree configuration
" Open automatically
" autocmd vimenter * NERDTree
" Open automatically if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Activate Deactivate (Ctrl+n)
map <C-n> :NERDTreeToggle<CR>
" Close vim if nerdtree is the only tab

" Set fugitive-gitlab.vim for private repo
let g:fugitive_gitlab_domains = ['https://gitlab.krakensonar.com']
