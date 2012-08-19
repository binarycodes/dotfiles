" generic settings {{{1
set nocompatible
set backspace=indent,eol,start
set completeopt+=longest,menuone
set expandtab
set foldmethod=marker
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set nobackup
set number
set ruler
set scrolloff=3
set shiftwidth=4
set showbreak=>
set showcmd
set showmatch
set showmode
set softtabstop=4
set tabstop=8
set wildmenu
set wildmode=full
set wrap
syntax on


" colorscheme settings {{{1
set t_Co=256
colorscheme Mustang


" tags settings {{{1
set tags+=$HOME/.vim/tags/python.ctags


" keymaps {{{1
map <F12> :set number!<Bar>set number?<CR>
map <F11> :set hls!<Bar>set hls?<CR>
map <F10> :set paste!<Bar>set paste?<CR>
map <F9>  :set wrap!<Bar>set wrap?<CR>
nnoremap <F4>  :buffers<CR>:buffer<space>

vnoremap <F5>   :!python<CR>
inoremap <F5>   <ESC>:r !date<CR>kJA

cmap w!! %!sudo tee > /dev/null %

nnoremap <leader>b :FuzzyFinderBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>

nnoremap <C-up> :resize -1<CR>
nnoremap <C-down> :resize +1<CR>
nnoremap <C-left> :vertical resize +1<CR>
nnoremap <C-right> :vertical resize -1<CR>

"Fix commas without a following space unless they're in strings
nmap <silent> <Leader>x, :silent! %s/\(\(^\([^"']*\(["'][^"']*["']\)\)*[^"']*\)\@<=\)\+,\ze\S/& /g<CR> 


" auto commands {{{1
if has("autocmd")

    filetype plugin indent on
    augroup custom
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd FileType make set noexpandtab
        autocmd BufWritePost * if &ft == "" | filetype detect | endif
        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

endif "has("autocmd")


if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
endif "has("gui_running")

