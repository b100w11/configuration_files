" Patrick Corrigan's VIMRC
" Last modified Sunday March 17th 2013

" ================ General =====================================================
set t_Co=256
set modelines=0
set nocompatible
set backspace=2
set hidden
set shortmess+=I


" ================ Wrapping  ===================================================
set textwidth=80
set colorcolumn=+1

" ================" Search======================================================
"set foldmethod=syntax
" ================ Search  =================================

" ================ Backups =================================
set backupdir=~/.vim/vimfiles/backup
set directory=~/.vim/vimfiles/temp

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup

"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" ================ Status ==================================
set number "Line numbers
set ruler
set laststatus=2 "Always keeps the status bar active
set showcmd

" ================ Syntax Highlighting =====================
syntax on
filetype plugin on

" ================ Tabs ====================================
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" ================ Pathogen ================================
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'sandeepravi/refactor-rails.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'wikitopian/hardmode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'chrisbra/csv.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" ================ Colour Scheme ===========================
set background=dark
colorscheme solarized

" ================ Leader Commands =========================
let mapleader = ","
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>P "+P<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>; :b #<CR>
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>

let g:airline_powerline_fonts=1
let g:ctrlp_by_filename=1
" let g:airline#extensions#tabline#enabled = 1

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

if has("autocmd")
    filetype indent on
endif
imap jf <Esc>
cmap jf <Esc> 
" let g:EclimCompletionMethod = 'omnifunc'
imap <C-K> <Plug>snipMateNextOrTrigger
