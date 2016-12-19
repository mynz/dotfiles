if &compatible
	set nocompatible
endif


" mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
" git clone https://github.com/Shougo/dein.vim.git  ~/.vim/dein/repos/github.com/Shougo/dein.vim

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')

"call dein#add('Shougo/vimproc.vim', {'build': 'gmake'})
call dein#add('Shougo/vimproc.vim', {
			\ 'build': {
			\     'mac': 'make -f make_mac.mak',
			\     'linux': 'make',
			\     'unix': 'gmake',
			\    },
			\ })

call dein#add('Shougo/unite.vim')

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')

"call dein#add('Shougo/neosnippet')
"call dein#add('Shougo/neosnippet-snippets')

call dein#add('thinca/vim-quickrun')
call dein#add('tpope/vim-surround')
call dein#add('The-NERD-Commenter')
call dein#add('matchit.zip')
call dein#add('Align')
call dein#add('a.vim')

call dein#add('tpope/vim-fugitive')
call dein#add('fatih/vim-go')


call dein#end()
filetype plugin indent on
syntax enable

"""""""""""""""

set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set noundofile
set ts=4
set sts=4
set shiftwidth=4
set laststatus=2
set scrolloff=5
set bg=dark
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P 
set autoindent

set encoding=utf-8
set termencoding=utf8

let mapleader=","

inoremap <silent> <C-f> <Left>
inoremap <silent> <C-b> <Right>

nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Leader>fm :Unite file_mru -start-insert<CR>
nnoremap <Leader>fj :Unite file_rec -start-insert<CR>
nnoremap <Leader>d :call append(line(".")-1, ["----", strftime("%Y%m%d", localtime())])<cr>

nmap <c-n> :cn<cr>
nmap <c-p> :cp<cr>
" expand file (not ext)
cmap <c-x> <c-r>=expand('%:p:h')<cr>/
cmap <c-z> <c-r>=expand('%:p:r')<cr>


if 0
	let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets'
	imap <C-s> <Plug>(neosnippet_expand_or_jump)
	smap <C-s> <Plug>(neosnippet_expand_or_jump)
endif


