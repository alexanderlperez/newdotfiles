"" START VUNDLE CONFIG
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

"""

Plugin 'Chun-Yang/vim-action-ag'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'Raimondi/delimitMate'
Plugin 'alvan/vim-closetag'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'linediff.vim'
Plugin 'matchit.zip'
Plugin 'pangloss/vim-javascript'
Plugin 'preservim/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'spf13/vim-colors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

call vundle#end()            " required
filetype plugin indent on    " required
"" END VUNDLE CONFIG

"
" System Configuration
"

" indentation setting
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set so=5
set ignorecase
set smartcase
set nowrap

" fix backspace: can backspace over everything
set backspace=indent,eol,start

" have relative numbering in the gutter
set relativenumber

" config for vim-addon-local-vimrc
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}

" show full path of file in statusline
set statusline=%F "status line only
set laststatus=2

" highlight matches while typing in search queries
set hlsearch
set incsearch

" prevent blinking on bell
set visualbell 

" don't continue comments
set formatoptions-=cro 

" turn off mapping timeouts
set notimeout
set ttimeout

" turn off EX mode
nnoremap Q <nop>

" turn off 'search man files for word'
nnoremap K <nop>

"
" Configuration helpers
"

" Open and Reload configuration
nnoremap <silent> <Leader><Leader>e :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader><Leader>r :source ~/.config/nvim/init.vim<CR>

color molokai

"
" Useability Helpers
"

""" Buffers/Files
inoremap <silent> <C-s> <ESC>:w<cr>
nnoremap <silent> <C-s> <ESC>:w<cr>

""" UI/Layout

" move tabs order
nnoremap <silent> [[ :tabm-<cr>
nnoremap <silent> ]] :tabm+<cr>

" tab navigation
map <s-h> :tabprevious<cr>
map <s-l> :tabnext<cr>

" Move around splits
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" close tab/split
nnoremap <silent> <Leader>x :q<cr>

" close/open quickfix
nnoremap <silent> <leader>qo :copen<cr>
nnoremap <silent> <leader>qc :cclose<cr>

" whitespace in normal mode
nnoremap <space> i<space><esc> 
nnoremap <cr> o<esc>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

""" UI/Movement

" make 0 move to first non-whitespace char
map 0 ^

" move around wrapped lines
map j gj
map k gk

"
" Custom functions
"

""" Change surrounding element: cse
function! s:ChangeElement()
  execute "normal! vat\<esc>"
  call setpos('.', getpos("'<"))
  let restore = @"
  normal! yi>
  let attributes = substitute(@", '^[^ ]*', '', '')
  let @" = restore
  let dounmapb = 0
  if !maparg(">","c")
    let dounmapb = 1
    " Hide from AsNeeded
    exe "cn"."oremap > <CR>"
  endif
  let tag = input('<', '')
  if dounmapb
    silent! cunmap >
  endif
  let tag = substitute(tag, '>*$', '', '')
  exe "normal cst<" . tag . attributes . ">"
endfunction
nnoremap cse :call <SID>ChangeElement()<cr>

"
" Plugins
"

""" NERDTree

nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>e :NERDTreeFind<cr>

""" Easymotion

" Disable default mappings
let g:EasyMotion_do_mapping = 0 
map <Tab> <Plug>(easymotion-w) 
map <S-Tab> <Plug>(easymotion-b)

""" Vimux 

" Prompt for a command to run
nmap <leader><leader>p :VimuxPromptCommand <cr>

" Run last command executed by RunVimTmuxCommand
nmap <leader><leader>l :VimuxRunLastCommand <cr>

""" CtrlP directory

" set the directory 
map <leader>cd :CtrlP<space> 

" open files in new tab with ctrlp
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" ignore paths
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,max:25'

""" Ag 

let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>a :call RunAgSearch()<cr>
function! RunAgSearch() 
    call inputsave()
    let search = input("Search files for: ")
    call inputrestore()
    if(empty(search)) 
        return 
    else 
        execute ":Ag! " . search
    endif 
endfunction

""" Vimux 

" Prompt for a command to run
nmap <leader><leader>p :VimuxPromptCommand <cr>

" Run last command executed by RunVimTmuxCommand
nmap <leader><leader>l :VimuxRunLastCommand <cr>

""" delimitMate

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1 
let delimitMate_excluded_regions = ""

""" Linediff 

noremap \ld :Linediff<CR>
noremap \ldr :LinediffReset<CR>
