set encoding=utf-8
" Requirements for use Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'L9'   " Required by FuzzyFinder 
Plugin 'FuzzyFinder'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" YouCompleteMe configurations
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0
" goto the reference file
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jf :YcmCompleter FixIt<CR>


"Personal configurations
"
"maps jj to escape the insert mode
imap jj <Esc>

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

" load buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" vim FuzzyFinder
nnoremap <F4> :FufFile **/<CR>
" Remove all trailing whitespace by pressing F6
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Change the current window path to current file's path
nnoremap <F3> :lcd %:p:h <CR>

"highliht the characters after the 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
colorscheme lucius
LuciusDark

set number
" set cursorline
" hi CursorLine ctermbg=grey
"
" autocmd InsertEnter * set nocursorline
" autocmd InsertLeave * set cursorline

syntax on
filetype on
au BufNewFile,BufRead *.orogen set filetype=ruby

" Implement automatic generator of for-loops
inoremap FOR<CR> for(uint i = 0; XXX; i++)<CR>{<CR><CR>}<ESC>2<UP>4b

" Change the command line autocompletion when tab is pressed. This
" will complete as much as possible when tab is first hit instead of
" automatically autocomplete even with multiple matches
set wildmode=longest:full,full
set wildmenu

" Automaticall set the spell check and the make program for .tex files
autocmd Filetype tex set makeprg=pdflatex | set spell spelllang=en_us
