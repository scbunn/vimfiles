" https://github.com/scbunn/vimfiles
" ----------------------------------------------------------------------------
"  Dependencies needed outside of vim
" ----------------------------------------------------------------------------
"  None
"
" ----------------------------------------------------------------------------
" Plugins included
" ----------------------------------------------------------------------------
"  Pathogen
"  	Better Management of VIM plugins
"
"  GunDo
"  	Visual undo in vim with diff's to check the differences
"
"  Snipmate
"  	Configurable snippets to avoid re-typing common commands
"
"  Fugitive
"  	Inteface with git from vim
"
"  TaskList
"  	highlight FIXME and TODO text
"  
"-----------------------------------------------------------------------------
" Global general settings
"-----------------------------------------------------------------------------
set nocompatible			" Don't be comptabile with vi
let mapleader=","			" change leader from \ to ,

"-----------------------------------------------------------------------------
" Global shortcuts
"-----------------------------------------------------------------------------
cmap W! w !sudo tee % > /dev/null      " write file using sudo privs
cmap w!! w !sudo tee % > /dev/null     " try and save file with sudo if need?
map <leader>td <Plug>TaskList          " Toggle the TaskList


