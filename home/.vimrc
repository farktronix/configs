"USEFUL COMMANDS (NO CONFIG NEEDED):
" :sp (filename) - loads filename in new split window. if no filename is
"                  specified, the current file is loaded 
"   Split window manipulation:
"   <CTL-W>+
"           k - move up one split  
"           j - move down one split
"           + - make this window bigger
"           - - make this window smaller
"   :(w)q - (write and) close this split
" :TOhtml - creates HTML file from current file using syntax coloring
"
" HOW TO USE THE HELP FILES
" The help files are a great resource, but they're a bit confusing to learn
" For help on a topic, type :help
" Links look like |this| - if you cursor over them and type <CTL+]>, you'll
" jump to that section of help. To get back to where you were, type <CTL+0>
"
set nocompatible        " Use Vim defaults (much better!)

" POSIX compatability for vim running under fish
if &shell =~# 'fish$'
    set shell=bash
endif

filetype off

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'dag/vim-fish'

call vundle#end()
" End Vundle

filetype plugin indent on
syntax enable

set hlsearch
set incsearch

colorscheme murphy
set nobackup            " I can back up my own files, thank you very much
set noswapfile
set bs=2                " Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ai                  " Always set auto-indenting on
set viminfo='20,\"50    " read/write a .viminfo file -- limit to only 50
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set ts=4                " 4 space wide tabs
set sw=4                
set softtabstop=4       "makes backspacing over spaced out tabs work real nice
set expandtab           "expand tabs to spaces
set ignorecase          
set background=dark     "awesome for terminals with crappy colors (putty!)
set tagstack            "lets you push and pop your jumps with ctrl+]
set pastetoggle=<C-p>   "when you're pasting stuff this keeps it from getting
                        "all whacked out with indentation
set foldmethod=manual   "enable code folding

"javac in vim
"set makeprg=javac\ %
"set errorformat=%A%f:%l\ %m,%-Z%p^,%-C%.%#

" Don't use Ex mode, use Q for formatting
map Q gq

"collapsing window splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 

" remove ^M characters from windows files
map <C-M> mvggVG:s/<C-V><CR>//g<CR>`v

"rot13 dmca-grade encryption
"this is useful to obfuscate whatever it is that you're working on temporarily
"if someone walks by (vim pr0n?)
map <F3> mzggVGg?`z

"don't expand tabs if we're in a makefile
au BufRead,BufNewFile Makefile set ts=4 sw=4 noexpandtab

autocmd BufNewFile,BufRead *.txt set tw=78
autocmd BufNewFile,BufRead *.tex set tw=80

"good tab completion - press <tab> to autocomplete if there's a character
"previously
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

