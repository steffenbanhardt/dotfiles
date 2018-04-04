" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"Pathogen
execute pathogen#infect()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>



" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set spelllang=de_de
set runtimepath+=/usr/share/lilypond/2.18.2/vim
"set runtimepath+=~/.vim/bundle/ctrlp.vim
set t_Co=256
colorscheme desert256
set incsearch
"set showbreak=↪
set shiftwidth=4
set number
set laststatus=2
set statusline=%t%m%r%y\ \ %a\ %=0x%B\ [b:%n]\ %l,%c%V\ %P
hi CursorLine cterm=none ctermbg=black 
hi CursorColumn cterm=NONE ctermbg=black
au InsertEnter * set cursorline
au InsertLeave * set nocursorline
au BufRead,BufNewFile *.viki set ft=viki 

set ignorecase smartcase "sucht automatisch nach Groß-und Kleinschreibung

"Für ctags und tablist
nnoremap <silent> <F8> :TlistToggle<CR>
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels;f:files'
let tlist_bib_settings   = 'bib;b:bib'
let tlist_make_settings  = 'make;m:makros;t:targets'

"NERDTree umschalten
map <F2> :NERDTreeToggle<CR> 

"<leader> auf " " setzten -- vor allen map !
let mapleader = ","

"languagetool
let g:languagetool_jar='$HOME/languagetool/languagetool-commandline.jar'

 "XeLaTeX mit ,lx, pdfLaTeX mit ,lp einstellen
function SetPdfTex()
    let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
endfunction
function SetXeTex()
    let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>
map <Leader>lp :<C-U>call SetPdfTex()<CR>
"XeLaTeX als Standard
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

"Biber! ,lb lässt biber laufen
let g:Tex_BibtexFlavor = 'biber'
map <Leader>lb :<C-U>exec '!biber '.Tex_GetMainFileName(':p:t:r')<CR>

"vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts = 1

" -- Buffer
"buffer nicht entladen
set hidden

" Move to the next buffer
nmap <leader>k :bnext<CR>
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>j :bprevious<CR>
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nmap <leader>np O\newpage{}<ESC><C-j><ESC>

" -- Ctrlp
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pdf)$',
\}

" Use the cw directory as the cwd
let g:ctrlp_working_path_mode = 'c'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

nmap <leader>ns :set nospell<CR>
nmap <leader>sp :set spell<CR>

" Problem ist, dass die Dateiendung erwartet wird
nmap <leader>gf :e <cfile>.tex<CR>

" Thesaurus-Datei
set thesaurus+=~/.vim/thesaurus/openthesaurus.txt
set dictionary+=/usr/share/dict/ngerman
set dictionary+=~/.vim/dictionary/myDict

autocmd FileType kerboscript setlocal commentstring=//%s

set undofile " persistentes undo
set undodir=~/.vim/undooo

" fzf
set rtp+=~/.fzf
