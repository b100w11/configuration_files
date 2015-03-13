"  Patrick Corrigan's VIMRC
" Last modified Sunday May 16th 2014
"

" ================ General " ==============================================={{{
set mouse=
set spelllang=en_gb
set wildmenu
set wildmode=list:longest,full
set modelines=0
set nocompatible
set backspace=2
set hidden
set shortmess+=I
set undodir=~/.vim/undo
set undofile
set list listchars=tab:»·,trail:·,extends:❯,precedes:❮
set showbreak=↪
set cm=blowfish
"}}}

" ================ Wrapping  ==============================================={{{
set textwidth=79
set formatoptions+=t
" set colorcolumn=+1
set cursorline
set cursorcolumn
set nowrap
:match ErrorMsg '\%>79v.\+'
"}}}

" ================" Search ================================================={{{
set ignorecase
set incsearch
set hlsearch
set smartcase
"}}}

" ================ Backups ================================================={{{
set noswapfile
set backupdir=~/.vim/vimfiles/backup
set directory=~/.vim/vimfiles/temp

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup

"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
"}}}

" ================ Status =================================================={{{
set number "Line numbers
set ruler
set laststatus=2 "Always keeps the status bar active
set showcmd
"}}}

" ================ Syntax Highlighting ====================================={{{
filetype off
" syntax enable
filetype plugin indent on
"}}}

" ================ Tabs ===================================================={{{
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
"}}}

" ================ Vundle =================================================={{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" ================ Colorschemes ============================================{{{
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'tomasr/molokai'
Plugin 'romainl/Apprentice'
Plugin 'zefei/cake16'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'jeetsukumaran/vim-mochalatte'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'baeuml/summerfruit256.vim'
Plugin 'DAddYE/soda.vim'
Plugin 'vim-scripts/Cleanroom'
Plugin 'jnurmine/Zenburn'
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'
Plugin 'sjl/badwolf'
"}}}

" ================ Tpope ==================================================={{{
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
"}}}

" ================ IDE Like ================================================{{{
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'godlygeek/tabular'
Plugin 'edkolev/tmuxline.vim'
"Trying out no autocompletion
"Plugin 'Valloric/YouCompleteMe'
"}}}

" ================ Language specific ======================================={{{
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'ecomba/vim-ruby-refactoring'
"Plugin 'sandeepravi/refactor-rails.vim'
"Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fireplace'
Plugin 'ehamberg/vim-cute-python'
Plugin 'lervag/vim-latex'
"}}}

" ================ Improvements ============================================{{{
Plugin 'tmhedberg/matchit'
Plugin 'rking/ag.vim'
Plugin 'rm-hull/vim-locate'
Plugin 'bling/vim-airline'
Plugin 'sjl/gundo.vim'
"}}}

" ================ Miscellaneous ==========================================={{{
Plugin 'vim-scripts/vimwiki'
"Tying out no medium mode
" Plugin 'kbarrette/mediummode'
Plugin 'vim-scripts/sudo.vim'

"}}}
call vundle#end()
"}}}

" ================ Plugin Configuration ===================================={{{
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:rspec_command = "! bundle exec rspec --no-color {spec}"
" ================ Vim Wikki ==================================================
let wiki_1 = {}
let wiki_1.path = '~/documents/vimwiki'
let g:vimwiki_list = [wiki_1]
let NERDTreeShowBookmarks=1
let NERDTreeMapHelp='<f1>'

" ================ Ctrl-P =====================================================
" let g:ctrlp_by_filename=1
" ================ Airline ====================================================
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
" let g:ycm_auto_trigger = 0
" let g:airline_section_c .= '%{getcwd()}'

" ================ Eclim ======================================================
" let g:EclimCompletionMethod = 'omnifunc'

" ================ Unite ======================================================
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
            \ 'max_candidates', 0)
let g:unite_source_file_rec_max_cache_files = 0
let g:unite_winheight = 10
call unite#custom#source('file_mru,file_rec,file_rec/async,grepocate',
            \ 'max_candidates', 0)

"}}}
let g:NERDTreeChDirMode=2
" ================ Colour Scheme " ========================================={{{
if has('gui_running')
    " if strftime("%H") < 17
    "   set background=light
    " else
    "   set background=dark
    " endif
    set background=light
    colorscheme base16-grayscale
else
    let base16colorspace=256
    colorscheme badwolf
    syntax on
endif
"}}}

" ================ Key Remapping " ========================================={{{

" ================ Esc Mapping " ==============================================
cmap jk <Esc>
imap jk <Esc>
cmap jf <Esc>
imap jf <Esc>

" ================ Window Movement Mapping " ==================================
" Cannot decide ctrl or alt.
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l


" ================ Miscellaneous" =============================================
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nmap gr *[mV%:s//test/gc<CR>
imap <C-k> <Plug>snipMateNextOrTrigger

" ================ Changing search behaviour " " ================================lllll
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *N
"}}}

" ================ Leader Commands " ======================================={{{
let mapleader = " "

" nnoremap <Leader>fs :set guifont=Source\ Code\ Pro\ for\ Powerline\ 10<CR>
" nnoremap <Leader>fm :set guifont=Source\ Code\ Pro\ for\ Powerline\ 11<CR>
" nnoremap <Leader>fl :set guifont=Source\ Code\ Pro\ for\ Powerline\ 12<CR>
nnoremap <Leader>cd :cd %:p:h<CR>
nnoremap <Leader>gg :GitGutterToggle<CR>
nnoremap <Leader>md :MediumModeToggle<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>rt :!rspec spec/*<CR>
nnoremap <Leader>c :!
nnoremap <Leader>td :e ~/documents/todo<CR>
nnoremap <Leader>zs :e ~/.zshrc<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>y "+y
nnoremap <leader>u "+y
nnoremap <Leader>sy "*y
noremap  <Leader>p "+p<CR>
nnoremap <Leader>P "+P<CR>
noremap  <Leader>sp "*p<CR>
nnoremap <Leader>sP "*P<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>m :make<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>; :b #<CR>
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>d :set background=light<CR>
nnoremap <Leader>n :set background=dark<CR>
nnoremap <Leader>rs :%s/\s\+$//<CR>
nnoremap <Leader>co :call ToggleAlignmentColumns()<CR>
nnoremap <Leader>ca :Calc
nnoremap <Leader>r :vertical resize 85<CR>
nnoremap <Leader>spl :set spell!<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
" nnoremap <leader>f :<C-u>Unite -start-insert file_rec/async:!<CR>
" nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :Unite -start-insert file_rec/async<cr>
nnoremap <Leader>ms :mksession! ~/.vim_session<CR>
nnoremap <Leader>ss :source ~/.vim_session<CR>

" map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"}}}

" ================ Gui Options " ==========================================={{{
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L
set guioptions-=e
set guioptions+=c

set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
" set guifont=Inconsolata-g\ Medium\ 10
" set guifont=Anonymous\ Pro\ 12

"}}}

" ================ Terminal Options " ======================================{{{
set t_Co=256

" }}}

" ================ In Testing " ============================================{{{
au VimResized * exe "normal! \<c-w>="
:command! -nargs=+ Calc :py print <args>
:py from math import *
:py from cmath import *
" autocmd VimEnter * source ~/.vim_session
" autocmd VimEnter * source ~/.vimrc
" autocmd VimEnter * Obsession ~/.vim_session
" set foldmethod=syntax

" ================ Vimscript functions " ==================================={{{

function! ToggleAlignmentColumns()
    if &colorcolumn == '+1'
        set colorcolumn=4,8,12,16,20,24,+1
    else
        set colorcolumn=+1
    endif
endfunction

" Highlight Word {{{
" Stolen from Steve.
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HighlightInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HighlightInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HighlightInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HighlightInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HighlightInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HighlightInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HighlightInterestingWord(6)<cr>
nnoremap <silent> <leader>0 :call clearmatches()<cr>h


" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b8f8f3 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}
" }}}
"


" function! NeatFoldText() "{{{2
"   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
"   let lines_count = v:foldend - v:foldstart + 1
"   let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
"   let foldchar = matchstr(&fillchars, 'fold:\zs.')
"   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"   let foldtextend = lines_count_text . repeat(foldchar, 8)
"   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
" endfunction
" set foldtext=NeatFoldText()
" " }}}2
"}}}
