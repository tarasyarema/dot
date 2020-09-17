" Plug related config

call plug#begin()

Plug 'bling/vim-airline'
Plug 'zah/nim.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'
Plug 'ThePrimeagen/vim-be-good'
Plug 'preservim/nerdtree' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile', 'branch': 'master'}
Plug 'tpope/vim-fugitive'
<<<<<<< HEAD:config/nvim/init.vim
Plug 'lervag/vimtex'
=======
Plug 'wakatime/vim-wakatime'
>>>>>>> 2cea9414734be0e274f2a25ddb5fab06d49e3197:config/.config/nvim/init.vim

call plug#end()

if has("win32")
    source ~\AppData\Local\nvim\coc.vim
elseif has("unix")
    source ~/.config/nvim/coc.vim
endif

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


" Python related

if has("win32")
    let g:python3_host_prog = 'C:\Users\2pac\scoop\apps\python\current\python.EXE'
endif

" ---------------------
" General configuration
" ---------------------

" Map Leader to Space
let mapleader=" "

set nocompatible
syntax on

set background=dark
colorscheme gruvbox
set t_Co=256

" Disable startup message
set shortmess+=I

" Number configurations
set number	
set relativenumber

" Line break config
set textwidth=0

" Status line config
set laststatus=2

" Search config
set showmatch	
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	

" Custom configs

" 0 should be ^
nnoremap 0 ^

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Disable the search highlig.
map <Leader>l :noh<CR>

" Fuzzy related
map <Leader>oo :Files<CR>
map <Leader>o :GFiles<CR>
map <Leader>O :tabnew<CR>:GFiles<CR>
map <Leader>rg :Rg<SPACE>
map <Leader>f :Lines<CR>
map <Leader>F :BLines<CR>

" Formatting code
xmap <Leader>fo gv=gv<ESC>

" Mouse support
set mouse+=a

" Indentation config
set autoindent	
set shiftwidth=4	
set smartindent	
set smarttab	
set softtabstop=4	

" Copy/Paste remaps
" Do not work under WSL
noremap <A-c> "*y
noremap <A-v> "*p

" Splits config

" Remap changing split to Alt+hjkl
noremap <A-l> <C-w>l
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k

" Remap changing tab to Ctrl+n(ext)/p(revious)
noremap <C-n> gt
noremap <C-p> gT

" Misc configs
set cursorline
set ruler	
set undolevels=1000	
set backspace=indent,eol,start	
set noerrorbells visualbell t_vb= 

" Try not using the arrow keys by shock therapy lol
nnoremap <Left>  :echoe "Use hjkl"<CR>
nnoremap <Right> :echoe "Use hjkl"<CR>
nnoremap <Up>    :echoe "Use hjkl"<CR>
nnoremap <Down>  :echoe "Use hjkl"<CR>

inoremap <Left>  <ESC>:echoe "Use hjkl"<CR>
inoremap <Right> <ESC>:echoe "Use hjkl"<CR>
inoremap <Up>    <ESC>:echoe "Use hjkl"<CR>
inoremap <Down>  <ESC>:echoe "Use hjkl"<CR>

