" Add plugins to &runtimepath
call plug#begin('~/.local/share/nvim/site/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Split window file browser
Plug 'scrooloose/nerdtree'

" Quick file browser
Plug 'ctrlpvim/ctrlp.vim'

" More colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'

" File viewer
Plug 'altercation/vim-colors-solarized'

" Git integration
Plug 'tpope/vim-fugitive'

" Shows a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

" Pymode
Plug 'klen/python-mode'

" Airline
Plug 'bling/vim-airline'

" Undotree
Plug 'mbbill/undotree'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Comment
Plug 'scrooloose/nerdcommenter'

" Surround parantheses, bracket, quotes, tags
Plug 'tpope/vim-surround'

" Align lines nicely
Plug 'godlygeek/tabular'

" requirement for the easytag
Plug 'xolox/vim-misc'

" Tag generation
Plug 'xolox/vim-easytags'

" Realtime collaborative editing
" Plugin 'floobits/floobits-neovim'

call plug#end()


"""""""""""""""""""""""""""""""""""
" Visual setting
"""""""""""""""""""""""""""""""""""
" colorscheme zenburn  " very comfortable font colors
colorscheme badwolf  " very strong font colors
let g:airline_theme='dark'

" Set 80 line limit a colorcolumn
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""""""""""""""""
" Keymapping
"""""""""""""""""""""""""""""""""""
let mapleader=","
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <Leader>u :UndotreeToggle<cr>

"""""""""""""""""""""""""""""""""""
" Editor setting
"""""""""""""""""""""""""""""""""""
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:¬,tab:>·,trail:•,extends:>,precedes:<
set list

" Switch buffers in vim without saving to a currently modified file
set hidden

" colorscheme solarized
let g:airline_theme='dark'

" Set 80 line limit a colorcolumn
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" hlight the current line in the current window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter,TabEnter,FocusGained,CmdwinEnter * setlocal cursorline
  au WinLeave,TabLeave,FocusLost,CmdwinLeave * setlocal nocursorline
augroup END

" https://github.com/neovim/neovim/issues/2093
set ttimeout
set ttimeoutlen=0

" Undo tree persistent
set undodir=/tmp/.undodir/
set undofile

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

