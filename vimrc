" Pre-Vundle Setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Vundle Bundles
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'w0rp/ale'
Plugin 'fatih/vim-go'
Plugin 'fatih/vim-hclfmt'
Plugin 'hashivim/vim-terraform'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rking/ag.vim'
Plugin 'elmcast/elm-vim'

call vundle#end()

" Syntax highlighting FTW
syntax on

" Setting Spacing and Indent (plus line no)
set number
set tabstop=2 shiftwidth=2 expandtab
filetype plugin indent on
set ts=2
set nowrap
set backspace=2

" enable mouse scrolling
set mouse=nicr

" highlight special characters and trailing whitespace
highlight NonText guifg=#444444 ctermfg=238
highlight SpecialKey guifg=#FF00AF ctermfg=199

" this is a really long line that shows that there will be a column highlight when I reach the 80th column
highlight ColorColumn guibg=#262626 ctermbg=235
call matchadd('ColorColumn', '\%81v', 100)

" Toggle tagbar stuffs
nmap <F8> :TagbarToggle<CR>

" Use the same symbols as TextMate for trailing whitespace
set listchars=tab:\ \ ,trail:█
set list

" Colorscheme
let base16colorspace=256
set background=dark
colorscheme base16-flat

" Remap the leader key
let mapleader = ','

" Swp files go to their hole
set backup
set backupdir=/tmp
set backupskip=/tmp/*
set directory=/tmp
set writebackup

" Set 256 colors
set t_Co=256
set guifont=Monaco:h16

let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = "never"
let g:ale_go_gobuild_options = "-i"
let g:ale_linters = {
\   'go': ['go build'],
\}

" vim-go stuffs
let g:go_fmt_command = 'goimports'
let g:godef_split = 3
let g:go_autodetect_gopath = 0
let g:go_term_enabled = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:ackprg = 'ag --vimgrep'

set hlsearch
set autoread
set smartcase
set history=1024
set showmatch
set incsearch " Incremental search
set inccommand=split
set hidden
set wildmenu
set lazyredraw
set splitright
set cursorline

" Esc key to leave :term's insert mode.
:tnoremap <Esc> <C-\><C-n>

" make sure we can always read around the cursor
set scrolloff=10
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

" Comment/uncomment lines
map <leader>/ <plug>NERDCommenterToggle

let g:airline#extensions#tabline#enabled = 1

" Gitgutter settings
highlight clear SignColumn
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black
let g:gitgutter_max_signs=1000

" fzf mods
let g:fzf_command_prefix = 'FZF'
autocmd BufLeave *#FZF :bd!
nnoremap <C-p>     :FZFFiles<cr>
nnoremap <leader>f :FZFFiles<cr>
nnoremap <leader>m :FZFHistory<cr>
nnoremap <leader>T :FZFBTags<cr>
nnoremap <leader>l :FZFLines<cr>
nnoremap <leader>L :FZFBLines<cr>
nnoremap <leader>b :FZFBuffers<cr>

" Line number BG
highlight LineNr ctermbg=black

" Statusline
set laststatus=2

" Fix for escape key delay
if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" yank to clipboard alias
vnoremap <leader>y "*y

" yank to clipboard alias
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" Enable > indent and < unindent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Cycle through buffers with ,z ,x
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>

" Clear highlighting with <Space>
nnoremap <Space> :<c-u>noh<CR>:echo<CR>

" fat-finger rebinds because ':'
command! W w
command! Q q
command! Qa qa
command! QA qa
command! WQ wq
command! Wq wq
command! Wqa wqa
command! WQa wqa
command! WQA wqa
command! Vs vs

" Autocommands
if has('autocmd')
  " Golang settings
  autocmd BufEnter,FileType go set tabstop=4 shiftwidth=4 noexpandtab
  " open import path at godoc.org
  autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  " switch between implementation and test files
  autocmd FileType go nmap <Leader>a :vsp<CR>:GoAlternate<CR>
  " run tests
  autocmd FileType go nnoremap <leader>t :GoTest<cr>
  " compile code
  autocmd FileType go nnoremap <leader>c :GoTestCompile<cr>
  " run code
  autocmd FileType go nnoremap <Leader>r <Plug>(go-run)

  " expand guru scope a bit, so it's mildly useful w/GoCallers and GoWhicherrs
  autocmd BufEnter,FileType go silent exe "GoGuruScope " . go#package#FromPath(expand('%:p:h')) . "/..."

  " Ruby settings
  autocmd BufEnter,FileType ruby set tabstop=2 shiftwidth=2 expandtab

  " YAML
  autocmd BufEnter,FileType yaml setlocal indentexpr=
  autocmd BufEnter,FileType yaml set tabstop=2 shiftwidth=2 expandtab

  " terraform
  autocmd FileType terraform setlocal commentstring=#%s

  " JSON
  " autocmd FileType json autocmd BufWritePre <buffer> :normal gqaj

  " Save anytime we leave a buffer or MacVim loses focus.
  autocmd BufLeave,FocusLost * silent! wall

  augroup vimrcEx
    " Clear all autocmds in this group
    autocmd!

    " Keep cursor position
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

  augroup END
endif

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

set iskeyword+=-
let g:netrw_keepdir=0

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
map <leader>v :r !pbpaste<cr>
:nnoremap <leader><space> :nohlsearch<cr>

" replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

let @b='ggi#!/bin/bash -exumain(){}main "$@"5k:set syntax=sh :w:!chmod +x %'
