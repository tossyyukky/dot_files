set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set backspace=indent,eol,start
"オートインデント
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
"set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
"set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"検索結果ハイライト
set hlsearch
"ファイル名表示
set title
"ルーラー表示
set ruler


"シンタックスハイライト
syntax on

":source /usr/share/vim/vim72/macros/matchit.vim

" -------------------
" 日本語の設定
" -------------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,cp932,euc-jp
set fenc=utf-8
set enc=utf-8

" タブ幅
set ts=4 sw=4
set softtabstop=4
set expandtab

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

set nocompatible               " be iMproved
filetype off

nnoremap <C-n> gt
nnoremap <C-p> gT

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
"call neobundle#rc(expand('~/.vim/bundle/'))
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
" originalrepos on github
"NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimproc', {
            \ 'build': {
            \ 'windows': 'make -f make_mingw32.mak',
            \ 'cygwin': 'make -f make_cygwin.mak',
            \ 'mac': 'make -f make_mac.mak',
            \ 'unix': 'make -f make_unix.mak',
            \ }
            \}
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'mattn/emmet-vim'
""NeoBundle 'taichouchou2/surround.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
    " neocomplete用設定
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"

" NERDTree 設定START
" ブックマークを最初から表示
"let g:NERDTreeShowBookmarks=1
"ファイル指定で開かれた場合はNERDTreeは表示しない
"if !argc()
"    autocmd vimenter * NERDTree|normal gg3j
"endif
"nnoremap <f5> :NERDTreeToggle<CR>
""最後に残ったウィンドウがNERDTREEのみのときはvimを閉じる
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTree 設定END


  call neobundle#end()
endif
filetype plugin indent on     " required!
filetype indent on

NeoBundleCheck

