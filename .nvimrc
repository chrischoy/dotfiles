"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add plugins to &runtimepath
call plug#begin('~/.vim/plugged')

" Vim default setting
Plug 'tpope/vim-sensible'
" Git integration
Plug 'tpope/vim-fugitive'

Plug 'junegunn/vim-easy-align'
" fzf finder for files, tags, commits, Ag, etc.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" More colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'

" Shows a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

" Syntax checker
Plug 'scrooloose/syntastic'

" Airline
Plug 'bling/vim-airline'

" Tmuxline
Plug 'edkolev/tmuxline.vim'

" Undotree
Plug 'mbbill/undotree'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Surround parantheses, bracket, quotes, tags
Plug 'tpope/vim-surround'

" Align lines nicely
Plug 'godlygeek/tabular'

" Grammar check
Plug 'rhysd/vim-grammarous'

" Latex
Plug 'vim-latex/vim-latex'

" indentLine
Plug 'Yggdroot/indentLine'

" Vim-easymotion
Plug 'easymotion/vim-easymotion'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags.
Plug 'google/vim-glaive'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme zenburn  " very comfortable font colors
" colorscheme molokai  " very strong font colors
" Chasing_Logic, 1989, Revolution. blackboard, 256-grayvim, Benokai,
" colorsbox-greenish
colorscheme Monokai
let g:airline_theme='dark'

" Set 100 line limit a colorcolumn
if exists('+colorcolumn')
  " Mark from 80 to 100 to be the warning zone
  let &colorcolumn=join(range(81,100),",")
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100.\+', -1)
endif

" hlight the current line in the current window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter,TabEnter,FocusGained,CmdwinEnter * setlocal cursorline
  au WinLeave,TabLeave,FocusLost,CmdwinLeave * setlocal nocursorline
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

nnoremap <F5> "=strftime("%Y-%m-%dT%T%z")<CR>P
inoremap <F5> <C-R>=strftime("%Y-%m-%dT%T%z")<CR>

"""""""""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <Leader>u :UndotreeToggle<cr>
" Stupid work around
" https://github.com/neovim/neovim/issues/2048#issuecomment-78534227
if has('nvim')
    nmap <BS> :TmuxNavigateLeft<CR>
endif

"""""""""""""""""""""""""""""""""""
" Easymotion setting
"""""""""""""""""""""""""""""""""""
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" Search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" Dummy vim-latex keymapping
map <Leader>a <Plug>IMAP_JumpForward<CR>

" Remove all Ctrl-M
map <Leader>m :%s/\r//g<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default clipboard buffer
set clipboard=unnamedplus

" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:>·,trail:•,extends:>,precedes:<
set list

" Set number column
set number

" Use 2 spaces for python files
autocmd FileType python setlocal tabstop=2 shiftwidth=2

" Switch buffers in vim without saving to a currently modified file
set hidden

" https://github.com/neovim/neovim/issues/2093
set ttimeout
set ttimeoutlen=0

" Undo tree persistent
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir -p ' . vimDir)
    call system('mkdir -p ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Set python interpreter
" let g:python_host_prog = '/usr/bin/python'

" Set python3 interpreter
" let g:python3_host_prog = '/usr/bin/python3'

" vim-latex setting
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf='pdflatex --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_pdf='okular'

" Turn on EasyMotion case insensitive feature
let g:EasyMotion_smartcase = 1

" No conceal
set conceallevel=0

"""""""""""""""""""""""""""""""""""
" YCM
"""""""""""""""""""""""""""""""""""
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntastic 80 character line
" If the syntastic doesn't report errors, install flake8
let g:syntastic_python_checkers = ['flake8']
" E501: 80 line, E111, E114: indentation multiple of four
let g:syntastic_python_flake8_args='--ignore=E501,E111,E114'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3

"""""""""""""""""""""""""""""""""""
" NerdTree Git
"""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Spelling
set spell spelllang=en_us

" Local exrc
set exrc
set secure
