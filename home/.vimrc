" .vimrc
" Zoltan Puskas <zoltan@sinustrom.info>
"

" set VIM mode 
set nocompatible

" set TAB display length to 4
set tabstop=4

" set shifting length to 4
set shiftwidth=4

" set indentation
set autoindent
" set cindent
set smartindent

" auto add comment on newline
set fo+=r

"enable modelines
set modeline

" replace tabs with spaces
set expandtab

" don't make it look like there are line breaks where there aren't
set nowrap

" enable auto indentation
set autoindent

" set incremental (as U type) search
set incsearch

"enable syntax coloring
syntax enable

"set my colorshceme
colorscheme darkblue 

" have fifty lines of command-line (etc) history
set history=50

" display the current mode and partially-typed commands in the status line
set showmode
set showcmd

" have the mouse enabled all the time
set mouse=a

" enable filetype detection
filetype on

" set maximum text width to 80
"set textwidth=80

" don't expand tabs for make files
autocmd FileType make set noexpandtab

" enable backspace
set backspace=indent,eol,start

" nice line numbers
set number

" show ruler
set ruler

" highlight search
set hlsearch

" set autodirectory
"set autochdir

" enable spell check
" set spell

" utf8 encoding
set encoding=utf-8

" always show status line
set laststatus=2

" highlight cursor line number
set cursorline
highlight CursorLine   cterm=none ctermbg=black
highlight CursorLineNr cterm=none ctermbg=black ctermfg=blue

" buftabs settings
let g:buftabs_only_basename=1

" taglist
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Use_Right_Window=1
" let Tlist_Auto_Open=1
let Tlist_Show_One_File = 1

" buffer movement key mappings
nnoremap <silent> <F2> :bp<CR>
nnoremap <silent> <F3> :bn<CR>
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
nnoremap <silent> <F5> :set spell<CR>
nnoremap <silent> <F6> :set nospell<CR>
nnoremap <silent> <S-F5> [s
nnoremap <silent> <S-F6> ]s
nnoremap <silent> <F7> z=
nnoremap <silent> <F8> zg
nnoremap <silent> <F9> :make<CR>
nnoremap <silent> <F11> :set colorcolumn=80<CR>
nnoremap <silent> <S-F11> :set colorcolumn=0<CR>
nnoremap <silent> <F12> :!ctags -R<CR>
nnoremap <silent> <S-F12> :TlistToggle<CR>

" change autocomplete list color
highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30

"CUDA highlight
au BufNewFile,BufRead *.cu set ft=cpp
au BufNewFile,BufRead *.cuh set ft=cpp

autocmd FileType c,cpp,java,python autocmd BufWritePre <buffer> :%s/\s\+$//e
