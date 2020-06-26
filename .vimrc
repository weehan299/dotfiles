call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" AuTomatically show Vim's complete menu while typing.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

"languages
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
"latex
Plug 'lervag/vimtex'
call plug#end()

 " Store info from no more than 100 files at a time, 9999 lines of text,
 " 100kb of data. Useful for copying large amounts of data between files.
 set viminfo='100,<9999,s100

syntax on


"let g:solarized_termcolors=256
let g:rehash256 = 1
set t_Co=256
set background=dark
set t_ut=""
colorscheme gruvbox


""set jk to escape
inoremap jk <Esc>


let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \ }
      \ }

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"mapping leader to space
let mapleader = " "

"NERDTree file explorer
"toggle on off
map <leader>n :NERDTreeToggle<CR>

set mouse=a

"set 80 character mark
:set colorcolumn=80

"copy straight to system's keyboard #update this doesnt seem to work..
set clipboard=unnamed

" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>

"split settings
set splitbelow
set splitright

"to off highlight search after searching just press space twice
nnoremap <Leader><space> :noh<cr>

"quick split
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

"split resize"
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

noremap <leader>t gt

"Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>



" " Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

"Turn on syntax highlighting.
" syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied
" from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap ` :set invpaste paste?<CR>
imap ` <C-O>:set invpaste paste?<CR>
set pastetoggle=<F10>

"set up for backups.
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Uncomment below to set the max textwidth. Use a value corresponding to the
" width of your screen.
set textwidth=90
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump
" between them.
set matchpairs+=<:>

" Display different types of white spaces.
" set list
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number relativenumber

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

"Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Press * then Type a replacement term and press . to repeat the replacement again. 
" Useful for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

"................................................................................

"FZF stuff: 
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always--format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
 " [Tags] Command to generate tags file
 let g:fzf_tags_command = 'ctags -R'
 " [Commands] --expect expression for directly executing the command
 let g:fzf_commands_expect = 'alt-enter,ctrl-x'

 " Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

"short cuts to access files
 nnoremap <silent> <C-p> :Files<CR>
 nnoremap <silent> <C-l> :Lines<CR>
 nnoremap <silent> <C-g> :GFiles<CR>
 noremap <silent> <Leader><Enter> :Buffers<CR>

"................................................................................

" vim grepper

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
"................................................................................

 "Coc stuff goto definitions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references) 

"................................................................................

 " For preview of latex
 let g:vimtex_view_general_viewer = 'sumatraPDF'
 let g:vimtex_view_general_options = '-reuse-instance @pdf'
 let g:vimtex_view_general_options_latexmk = '-reuse-instance'

