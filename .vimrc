set rnu nu
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.vimrc
\| endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" NERDTree config
"
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
