" Basic Setup
set nocompatible
filetype plugin indent on
syntax on
set number relativenumber

" Formatting
set tabstop=4 shiftwidth=4 expandtab
set nowrap scrolloff=8

" Search
set incsearch ignorecase smartcase hlsearch showmatch

" UI/Behavior
set showcmd showmode wildmenu wildmode=list:longest
set history=1000 backspace=indent,eol,start
set laststatus=2

" Wildignore
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Eliot00/git-lens.vim'
Plug 'tpope/vim-fugitive'
Plug 'petertriho/nvim-scrollbar'
Plug 'ThePrimeagen/harpoon'
call plug#end()

" NERDTree
let NERDTreeIgnore=['\\.git$', '\\.jpg$', '\\.mp4$', '\\.ogg$', '\\.iso$', '\\.pdf$', '\\.pyc$', '\\.odt$', '\\.png$', '\\.gif$', '\\.db$']

" Autocmds
augroup vimrc
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter * set cursorline cursorcolumn
augroup END

if version >= 703
  call mkdir(expand('~/.local/state/vim/undo'), 'p', 0700)
  set undodir=~/.local/state/vim/undo undofile undoreload=10000
endif

" Statusline
set statusline=%F\ %M\ %Y\ %R\ =%=

" GUI
if has('gui_running')
  set background=dark
  colorscheme molokai
  set guifont=Monospace\ Regular\ 12
  set guioptions-=TmlrMb
  nnoremap <F4> :if &guioptions=~#'mTr'<Bar>set guioptions-=mTr<Bar>else<Bar>set guioptions+=mTr<Bar>endif<CR>
endif
