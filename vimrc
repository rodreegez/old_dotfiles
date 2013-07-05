" Make vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
set mouse=a

call pathogen#runtime_append_all_bundles() " Pathogen

filetype plugin indent on         " Turn on file type detection.
syntax enable

set showcmd                       " Display incomplete commands.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

" invisibles
set list listchars=tab:▸\ ,trail:·,eol:¬

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

noremap j gj
noremap k gk

" strip whitespace when saving
autocmd FileType rb autocmd BufWritePre {*} :%s/\s\+$//e

command! W :w                     " :W  is the same as :w
command! Q :q                     " :Q  is the same as :q
command! Wq :wq                   " :Wq is the same as :wq
command! Wqa :wqa                 " guess
command! Qa :qa                   " :Qa is the same as :qa

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" set text wrapping to 72 cols
function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

" Show a gutter at 80 chars
if exists("&colorcolumn")
  set cc=+2
endif

" Press Space to dismiss highlighting
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Switch splits with <C-h> & <C-l>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

nnoremap <leader>q :!open -a Marked.app '%:p' :redraw! <cr>

au BufNewFile,BufRead admin.py     setlocal filetype=python.django
au BufNewFile,BufRead urls.py      setlocal filetype=python.django
au BufNewFile,BufRead models.py    setlocal filetype=python.django
au BufNewFile,BufRead views.py     setlocal filetype=python.django
au BufNewFile,BufRead settings.py  setlocal filetype=python.django
au BufNewFile,BufRead forms.py     setlocal filetype=python.django

