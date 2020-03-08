set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'fatih/vim-go'
Plug 'guns/vim-clojure-static'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'humorless/vim-kibit'
Plug 'Raimondi/delimitMate'
Plug 'kovisoft/paredit'
Plug 'luochen1990/rainbow'
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/oceanic-next'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junkblocker/patchreview-vim'
Plug 'junegunn/vim-easy-align'
Plug 'kylef/apiblueprint.vim'
Plug 'wincent/command-t'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fireplace', {'for': 'clojure' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-dispatch'
Plug 'AndrewRadev/splitjoin.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'venantius/vim-cljfmt'
Plug 'xavierchow/vim-sequence-diagram'
Plug 'xavierchow/vim-swagger-preview'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1

set number
set ruler
set hlsearch incsearch
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set autowrite
set statusline+=%F
set laststatus=2
set regexpengine=1
"let launching file from quickfix list in new tab
set switchbuf+=usetab,newtab
"set switchbuf+=newtab
syntax on
" https://github.com/ryanoasis/vim-devicons#installation
set encoding=UTF-8


"below for xterm16
"let xterm16_brightness = 'default'
"let xterm16_colormap = 'soft'
"colo xterm16

"below for mango
"set background=dark
set t_Co=256
"color mango

if (has("termguicolors"))
  set termguicolors
endif

" Theme
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
"colorscheme Tomorrow
" colorscheme OceanicNext
" https://github.com/srcery-colors/srcery-vim
let g:srcery_inverse_match_paren = 1
let g:srcery_italic = 1
" colorscheme srcery
" colorscheme OceanicNext



"color Tomorrow
"color Tomorrow-Night

"solarize colo scheme
"set background=dark
"colorscheme solarized
"below for solarize
let g:solarized_termcolors=256
colo solarized
"colo desert

"treat json as javascript for syntax highlight
"autocmd BufNewFIle,BufRead *.json set ft=javascript
"autocmd BufNewFIle,BufRead *.ejs set ft=html

"treat geojson as json for syntax highlight
autocmd BufNewFIle,BufRead *.geojson set ft=json
autocmd BufNewFile,BufRead *.es7 setlocal ft=javascript
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go colorscheme Tomorrow-Night
autocmd FileType go :AirlineTheme tomorrow
autocmd FileType clojure colorscheme srcery


let mapleader=" "
nnoremap "+yy :.w !pbcopy<CR><CR> 
vnoremap "+y :w !pbcopy<CR><CR> 
nnoremap "+p :r !pbpaste<CR>
set clipboard+=unnamedplus
"https://github.com/neovim/neovim/issues/5683
lang en_US.UTF-8

noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * NERDTree

"for vim-seqence-diagram
nmap <unique> <leader>e <Plug>GenerateDiagram
nmap <unique> <leader>sd <Plug>GenerateDiagram
"for Dash
nmap <silent> <leader>d <Plug>DashSearch
"for Peepopen
nmap <silent> <leader>q <Plug>PeepOpen
nmap <leader>zi <Plug>StartDrawIt
nmap <leader>zs <Plug>StopDrawIt
"alias for tabedit
cmap tb tabe
"Allow saving of files as sudo when I forgot to start vim using sudo."
cmap w!! w !sudo tee > /dev/null %

" comand-t ignore
let g:CommandTWildIgnore=$wildignore . ",*/node_modules"

"map <F4> :execute \"vimgrep /" . expand("<cword>") . \"/j **" <Bar> cw<CR>
"
noremap <F9> :execute " grep! -srnw --binary-files=without-match --exclude=\\*.{lock,log} --exclude-dir={.git,node_modules,coverage,logs}  . -e " . expand("<cword>") . " " <bar> cwindow<CR><CR>
noremap <F10> :execute " grep! -srnw --binary-files=without-match --exclude=\\*.{lock,log} --exclude-dir={.git,node_modules,coverage,logs}  . -e " <bar> cwindow<C-Left><C-Left><C-Left>
noremap <F3> :Ag <C-r><C-w><CR>
noremap <F4> :Ag 
noremap <F1> :vert help <C-r><C-w><CR>
set pastetoggle=<F2>

"for node runner --------------- {{{
" command! NDR let f=expand("%")|botright vnew|execute '.!node "' . f . '"' |setlocal nomodifiable buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
command! NDR let f=expand("%")|botright vnew|execute '.!node --harmony "' . f . '"' |setlocal nomodifiable buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
command! BNR let f=expand("%")|botright vnew|execute '.!babel-node "' . f . '"' |setlocal nomodifiable buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
command! PY let f=expand("%")|botright vnew|execute '.!python3 "' . f . '"' |setlocal nomodifiable buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
command! GR let f=expand("%")|botright vnew|execute '.!go run "' . f . '"' |setlocal nomodifiable buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
" }}}

"nnoremap <leader>r :w<cr>:NDR<cr>
autocmd FileType javascript nmap <leader>r  :w<cr>:NDR<cr>

"for CoffeeScript plugin
" let coffee_run_vert=1
" let coffee_compile_vert=1
" cmap CC CoffeeCompile
" cmap CR CoffeeRun
" cmap CL CoffeeLint

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
"function LoadJSCK()
"  if filereadable('.jscsrc')
"    \"let g:syntastic_javascript_jscs_args = '--config \"' . '/.jscsrc"'
"    let g:syntastic_javascript_checkers = ['jshint', 'jscs']
"  else
"    let g:syntastic_javascript_checkers = ['jshint']
"  endif
"endfunction
"call LoadJSCK()
"command! LJSCK call LoadJSCK()
autocmd BufNewFile,BufReadPre *.js let b:syntastic_javascript_jscs_args =
    \ '--config ' . findfile('.jscsrc', escape(expand('%:p:h'), ' ') . ';')
"autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jshint', 'jscs'] : ['eslint']
autocmd FileType javascript let b:syntastic_checkers = ['eslint']
"if filereadable('.jscsrc')
"  let g:syntastic_javascript_checkers = ['jscs']
"endif
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_aggregate_errors = 1
let g:systastic_html_tidy_exex = '/usr/local/Cellar/tidy-html5/5.0.0/bin/tidy'
let g:CodeReviewer_reviewer="XZ"  " Your initials
let g:CodeReviewer_reviewFile="./review_XZ.rev"
"othree/javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,chai'
"for grip 
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

" self defined maps ----------------- {{{
" cast the current input word to uppercase
" inoremap <c-u> <esc>vbUea
" nnoremap <c-u> viwUe
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
cnoremap vh vert help
iabbrev resutl result
iabbrev wiht with
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"nnoremap <leader>g :execute \"grep! -R \" . shellescape(expand("<cWORD>")) . \" ."<cr><cr>:copen<cr>

let g:generate_diagram_theme_hand = 0
vnoremap <silent> <leader>y :<c-u>let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

let g:pymode_options_max_line_length = 120
let g:pymode_folding = 0
function FmtJSON(...) 
  let code="\"
        \ var i = process.stdin, d = '';
        \ i.resume();
        \ i.setEncoding('utf8');
        \ i.on('data', function(data) { d += data; });
        \ i.on('end', function() {
        \     try {
        \       JSON.parse(d) 
        \     } catch(e) { return console.log(d); }
        \     console.log(JSON.stringify(JSON.parse(d), null, 
        \ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
        \ });\""
  execute "%! node -e " . code 
endfunction
nmap fj :<C-U>call FmtJSON(v:count)<CR>

"go lang
let g:go_highlight_functions = 1 
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>r  :GR<cr>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

"Caveat: the following set may be slow on large code base
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
let g:go_auto_sameids = 1
"scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTreeWinPos = "right"
"let g:airline_theme='oceanicnext'
let g:airline_theme='srcery'
"nnoremap <C-t> :FZF<CR>
nmap <silent> <Leader>t :FZF<CR>
"set shell=zsh
"let g:swagger_preview_verbose_log = 1

" enable ale
 let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

" nerdcommenter: see: https://github.com/scrooloose/nerdcommenter#post-installation
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['#ab7967', '#c594c5', '#6699cc' , '#62b3b2'],
\   'guis': [''],
\   'cterms': [''],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'markdown': {
\           'parentheses_options': 'containedin=markdownCode contained',
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'clojure': {
\           'guifgs': ['#ab7967', '#c594c5', '#fac863', '#62b3b2', '#99c794', '#f99157', '#ec5f67'],
\       },
\       'haskell': {
\           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\       },
\       'vim': {
\           'parentheses_options': 'containedin=vimFuncBody',
\       },
\       'stylus': {
\           'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\       },
\       'css': 0,
\       'nerdtree': 0,
\       }
\}

"https://github.com/guns/vim-clojure-static#syntax-options
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["deftest", "defroutes"],
    \ }

" https://github.com/junegunn/vim-easy-align#quick-start-guide
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
" triggger :Require for clj file
au FileType clojure nmap <Leader>r :Require<Bar><Enter>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


