""""""""""""""""""""
" global settings
""""""""""""""""""""

set modeline

" per-project vimrc
set exrc
set secure " prevent unsafe commands in project-specific vimrc

" no swap files
set noswapfile
set nowritebackup

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

" show full path of file in statusline
set statusline=%F "status line only
set laststatus=2

" highlight matches while typing in search queries
set hlsearch
set incsearch

" make sure autocomplete uses words with dashes in them
set iskeyword+=-

" mouse settings for vim
set mouse=n
set mouse-=i

" osx clipboard
set clipboard=unnamed

" fix backspace: can backspace over everything
set backspace=indent,eol,start

" have relative numbering in the gutter
set relativenumber

" config for vim-addon-local-vimrc
let g:local_vimrc = {'names':['.vimrc'],'hash_fun':'LVRHashOfFile'}

" turn off timeouts
set notimeout
set ttimeout

" keep from rendering underlines in anchor tags for html
let html_no_rendering=1

" turn off EX mode
nnoremap Q <nop>

" turn off 'search man files for word'
nnoremap K <nop>

""""""""""""""""""""
" Vundle setup
""""""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My bundles here:
"
" original repos on GitHub
" 
" most of these are suggestions from:
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/

" editing commands 
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-repeat'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

"gui extensions
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-dispatch'
Plugin 'vimwiki/vimwiki'
Plugin 'gyim/vim-boxdraw'

"searching and moving
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'QFGrep.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'

" environment
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'benmills/vimux'
Plugin 'junegunn/limelight.vim'

" colors
Plugin 'spf13/vim-colors'
Plugin 'flazz/vim-colorschemes'

" languages and syntaxes
Plugin 'jrozner/vim-antlr'
Plugin 'greyblake/vim-preview'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'StanAngeloff/php.vim.git'
Plugin 'digitaltoad/vim-jade'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mxw/vim-jsx'
Plugin 'qbbr/vim-twig'
Plugin 'alvan/vim-closetag'

" I want to play around with these
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'matchit.zip'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-abolish.git'
" Plugin 'tagbar'
" Plugin 'ternjs/tern_for_vim'
" Plugin 'Valloric/YouCompleteMe'

" Ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" I need to play around with this one some more
"Plugin 'jiangmiao/auto-pairs' " this one I want to play with more sometime
Plugin 'Raimondi/delimitMate'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Syntastic' " need to learn how to configure this one flexibly
Plugin 'linediff.vim'
" non-GitHub repos
" Git repos on your local machine (i.e. when working on your own plugin)
" ...

call vundle#end()            " required
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

""""""""""""""""""
" Filetype related
filetype plugin indent on    
""""""""""""""""""

" edit PHP files like html
"au BufNewFile,BufRead *.php set filetype=html

" ejs filetype as html
au BufNewFile,BufRead *.ejs set filetype=html

" LESS filetype load
au BufNewFile,BufRead *.less set filetype=less

" js and Ultisnips
"au FileType javascript :UltiSnipsAddFiletypes javascript


"""""""""""""""""""""""""""""""""""""""
" colorscheme related, tmux workarounds
"""""""""""""""""""""""""""""""""""""""

set t_ut= " disable BCE to uncrazy bgs in tmux
set t_Co=256 " make sure our colors is set correct
syntax on
"syntax off
set background=dark
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
let g:solarized_termtrans = 0
"color kolor
"color Monokai
color solarized
 
""""""""""""""""""""""""""""""""""""""
" Plugin-related settings and shortcuts
""""""""""""""""""""""""""""""""""""""

"" vim-instant-markdown
let g:instant_markdown_autostart = 0

"" emmet.vim


"" Linediff 
noremap \ld :Linediff<CR>
noremap \ldr :LinediffReset<CR>


"" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"" delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1 
let delimitMate_excluded_regions = ""


"" NERDtree
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>


"" Ag 
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


"" Tabularize
map <Leader>t= :Tabularize /=<cr>
map <Leader>t: :Tabularize /:<cr>
map <Leader>t:: :Tabularize /:\zs<cr>
map <Leader>t, :Tabularize /,<cr>
map <Leader>t<bar> :Tabularize /<cr>
map <Leader>t/ :Tabularize / \/\/<cr>


"" CtrlP directory
" set the directory 
map <leader>cd :CtrlP<space> 
" open files in new tab with ctrlp
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
" ctrl-p ignore paths
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,max:25'


"" Vimux 
" Prompt for a command to run
nmap <leader><leader>p :VimuxPromptCommand <cr>
" Run last command executed by RunVimTmuxCommand
nmap <leader><leader>l :VimuxRunLastCommand <cr>


"" Ultisnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_ignore_files = ['*.html', '*.php']
let g:syntastic_javascript_eslint_exe = 'npx eslint'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"" Easymotion
map <tab> <leader><leader>w
map <s-tab> <leader><leader>b

"" NERDCommenter

"" SourceBeautifier
"map <leader>sb :call JsBeautify()<cr> " interferes with <leader>sb for setting all windows to scrollbind

"""""""""""""""""""""
" Custom functions
"""""""""""""""""""""

" Change surrounding element: cse
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



"""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""

" auto-uppercase common words
iabbrev todo TODO
"iabbrev fixme FIXME
"iabbrev tbd TBD
"iabbrev json JSON



"""""""""""""""""""""
" General custom shortcuts
"""""""""""""""""""""

" open ~/.vimrc
nnoremap <leader><leader>e :tabnew ~/.vimrc<cr>

" reload the ~/.vimrc
nnoremap <leader><leader>r :source ~/.vimrc<cr>

" make 0 move to first non-whitespace char
map 0 ^

" easy saving w/ ctrl-s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>

" tab navigation
map <s-h> :tabprevious<cr>
map <s-l> :tabnext<cr>

" create new tabs
nmap <leader>n :tabe<cr>

" close tabs easily
nmap <leader>x :q<cr>

" navigating between splits w/ tmux
map <C-h> :TmuxNavigateLeft <cr>
map <C-j> :TmuxNavigateDown <cr>
map <C-k> :TmuxNavigateUp <cr>
map <C-l> :TmuxNavigateRight <cr>

" whitespace in normal mode
nnoremap <space> i<space><esc> 
nnoremap <cr> o<esc>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" toggle syntax highlighting
map <silent> <leader><leader>S :if exists("g:syntax_on") <bar> syntax off <bar> else <bar> syntax enable <bar> endif <cr>

" set paste/nopaste
map <leader>p :set paste!<cr>

" clear search highlights
map <leader>c :noh<cr>

" toggle uppercasing a word
noremap <leader>~ g~iw

" move around wrapped lines
map j gj
map k gk

" insert a single newline a-la unimpaired
nnoremap [<cr> i<cr><esc>

" TODO-related listings
map <leader>td :vimgrep /TODO\<bar>FIXME\<bar>BUG/ % <bar> copen<cr>

" open file under cursor in new window
nnoremap gf <c-w>gf

nnoremap \+ <c-a>
nnoremap \- <c-x>

nnoremap <silent> <leader>qo :copen<cr>
nnoremap <silent> <leader>qc :cclose<cr>

nnoremap <silent> [[ :tabm-<cr>
nnoremap <silent> ]] :tabm+<cr>
