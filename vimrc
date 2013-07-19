execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme vibrantink

set nu "line numbers
set mouse=a
set hidden

filetype on  " Automatically detect file types.
set nocompatible
set nobackup

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set autoindent
set smarttab
set expandtab
set nocp incsearch
set cinwords=if,else,while,do,for,switch,case

set ruler  " Ruler on
set nowrap  " Line wrapping off

" Visual
set showmatch  " Show matching brackets.

let mapleader = ","

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" plugin unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 20

call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <leader>t :<C-u>Unite -start-insert file_rec/async<CR>
nnoremap <leader>f :Unite grep:.<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>
nnoremap <leader>r :<C-u>Unite file_mru<CR>

map <a-right> :w

map <C-n> :NERDTreeToggle<CR> " Toggle NERDtree
