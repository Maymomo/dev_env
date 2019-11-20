set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


Plugin 'majutsushi/tagbar'

Plugin 'rafi/awesome-vim-colorschemes'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-fugitive'

Plugin 'Valloric/YouCompleteMe'

Plugin 'rdnetto/YCM-Generator'

call vundle#end()            " required

filetype plugin indent on    " required

set ignorecase
set mouse=v
set nohlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set relativenumber
set cindent
syntax on

nmap w= : resize+3 <CR>
nmap w- : resize-3 <CR>
nmap w,  : vertical resize -3 <CR>
nmap w. : vertical resize +3 <CR>


if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

nmap<F2> : TagbarToggle <CR>
let g:tagbar_left = 1

function! FormatOnSave()
    let l:formatdiff = 1
    py3f ~/.clang-format.py
endfunction

function! FormatAll()
    let l:line="all"
    py3f ~/.clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp,*.c call FormatOnSave()

set background=dark
colorscheme onedark

"if &diff 
"colorscheme evening endif



let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_regexp = 1

let g:ctrlp_max_depth = 40





if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

nmap<F2> : TagbarToggle <CR>
let g:tagbar_left = 1

function! FormatOnSave()
    let l:formatdiff = 1
    py3f ~/.clang-format.py
endfunction

function! FormatAll()
    let l:line = "all"
    py3f ~/.clang-format.py
endfunction

autocmd BufWrite *.h,*.cc,*.cpp,*.c call FormatOnSave()
nmap fa :execute FormatAll() <CR>

set background=dark
colorscheme onedark

"if &diff 
"colorscheme evening endif



let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_regexp = 1

let g:ctrlp_max_depth = 40


nmap hls :GitGutterLineHighlightsToggle  <CR>

autocmd BufWritePre * :GitGutter

nmap bn :bnext <CR>
nmap bp :bprev <CR>


set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_filetype_whitelist = {"cpp": 1, "c": 1}
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_use_clangd = 1
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

nmap  tdf : YcmCompleter GoToDefinition <CR>
nmap  tdc : YcmCompleter GoToDeclaration <CR>
nmap  tic : YcmCompleter GoToInclude <CR>
nmap  gty : YcmCompleter GetType <CR>

