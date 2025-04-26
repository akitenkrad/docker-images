set nocompatible "vi互換モードoff(これにしないとファイル名のtab補完とか使えない)

set smartindent	                        "賢いインデントに
syntax on                               "構文カラー表示on
set number                              "行番号表示on
set incsearch                           "インクリメンタルサーチ(入力ごとに検索するやつ)on
set ignorecase                          "大文字小文字に関係なく検索
set showmatch                           "括弧入力時に対応する括弧を強調
set showmode                            "モードの表示
set backspace=2                         "改行、インデントをバックスペースで削除可能に
set title                               "編集中のファイル名を表示
set ruler                               "ルーラー(右下に出る行数を表示するの)を表示
set tabstop=2                           "タブ数
set shiftwidth=2                        "autoindentの改行時のタブ数
set expandtab                           "タブをスペースに置き換える
set noswapfile                          "スワップファイルを作らない
set nobackup                            "バックアップファイルを作らない
set hlsearch                            "検索結果をハイライト
set wrapscan                            "検索結果の末尾まで来たら先頭から探し直す
set wildmenu wildmode=list:full         "補完機能を強化
set wrap                                "長い行は折り返す
set undolevels=100                      "undoできる数
set autochdir                           "ファイルを開いたフォルダへカレントを移動
set cursorcolumn                        "縦ラインを引く
set cursorline                          "横ラインを引く
set nobackup                            "バックアップファイルを作らない
set noswapfile                          "スワップファイルを作らない
set undodir=/tmp/                       "undoファイルの格納場所を指定
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
nmap <Esc><Esc> :nohlsearch<CR><Esc>    "ハイライトをEsc2回で消去

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

autocmd FileType python :inoremap # #

filetype on
filetype indent on
filetype plugin on

set t_Co=256
set background=dark
colorscheme despacio
set clipboard+=unnamed

source ~/.vim/keymap.vim
