" https://github.com/scbunn/vimfiles
" ----------------------------------------------------------------------------
"  Dependencies needed outside of vim
" ----------------------------------------------------------------------------
" YouCompleteMe needs to be setup for use with clang and a custom

"-----------------------------------------------------------------------------
" Global general settings
"-----------------------------------------------------------------------------
set nocompatible			" Don't be comptabile with vi
let mapleader=","			" change leader from \ to ,

"-----------------------------------------------------------------------------
" Global shortcuts
"-----------------------------------------------------------------------------
" write files using sudo privs
cmap W! w !sudo tee % > /dev/null
" try and save file with sudo if needed?
cmap w!! w !sudo tee % > /dev/null

map <leader>td <Plug>TaskList          " Toggle the TaskList

"-----------------------------------------------------------------------------
"VIM Plugged configuration
"-----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized' 
Plug 'tpope/vim-fugitive'
Plug 'python-mode/python-mode'
Plug 'vim-scripts/TaskList.vim'
Plug 'othree/html5.vim'
Plug 'sjl/gundo.vim'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'w0rp/ale'
Plug 'rhysd/vim-grammarous'
call plug#end()

"-----------------------------------------------------------------------------
" Basic settings
"-----------------------------------------------------------------------------
syntax on                               " syntax highlighting
filetype on                             " try to detect filetypes
filetype plugin indent on               " enable loading indent file for filetype
set number                              " display line numbers
set numberwidth=1                       " use only 1 column (and 1 space) 
set background=dark                     " set colortheme background to dark
set title                               " show title in console title bar
set wildmenu                            " menu completion in command mode on <Tab>
set wildmode=full                       "<Tab> cycles between all matching choices
set cursorline                          " have a line indicate the cursor location
set ruler                               " show thte cursor position at all times
set nostartofline                       " avoid moving cursor to BOL when jumping
set virtualedit=block                   " let cursor move past the last char in <C-v> mode
set scrolloff=3                         " Keep 3 context lines above and below the cursor
set backspace=2                         " allow backspacing over autoindent, EOL, and BOL
set showmatch                           " briefly jump to a paren once its balanced
set nowrap                              " dont wrap text
set linebreak                           " dont wrap text in the middle of a word
set autoindent                          " always set autoindenting on
set smartindent                         " use smartindent if no indent file
set tabstop=4                           " <tab> inserts 4 spaces
set shiftwidth=4                        " 4 space shiftwidth
set softtabstop=4                       " <BS> over an autoindent delete both spaces
set expandtab                           " Use spaces, not tabs, for autoindent/tab key
set shiftround                          " round indent to a multiple of shiftwidth
set matchpairs+=<:>                     " show <> pairs as well
set foldmethod=indent                   " fold based on indent level
set foldlevel=99                        " don't fold by default
let python_highlight_all=1              " do better python syntax highlighting
set cindent                             " C/C++ style indenting
set cinoptions=g0>2                     " take public/private to 0 tabs
                                        " 2 space indents (Google style)

" highlight column 80 and high 120+
" note: python-mode overwrites this
let &colorcolumn="80,".join(range(120,999),",")

" Reading/Writing
set noautowrite                         " never write a file without being told to do so
set noautowriteall                      " really -- never
set noautoread                          " don't reread changed files
set modeline                            " allow vim options to be embedded in files
set modelines=5                         " they must be within the first/last 5 lines
set ffs=unix,dos,mac                    " try to recognize various line endings

" Messages, Info, Status
set ls=2                                " allows show status line
set confirm                             " y-n-c prompt if closing unsaved files
set showcmd                             " show incomplete normal mode commands as I type
set report=0                            " : commands always print changed line count
set shortmess+=a                        " use [+]/[RO]/[W] for modified/readonly/written
set laststatus=2                        " Always show statusline, even if only 1 window

" Set the status line
set statusline=\ %-3.3n
set statusline+=%f
set statusline+=%m%r%h%w
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
set statusline+=%=
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=\ [line\ %l:%L:%c]\ 
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}

" Searching/Patterns
set ignorecase                          " Default to using case insensitive searches
set smartcase                           " unless uppercase letters are used
set smarttab                            " handle tables intelligently
set hlsearch                            " Highlight searches by default
set incsearch                           " Incrementally search while typing a search


" disable arrow keys for movement (need to force myself to learn)
nnoremap <Left> :echoe "Use h"<CR> 
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

imap jj <ESC>

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" close buffer
nmap <leader>d :bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" execute current buffer as python
map <S-r> :w !/usr/bin/env python %<CR>

" Display/Color Theme
if has("gui_running")
    colorscheme solarized
    " set the font if we are using MacVim
    if has("gui_macvim")
        set guifont=Inconsolata:h18
    endif
    " remove menubar / toolbar
    set guioptions-=mT
else
    colorscheme solarized
endif

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif


" Python binding stuff
" remove trailing whitespace automagically
autocmd BufWritePre *.py :%s/\s\+$//e

let g:pep8_map='<leader>8'
let g:pymode_lint_cwindow = 0
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0


" Vim Markdown configuration
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" Spelling / Grammar config
set spelllang=en
set spellfile=$HOME/Google\ Drive/spelling/en.utf-8.add
set spell
let g:grammarous#use_vim_spelllang = 1
let g:pencil#textwidth = 79
let g:pencil#joinspaces = 1
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'hard', 'autoformat': 1})
augroup END
