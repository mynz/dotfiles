if $GOROOT != ''
	set rtp+=$GOROOT/misc/vim
endif

 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " call neobundle#rc(expand('~/.vim/bundle/'))
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " Recommended to install
 " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
 " NeoBundle 'Shougo/vimproc'
 let g:make = 'gmake'
 NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}

 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/neomru.vim'
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/neosnippet-snippets'

 " NeoBundle 'Shougo/neocomplete.vim'

 NeoBundle 'thinca/vim-quickrun'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'The-NERD-Commenter'
 NeoBundle 'fugitive.vim'
 NeoBundle 'matchit.zip'
 NeoBundle 'Align'
 NeoBundle 'a.vim'

 NeoBundle 'mattn/webapi-vim'
 NeoBundle 'Gist.vim'
 NeoBundle 'ref.vim'

 NeoBundle 'taglist.vim'

 NeoBundle 'gregsexton/gitv'

 NeoBundle 'mynz/vs_con'

 NeoBundleLazy 'Blackrush/vim-gocode', {"autoload": {"filetypes": ['go']}}
 " NeoBundle 'Blackrush/vim-gocode'

 call neobundle#end()

 " NeoBundle 'Shougo/vimproc', {
   " \ 'build' : {
     " \ 'windows' : 'make -f make_mingw32.mak',
     " \ 'cygwin' : 'make -f make_cygwin.mak',
     " \ 'mac' : 'make -f make_mac.mak',
     " \ 'unix' : 'make -f make_unix.mak',
   " \ },
   " \ }


 " NeoBundle 'grep.vim'


 filetype plugin indent on     " Required!
 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 NeoBundleCheck

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=70

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set   encoding=utf-8

if has('win32') && has('kaoriya')
  set   ambiwidth=auto
else
  set   ambiwidth=double
endif

if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'

  "if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    "let s:enc_euc = 'euc-jisx0213,euc-jp'
    "let s:enc_jis = 'iso-2022-jp-3'
  "endif

  set   fileencodings&
  let &fileencodings = &fileencodings.','.s:enc_jis.',cp932,'.s:enc_euc

  unlet s:enc_euc
  unlet s:enc_jis
endif

set   termencoding=utf8

" added by mynz
set noswapfile
set hlsearch
set ignorecase
set smartcase
set nobackup
set noundofile
syn on
set ts=4
set sts=4
set shiftwidth=4
set laststatus=2
set scrolloff=5
set bg=dark
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P 

set path+=/opt/local/include/
" set path+=~/Documents/works/grvt/app/src/
set path+=~/Documents/works/mproject/
set path+=~/Documents/works/EdgeAnim-1600/edge/target/include_common/
set path+=~/g2/source/target/app/src/

set path+=~/devel/KZ4/code/Core/
set path+=~/devel/KZ4/code/Game/
set path+=~/devel/KZ4/code/KIN/
set path+=~/devel/KZ4/code/PIGS/



let mapleader=","

imap <c-b> <LEFT>
imap <c-f> <RIGHT>
inoremap <expr> <C-d> strftime("%Y%m%d")
nmap <c-n> :cn<cr>
nmap <c-p> :cp<cr>

" 行を連結時に空白が入らないのを標準の動作にする
"nnoremap J gJ
"nnoremap gJ J

nmap <leader>g :Gtags -g <c-r><c-w>
nmap <leader>a :A<CR>

" ruby omni-completion.
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
au FileType ruby setlocal ts=2 sw=2 
au FileType ruby compiler ruby

autocmd FileType scheme :let is_gauche=1

"set imdisable
"set iminsert=1
set imsearch=0
set iminsert=0


nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>

"nnoremap <leader>ff :FufFile<CR>
"nnoremap <leader>fm :FufMruFile<CR>
nnoremap <leader>fm :Unite file_mru -start-insert<CR>
nnoremap <Leader>fj :Unite file_rec -start-insert<CR>

" 日付を打つ.
" nnoremap <leader>d :call PutDateFunc()<cr>
nnoremap <leader>d :call append(line(".")-1, ["----", strftime("%Y%m%d", localtime())])<cr>


let g:gauref_file = "~/doc/gauche-refj.txt"
let g:fuf_modesDisable = [ 'mrucmd', ]

" for nerd_commenter
autocmd FileType scheme setlocal commentstring=;\ %s

let NERDSpaceDelims=1

"expand path
cmap <c-x> <c-r>=expand('%:p:h')<cr>/
" expand file (not ext)
cmap <c-z> <c-r>=expand('%:p:r')<cr>

" unite file_mru の高速化.
let g:unite_source_file_mru_filename_format = ''

" no need map setting for align.
let g:loaded_AlignMapsPlugin = 1




" command! GraviteRootCD  :cd ~/Documents/works/grvt/
command! Gravite2RootCD :cd ~/Documents/works/g2/
command! MprojectRootCD :cd ~/Documents/works/mproject/
command! EdgeAnimRootCD :cd ~/Documents/works/EdgeAnim-1600/
command! Kz4RootCD      :cd ~/devel/KZ4/


"let g:gist_use_password_in_gitconfig = 1

" \       "hook/time/enable" : 1


" let g:quickrun_config.cpp.cmdopt = "-std=c++0x -I/opt/local/include"
let g:quickrun_config = {}
let g:quickrun_config['cpp'] = { 'cmdopt': "-std=c++0x -I/opt/local/include -L/opt/local/lib -llua" }
" let g:quickrun_config.cpp = { 'cmdopt':  "-std=c++0x -I/opt/local/include" }

" let g:quickrun_config['cpp_lua'] = {
	" \ 'command' : "clang++",
	" \ 'exec' : "%c %o %s -o %s:p:r",
	" \ 'cmdopt': "-std=c++0x -I/opt/local/include -L/opt/local/lib -llua" ,
	" \}


