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
call dein#add('vim-scripts/The-NERD-Commenter')
call dein#add('vim-scripts/matchit.zip')
call dein#add('vim-scripts/Align')
call dein#add('vim-scripts/a.vim')

call dein#add('tpope/vim-fugitive')
call dein#add('fatih/vim-go')

call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')

"call dein#add('rhysd/rust-doc.vim')
"call dein#add('kovisoft/slimv')

call dein#add('elmcast/elm-vim')


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
set bs=2
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

inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>

nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Leader>fm :Unite file_mru -start-insert<CR>
nnoremap <Leader>fj :Unite file_rec -start-insert<CR>
nnoremap <Leader>ub :Unite buffer -start-insert<CR>
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

let g:quickrun_config = {
			\ 'cpp/clang++14': { 'type': 'cpp/clang++', 'cmdopt': '--std=c++14' },
			\ 'python': { 'command': 'python3' },
			\ 'cargo/run': { 'command': 'cargo', 'exec': '%c run' },
			\}
let g:quickrun_config['cpp'] = { 'type': 'cpp/clang++14' }
let g:quickrun_config['rust'] = { 'type': 'cargo/run' }

"let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/dein/repos/github.com/kovisoft/slimv/slime/start-swank.lisp\""'


"let g:racer_cmd = "~/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
au FileType rust nmap <leader>t :Cargo test<CR>

let g:racer_experimental_completer = 1
