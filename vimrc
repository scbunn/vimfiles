" https://github.com/scbunn/vimfiles

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

"-----------------------------------------------------------------------------
"VIM Plugged configuration
"-----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'python-mode/python-mode'
Plug 'vim-scripts/TaskList.vim'
Plug 'othree/html5.vim'
Plug 'sjl/gundo.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'Rykka/riv.vim'
Plug 'rhysd/vim-grammarous'
Plug 'w0rp/ale'
Plug 'elzr/vim-json'
Plug 'altercation/vim-colors-solarized' 
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'maralla/completor.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux'
Plug 'julienr/vimux-pyutils'
Plug 'fisadev/vim-isort'
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
let python_highlight_all=1              " do better python syntax highlighting
set cindent                             " C/C++ style indenting
set cinoptions=g0>2                     " take public/private to 0 tabs
                                        " 2 space indents (Google style)
                                        "
" Reading/Writing
set noautowrite                         " never write a file without being told to do so
set noautowriteall                      " really -- never
set noautoread                          " don't reread changed files
set modeline                            " allow vim options to be embedded in files
set modelines=5                         " they must be within the first/last 5 lines
set ffs=unix,dos,mac                    " try to recognize various line endings

" highlight column 80 and high 120+
" note: python-mode overwrites this
let &colorcolumn="80,".join(range(120,999),",")

" Messages, Info, Status
set ls=2                                " allows show status line
set confirm                             " y-n-c prompt if closing unsaved files
set showcmd                             " show incomplete normal mode commands as I type
set report=0                            " : commands always print changed line count
set shortmess+=a                        " use [+]/[RO]/[W] for modified/readonly/written
set laststatus=2                        " Always show statusline, even if only 1 window

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
    set termguicolors
    colorscheme gruvbox
endif

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ----------------------------------------------------------------------------
"  Plugin Configurations
" ----------------------------------------------------------------------------

" TaskList Configuration
map <leader>td <Plug>TaskList          " Toggle the TaskList

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybrid'

" Table Mode Configuration
let g:table_mode_header_fillchar='='
let g:table_mode_corner_corner='+'

" Markdown Support
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6

" Spelling and Grammar
set spelllang=en
set spellfile=$HOME/Google\ Drive/spelling/en.utf-8.add
set spell
set conceallevel=2
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }

" Vim-pencil
let g:pencil#wrapModeDefault = 'hard'
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END

" Fzf configuration
nnoremap <C-p> :Files<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Python Configuration
" Some auto fold sanity; I want buffers fully expanded on open and I will fold
" sections that I want to hide manually.
map <leader>r :call VimuxRunCommand("clear; /usr/bin/env python " . bufname("%"))<CR>
autocmd Syntax python normal zR
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_virtualenv = 1
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_syntax =1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
