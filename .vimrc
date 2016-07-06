""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Tlist_Exit_OnlyWindow = 1

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 

    """"""""""""" Standard cscope/vim boilerplate
"Thilak
set showmatch
set nocompatible
"set ignorecase
set autoindent
set mouse=a
syntax on
set splitright
colorscheme evening

set nocompatible

set backspace=indent,eol,start 

" Mouse select
"Use togglemouse plugin
nmap <F2>   :set ignorecase<CR>
" Default VIM Mouse select
nmap <F3>   :set noignorecase<CR>

set tabstop=4
"set softtabstop=4
set shiftwidth=4
set et
set wm=4


<F12>i


" Open and close all the three plugins on the same time 
nmap <F8>   :TrinityToggleAll<CR> 

" Open and close the srcexpl.vim separately 
nmap <F9>   :TrinityToggleSourceExplorer<CR> 

" Open and close the taglist.vim separately 
nmap <F10>  :TrinityToggleTagList<CR> 

" Open and close the NERD_tree.vim separately 
nmap <F11>  :TrinityToggleNERDTree<CR> 


    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "
    
    nmap <F7> :TlistToggle<CR><CR>

    nmap t1 :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap t2 :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap t3 :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap t4 :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap t5 :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap t6 :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap t7 :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap t8 :cs find d <C-R>=expand("<cword>")<CR><CR>


"    nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

"    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
"    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
"    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	

    nmap h1 :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap h2 :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap h3 :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap h4 :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap h5 :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap h6 :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap h7 :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap h8 :scs find d <C-R>=expand("<cword>")<CR><CR>
    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

"    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
"    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
"    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    nmap v1 :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap v2 :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap v3 :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap v4 :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap v5 :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap v6 :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap v7 :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap v8 :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
                                                                        "
                                                                         "set ttimeoutlen=100
  let g:session_yank_file="~/.vim_yank"
     map <silent> <Leader>y :call Session_yank()<CR>
                                                                                             vmap <silent> <Leader>y y:call Session_yank()<CR>
                                                                                             vmap <silent> <Leader>Y Y:call Session_yank()<CR>
                                                                                             nmap <silent> <Leader>p :call Session_paste("p")<CR>
                                                                                             nmap <silent> <Leader>P :call Session_paste("P")<CR>

function Session_yank()
    new
call setline(1,getregtype())
    put
    silent exec 'wq! ' . g:session_yank_file
    exec 'bdelete ' . g:session_yank_file
    endfunction

function Session_paste(command)
    silent exec 'sview ' . g:session_yank_file
let l:opt=getline(1)
    silent 2,$yank
    if (l:opt == 'v')
    call setreg('"', strpart(@",0,strlen(@")-1), l:opt) " strip trailing endline ?
    else
    call setreg('"', @", l:opt)
    endif
    exec 'bdelete ' . g:session_yank_file
    exec 'normal ' . a:command
    endfunction



highlight ExtraWhitespace ctermbg=red guibg=red
match Extrawhitespace /\s\+$/
let Tlist_Ctags_Cmd = '/homes/tsurendra/download/ctags-5.8/ctags'


" // The switch of the Source Explorer                                         " 
" nmap <F8> :SrcExplToggle<CR> 
"                                                                              " 
" // Set the height of Source Explorer window                                  " 
" let g:SrcExpl_winHeight = 8 
"                                                                              " 
" // Set 100 ms for refreshing the Source Explorer                             " 
" let g:SrcExpl_refreshTime = 100 
"                                                                              " 
" // Set "Enter" key to jump into the exact definition context                 " 
let g:SrcExpl_jumpKey = "<ENTER>" 
"                                                                              " 
" // Set "Space" key for back from the definition context                      " 
let g:SrcExpl_gobackKey = "<SPACE>" 
"                                                                              " 
" // In order to avoid conflicts, the Source Explorer should know what plugins " 
" // except itself are using buffers. And you need add their buffer names into " 
" // below listaccording to the command ":buffers!"                            " 
 let g:SrcExpl_pluginList = [ 
         \ "__Tag_List__", 
         \ "_NERD_tree_" 
     \ ] 
                                                                              " 
" // Enable/Disable the local definition searching, and note that this is not  " 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. " 
" // It only searches for a match with the keyword according to command 'gd'   " 
let g:SrcExpl_searchLocalDef = 1 
"                                                                              " 
" // Do not let the Source Explorer update the tags file when opening          " 
let g:SrcExpl_isUpdateTags = 0 
"                                                                              " 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to " 
" //  create/update a tags file                                                " 
let g:SrcExpl_updateTagsCmd = "/homes/tsurendra/download/ctags-5.8/ctags --sort=foldcase -R ." 
"                                                                              " 
" // Set "<F5>" key for updating the tags file artificially                   " 
let g:SrcExpl_updateTagsKey = "<F5>" 
"                                                                              " 
" // Set "<F3>" key for displaying the previous definition in the jump list    " 
let g:SrcExpl_prevDefKey = "<F3>" 
"                                                                              " 
" // Set "<F4>" key for displaying the next definition in the jump list        " 
let g:SrcExpl_nextDefKey = "<F4>" 
