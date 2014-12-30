""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Vim Setting
" 
" Author : Christopher B. Choy
" Email  : chrischoy208 gmail com
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setting
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file

" colorscheme solarized
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    colorscheme slate
  else
    colorscheme evening
  endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Setting
"
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'lazywei/vim-matlab'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'FuzzyFinder'

""""""""""""""""""""""""""""""""""""
" C/C++ Autocomplete
Plugin 'Valloric/YouCompleteMe'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Tagbar, show tags
Plugin 'majutsushi/tagbar'
" Tagbar toggle button
nmap <F8> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Python Autocomplete
Plugin 'davidhalter/jedi-vim'
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Pydoc
Plugin 'fs111/pydoc.vim'
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" SuperTab
Plugin 'ervandew/supertab'
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Python PEP8
Plugin 'vim-scripts/pep8'
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" NerdTree
Plugin 'scrooloose/nerdtree'
" Close vim if the only window left open is a NERDTree 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>       " Toggle NerdTree using hotkey
" NerdTree open on startup
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd l
" autocmd BufNew   * wincmd l
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" Auto Syntax checker
" pip install flake8 pylint
Plugin 'scrooloose/syntastic'
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Vim-airline
Plugin 'bling/vim-airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Easy move
Plugin 'Lokaltog/vim-easymotion'

""""""""""""""""""""""""""""""""""""

" Vim-LaTex
" Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
" Vim-Latex
" Plugin 'jcf/vim-latex'


""""""""""""""""""""""""""""""""""""
" Latex-Box
Plugin 'LaTeX-Box-Team/LaTeX-Box'
let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:LatexBox_latexmk_preview_continuously=1
" let g:LatexBox_latexmk_async=0
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Vim-Latex
Plugin 'nuclearsandwich/vim-latex'
" Compiler and viewer settings
let g:tex_flavor='latex'  
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_pdf =  'okular'
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" Vim TMUX integration
Plugin 'chrischoy/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
let g:tmux_navigator_cursorline = 1
" For OSX vim, tmux resize using <C-arrowkeys> does not work.
" Follow the following answer to fix. Also, disable system default
" <C-arrowkey> mapping
" http://superuser.com/questions/660013/resizing-pane-is-not-working-for-tmux-on-mac
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Restore FocusLost function in tmux
Plugin 'sjl/vitality.vim'
let g:vitality_always_assume_iterm = 1
""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set vim options

""""""""""""""""""""""""""""""""""""
" reset to vim-defaults
if &compatible          " only if not set before:
  set nocompatible      " use vim-defaults instead of vi-defaults (easier, more user friendly)
endif
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" display settings
set background=dark     " enable for dark terminals
set nowrap              " dont wrap lines
set scrolloff=2         " 2 lines above/below cursor when scrolling
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" editor settings
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set backspace=2         " backspace works

set autoindent
set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set expandtab           " turn a tabs into spaces

set fileformat=unix     " file mode is unix
"set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" system settings
set hidden              " my preference with using buffers. See `:h hidden` for more details
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set tags=./tags;        " add ctags in the current directory
set mouse=a             " allow mouse interaction
set directory=~/tmp//,.,/var/tmp//,/tmp// " Force Swap file to use different path
" set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" change to 256 color for gnome
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
endif
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlihgt
"
""""""""""""""""""""""""""""""""""""
" Spelling highlight
hi clear SpellBad
hi SpellBad term=standout ctermfg=1 term=underline cterm=underline
hi clear SpellCap
hi SpellCap term=underline cterm=underline
hi clear SpellRare
hi SpellRare term=underline cterm=underline
hi clear SpellLocal
hi SpellLocal term=underline cterm=underline   
""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""
" Cursor line highlight
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLine   cterm=NONE ctermbg=darkred guibg=darkred 
hi CursorColumn cterm=NONE ctermbg=darkred guibg=darkred 
" hlight current line current window only
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter,TabEnter,FocusGained,CmdwinEnter * setlocal cursorline
    au WinLeave,TabLeave,FocusLost,CmdwinLeave * setlocal nocursorline
augroup END
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" Spellcheck
hi clear SpellBad
hi SpellBad cterm=underline
""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""
" Popup menu color
if version >= 700
  "Pmenu
  hi Pmenu                          guibg=gray
  hi Pmenu                          ctermbg=gray
  hi PmenuSel   guifg=white         guibg=black
  hi PmenuSel   ctermfg=white       ctermbg=black
  hi PmenuSbar                      guibg=gray
  hi PmenuSbar                      ctermbg=gray
endif
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
" 
" Easy navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Toggle search highlight
nnoremap <F3> :set hlsearch!<CR>

nnoremap <Leader><Leader>+ :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ 'g')<CR>
nnoremap <Leader><Leader>- :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ 'g')<CR>
" Remap 'wq' and 'q' to close buffer not whole window
" :cnoreabbrev wq w<bar>bd
" :cnoreabbrev q bd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File specific setting

"""""""""""""""""""""
" Cuda
autocmd BufNewFile,BufRead *.cu set ft=cu
autocmd BufNewFile,BufRead *.cuh set ft=cu
"""""""""""""""""""""


"""""""""""""""""""""
" Matlab parser
autocmd BufEnter *.m    compiler mlint
"""""""""""""""""""""

"""""""""""""""""""""
" Python Settings 
au FileType python set omnifunc=pythoncomplete#Complete " Allows python autocomplete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

