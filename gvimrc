syntax enable
set background=dark
colorscheme monokai

set guifont=Menlo\ Bold\ Italic:h22

" Hide GUI stuffs: https://github.com/dstrelau/dotfiles/blob/master/gvimrc
set antialias       " MacVim: smooth fonts
set encoding=utf-8  " Use UTF-8 everywhere
set guioptions-=T   " Hide toolbar
set guioptions-=L  " Don't show left scrollbar
set guioptions-=l  " Don't show left scrollbar. Really.
set guioptions-=R  " Don't show right scrollbar
set guioptions-=r  " Don't show right scrollbar. Really.

" Full Screen toggle: https://wincent.com/wiki/MacVim_fullscreen_mode
set fuopt+=maxhorz
macmenu &Edit.Find.Find\.\.\. key=<nop>
map <D-f> :set invfu<CR>
