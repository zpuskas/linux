" .vimrc
" Zoltan Puskas <zoltan@sinustrom.info>
"

"" Editor looks and behaviour
" set VIM mode 
set nocompatible
" enable backspace
set backspace=indent,eol,start
" set incremental (as U type) search
set incsearch
" highlight search
set hlsearch
" make search smart about letter casing
set ignorecase
set smartcase
" have more lines of command-line (etc) history
set history=50
"enable modelines
set modeline
" display the current mode and partially-typed commands in the status line
set showmode
set showcmd
" always show status line
set laststatus=2
" nice line numbers
set number
" show ruler
set ruler
" highlight cursor line number
set cursorline
" have the mouse enabled at all times
set mouse=a
"enable syntax coloring
syntax enable
" enable filetype detection
filetype on
filetype plugin on
" enable automatically setting directory to match source location
"set autochdir

"" Color modifications
colorscheme darkblue 
" change auto complete list color
highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30
" change default column coloring
highlight ColorColumn ctermbg=11
" active cursor line, just change the number color
highlight CursorLine   cterm=none ctermbg=black
highlight CursorLineNr cterm=none ctermbg=black ctermfg=blue

"" General code formatting
" set TAB display length to 4
set tabstop=4
" set shifting length to 4
set shiftwidth=4
" replace tabs with spaces
set expandtab
" enable auto indentation
set autoindent
set smartindent
" auto add comment on newline
set fo+=r
" don't make it look like there are line breaks where there aren't
set nowrap
" utf8 encoding
set encoding=utf-8

"" Custom key mappings
" buffer movement
nnoremap <silent> <F2> :bp<CR>
nnoremap <silent> <F3> :bn<CR>
" paste mode to disable auto formatting when copy-pasting
set pastetoggle=<F4>
" 80 line marker helper
nnoremap <silent> <S-F4> :let &cc = &cc == '' ? 81 : ''<CR>
" spell check mappings
nnoremap <silent> <S-F5> [s
nnoremap <silent> <F5> ]s
nnoremap <silent> <F6> z=
nnoremap <silent> <S-F6> zg
nnoremap <silent> <F8> :set invspell spell?<CR>
" building
nnoremap <silent> <F9> :make<CR>
" code navigation
nnoremap <silent> <S-F11> :call flake8#Flake8UnplaceMarkers()<CR>
nnoremap <silent> <F12> :!ctags -R<CR>
nnoremap <silent> <S-F12> :TlistToggle<CR>

" Filetype specific settings
"CUDA highlight
au BufNewFile,BufRead *.cu set ft=cpp
au BufNewFile,BufRead *.cuh set ft=cpp
" don't expand tabs for make files
autocmd FileType make set noexpandtab
" Remove trailign spaces on saving source code
autocmd FileType c,cpp,java,python autocmd BufWritePre <buffer> :%s/\s\+$//e
" Lint for python
autocmd FileType python map <buffer> <F11> :call Flake8()<CR>

"" Plugin settings
" buftabs settings
let g:buftabs_only_basename=1

" taglist settings
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=1
let Tlist_Show_One_File = 1

" flake8
let g:flake8_show_quickfix=1
let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1
