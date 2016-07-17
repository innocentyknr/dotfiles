filetype plugin on
filetype indent on
filetype plugin indent on
colorscheme molokai 
set encoding=utf-8
set fileencodings=utf-8
" set fileencoding=japan
set number
set noswapfile
set ignorecase
set smartcase
set incsearch
set hlsearch
set title
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set showcmd
set cursorline
set t_Co=256
set scrolloff=10
set clipboard=unnamed
set clipboard=autoselect
set nocompatible
set shellslash
set foldenable
set foldmethod=syntax
set foldlevel=0
set foldnestmax=3
set foldcolumn=2
set smartindent
" set imdisable
highlight Folded cterm=bold,underline ctermfg=4
set wildmenu
set helplang=ja,en
set laststatus=2
set wrap
"set runtimepath+=/home/innocent/shinchoku/
"set runtimepath+=/home/innocent/Dev/TestVimPlugin
augroup MyAutoCmd
    autocmd!
augroup END

" w!! スーパーユーザーで保存
cmap w!! w !sudo tee > /dev/null %

nnoremap <silent> [b :bprevious<CR> 
nnoremap <silent> ]b :bnext<CR> 
nnoremap <silent> [B :bfirst<CR> 
nnoremap <silent> ]B :blast<CR> 
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
""function! s:mkdir(dir,force)
""    if !isdirectory(a:dir) && (a:force ||
""                \ input(printf('"%s" does not exist. Create? [y/N]',a:dir)) =-? '^y\%[es]$')
""        call mkdir(iconv(a:dir,&encoding, &termencoding), 'p')
 ""   endif
""endfunction
""autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)
"括弧が入力されたときに自動的に閉じ括弧を入力する
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
" inoremap { {<RETURN>}<UP><ESC><S-A>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

 if v:version >= 700
    nnoremap <C-Tab> gt
    nnoremap <C-S-Tab> gT
 endif

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
set nocompatible               " be iMproved
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
"非同期処理に必要なplugin
NeoBundle 'Shougo/vimproc'
"Clojure用?なんで入れたのか忘れた
NeoBundle 'VimClojure'
"vimから非同期なシェルを起動するplugin
NeoBundle 'Shougo/vimshell'
"統合ユーザーインターフェース
NeoBundle 'Shougo/unite.vim'
"バッファのアウトラインを表示する"
NeoBundle 'Shougo/unite-outline'
"コード補完
NeoBundle 'Shougo/neocomplete.vim'
"スニペット補完
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"clangの構文解析器を利用した補完"
NeoBundle "osyo-manga/vim-marching"
"vimからGNUscreenを制御するためのplugin
NeoBundle 'jpalardy/vim-slime'
"構文エラーチェック
NeoBundle 'scrooloose/syntastic'
"インデントに色を付けてくれる
NeoBundle 'nathanaelkane/vim-indent-guides'
"molokai
NeoBundle 'tomasr/molokai'
"バッファ上のコードを実行するplugin
NeoBundle 'thinca/vim-quickrun'
"statuslineをかっこ良くするンゴ
NeoBundle 'bling/vim-airline'
"haskell用plugin
NeoBundle 'dag/vim2hs'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/neco-ghc'
"vimplugin framework
NeoBundle 'vim-jp/vital.vim'
"python用plugin
NeoBundle 'davidhalter/jedi-vim'
"複数行コメントアウト"
NeoBundle 'tyru/caw.vim'
"任意の単語のハイライト"
NeoBundle 't9md/vim-quickhl'
"Markdown関係"
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
"javascript系"
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetype':['javascript']}}
"easy-motion"
NeoBundle 'Lokaltog/vim-easymotion'
"vim filer"
NeoBundle 'Shougo/vimfiler'
"vinarise"
NeoBundle 'Shougo/vinarise'
"vim-syntax for objdump -d"
NeoBundle 'shiracamus/vim-syntax-x86-objdump-d'
NeoBundle 'innocentyknr/vim-vlb'
syntax enable
let g:marching_enable_neocomplete = 1
let g:neocomplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
""let g:airline#extensions#tabline#left_sep = ' '
""let g:airline#extensions#tabline#left_alt_sep = '|'
"dictionary settings
"highlight
:runtime! syntax/c.vim

"ZENKAKU
function!ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        "ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
        autocmd ColorScheme	* call ZenkakuSpace()
        "全角スペースのハイライト指定
        autocmd VimEnter,WinEnter *match ZenkakuSpace  /　/
    augroup END
    call ZenkakuSpace()
endif
"python-setting
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#popup_select_first=0
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
""let g:neocomplete#force_omni_input_patterns.python = '\%([^.\t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*''])'"
let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_autocmds_enabled=0
let g:indent_guides_auto_colors=0
hi IndentGuidesOdd ctermbg=136
hi IndentGuidesEven ctermbg=235
let g:indent_guides_guide_size=1
let g:indent_guides_color_change_percent=30
"cpp settings
"

"Haskell settings
let g:ycm_semantic_triggers = {'haskell' : ['.']}

"--------\cでコメントアウト------------"
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)
"--------------------------------"
"vim-quickhl設定   単語 ハイライト"
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"--------------marching vim setting----------------------------------"
let g:marching_backend="sync_clang_command"
let g:marching_enable_neocomplete = 1
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp = 
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"-----------------------------------------------------------------"
"---------------c++---------------------------"
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
"---------------markdown--------------------------
au BufRead,BufNewFile *.md set filetype=markdown

"-------neosnipet setting--------------------"
imap <C-K>  <Plug>(neosnippet_expand_or_jump)
smap <C-K>  <Plug>(neosnippet_expand_or_jump)
xmap <C-K>  <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "<Plug>(neosnippet_expand_or_jump)"
            \:"\<Tab>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "<Plug>(neosnippet_expand_or_jump)"
            \:"\<Tab>"
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
"-------javascript-indenter---"
" let g:SimpleJsIndenter_BriefMode = 1
" let g:SimpleJsIndenter_CaseIndentLevel = -1
"----------jQuery syntax--------------"
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Added by Aizu.vim
"set runtimepath+=~/Dev/AizuVim/aizu-vim
"easy-motion setting "
nmap s <Plug>(easymotion-s2)
" command Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
let g:vimfiler_tree_leaf_icon=' '
let g:vimfiler_file_icon='-'
let g:vimfiler_marked_file_icon = '*'

set runtimepath+=~/Develop/vim-vlb-syntax/

autocmd FileType vlb let g:neosnippet#snippets_directory='~/Develop/vim-vlb-syntax/snippet'
