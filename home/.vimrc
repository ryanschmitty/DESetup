" Load pathogen
call pathogen#runtime_append_all_bundles()

" What shell to use? bash since it's simple
set shell=/bin/bash

" Forget being compatible with good ol' vi
set nocompatible

" COLORSCHEME
if !has('gui_running')
    colorscheme xoria256
else
    colorscheme solarized
    set background=dark
endif

" Set the textwidth to be 80 chars (auto new lines)
set formatoptions=crq
set textwidth=80

" Save and restore view
set viewoptions=folds
set viewoptions+=cursor
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=block

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t

" Incrementally match the search.  I orignally hated this
" but someone forced me to live with it for a while and told
" me that I would grow to love it after getting used to it... 
" turns out he was right :)
set incsearch

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Tab stuffs
set tabstop=4     " ts, number of spaces that a tab is equivalent to
set softtabstop=4
set shiftwidth=4  " sw, number of spaces shifted left and righ when issuing << and >>
                  "  commands
set expandtab     " et, expands <tab> key to [tabstop] spaces

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" Toggle line number mode
set number
nmap <silent> ,u :set invnumber<CR>:set number?<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" Toggle invisibles
nmap <silent> ,i :set invlist<CR>:set list?<CR>
"
" Toggle ignore case
nmap <silent> ,ic :set invignorecase<CR>:set ignorecase?<CR>

" Set text wrapping toggles
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Set up retabbing on a source file
nmap <silent> ,rr :1,$retab<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Move the cursor to the window left of the current one
noremap <silent> ,h :wincmd h<cr>

" Move the cursor to the window below the current one
noremap <silent> ,j :wincmd j<cr>

" Move the cursor to the window above the current one
noremap <silent> ,k :wincmd k<cr>

" Move the cursor to the window right of the current one
noremap <silent> ,l :wincmd l<cr>

" Close the window below this one
noremap <silent> ,cj :wincmd j<cr>:close<cr>

" Close the window above this one
noremap <silent> ,ck :wincmd k<cr>:close<cr>

" Close the window to the left of this one
noremap <silent> ,ch :wincmd h<cr>:close<cr>

" Close the window to the right of this one
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Close the current window
noremap <silent> ,cc :close<cr>

" Move the current window to the right of the main Vim window
noremap <silent> ,ml <C-W>L

" Move the current window to the top of the main Vim window
noremap <silent> ,mk <C-W>K

" Move the current window to the left of the main Vim window
noremap <silent> ,mh <C-W>H

" Move the current window to the bottom of the main Vim window
noremap <silent> ,mj <C-W>J

" F6 will prepare a find and replace with the current word, or selected text
nnoremap <F6> yiw:%s/<C-r>"//gc<Left><Left><Left>
nnoremap <F7> yiw:%s/\\<<C-r>"\\>//gc<Left><Left><Left>
vnoremap <F6> y:%s/<C-r>"//gc<Left><Left><Left>
vnoremap <F7> y:%s/\\<<C-r>"\\>//gc<Left><Left><Left>

" Use awesome history buffer for command line and search
" noremap : q:i
" noremap / q/i
" noremap ? q?i

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
"if has("mac")
"  let g:main_font = "Inconsolata:h17"
"  let g:small_font = "Inconsolata:h10"
"else
"  let g:main_font = "Monospace\\ 9"
"  let g:small_font = "Monospace\\ 2"
"endif
"
"if has("gui_running")
"  exe "set guifont=" . g:main_font
"  if !exists("g:vimrcloaded")
"      winpos 900 0
"      if !&diff
"          winsize 120 130
"      else
"          winsize 240 130
"      endif
"      let g:vimrcloaded = 1
"  endif
"endif


"-----------------------------------------------------------------------------
" Warn when over 120 chars and warn for tabs
"-----------------------------------------------------------------------------
"
" We want our code to stay within a certain set column length but we don't
" want to be so brutal as to force an automatic word wrap by setting 
" 'textwidth'.  What we want is to give a gentle reminder that we've gone
" over our limits.  To do this, we use the following two functions and some
" colour settings.
"
" In addition to the column highlighting we also want to highlight when
" there are leading tabs in the code - the last thing we want is people not
" using the equivalent of 'expandtab' in their editors.  When we load the
" file in Vim we want to know that we've got some obnoxious leading tabs
" that we should clean up.
"

"
" DisableErrorHighlights()
"
" Clear out the highlighting that was done to warn us about the messes.
"
function! DisableErrorHighlights()
    if exists("w:match120")
        call matchdelete(w:match120)
        unlet w:match120
    endif
    if exists("w:matchTab")
        call matchdelete(w:matchTab)
        unlet w:matchTab
    endif
endfunction

"
" EnableErrorHighlights()
"
" Highlight the stuff we are unhappy with.
"
function! EnableErrorHighlights()
    if !exists("w:match120")
        let w:match120=matchadd('BadInLine', '\%121v.*', -1)
    endif
    if !exists("w:matchTab")
        let w:matchTab=matchadd('BadInLine', '^\t\+', -1)
    endif
endfunction

"
" AlterColour()
"
" This function is used in setting the error highlighting to compute an 
" appropriate colour for the highlighting that is computed independently
" from the colour scheme itself.  I find this nicer than hard-coding the
" colour.
"
function! AlterColour(groupname, attr, shift)
    let clr = synIDattr(synIDtrans(hlID(a:groupname)), a:attr)
    if match(clr, '^[0-9]') == 0
        let clr = printf('#%x', clr + 0)
    endif
    if match(clr, '^#') == 0
        let red   = str2nr(strpart(clr, 1, 2), 16)
        let green = str2nr(strpart(clr, 3, 2), 16)
        let blue  = str2nr(strpart(clr, 5, 2), 16)
        let red = red + a:shift
        if red <= 0
            let red = "00"
        elseif red >= 256
            let red = "ff"
        else
            let red = printf("%02x", red)
        end
        let green = green + a:shift
        if green <= 0
            let green = "00"
        elseif green >= 256
            let green = "ff"
        else
            let green = printf("%02x", green)
        end
        let blue = blue + a:shift
        if blue <= 0
            let blue = "00"
        elseif blue >= 256
            let blue = "ff"
        else
            let blue = printf("%02x", blue)
        end
        return "#" . red . green . blue
    elseif strlen(clr) != 0
        echoerr 'Colour is not in hex form (' . clr . ')'
        return clr
    else
        return ''
    endif
endfunction


" Enable/Disable the highlighting of tabs and of line length overruns
nmap <silent> ,ee :call EnableErrorHighlights()<CR>
nmap <silent> ,ed :call DisableErrorHighlights()<CR>

function! VimEnter()
    " The syntax highlight we use for the above error highlighting is 'BadInLine'
    " and we set what that colour is right here.  I use the AlterColour() function
    " defined above to compute the right colour that's essentially colorshceme
    " neutral
    let darkerbg = AlterColour("Normal", "bg", 20)
    if strlen(darkerbg) == 0
        let darkerbg = "#000000"
    end
    exe "hi BadInLine gui=none guibg=" . darkerbg
    call EnableErrorHighlights()
endfunction

au VimEnter * call VimEnter()

"-----------------------------------------------------------------------------
" VimDiff Settings
"-----------------------------------------------------------------------------

" Ignore .svn, .git, .DS_Store, and .swp files
let g:DirDiffExcludes = "*.svn*,*.git*,*.DS_Store*,*.swp" 

" Next diff + center
noremap <silent> ]c ]czz

" Prev diff + center
noremap <silent> [c [czz

" Obtain + next
noremap <silent> do do]c

" Put + next
noremap <silent> dp dp]c

"-----------------------------------------------------------------------------
" Commenting
"-----------------------------------------------------------------------------

" default comment symbol
let g:StartComment="//"
let g:EndComment=""

" example of changing it for a filetype
" au FileType c,cpp let g:StartComment = "//"
au BufRead,BufNewFile,BufEnter,FileType *.vimrc,vim let g:StartComment = "\" "
au BufRead,BufNewFile,BufEnter,FileType objc,*.h,*.c,*.cpp,*.m let g:StartComment = "//"

" call the function on ,c
noremap <silent> ,c :call CommentLines()<CR>

" and the function itself
function! CommentLines()
    try
        execute ":s@^".g:StartComment."@\@g"
        execute ":s@".g:EndComment."$@@g"
    catch
        execute ":s@^@".g:StartComment."@g"
        execute ":s@$@".g:EndComment."@g"
    endtry
endfunction
