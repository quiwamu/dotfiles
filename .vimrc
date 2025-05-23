set nocompatible	" お約束

" log
set viminfo='20,\"50	" 各50行までバッファ
set history=50
" set backup
set nobackup
" swpファイル出力先
set directory=~/.vim/swp

" 全般
set bs=indent,eol,start		" バックスペースの挙動
set whichwrap=b,s,h,l,<,>,[,]	" 行をまたいだ移動
set visualbell
set wildmenu
set showcmd
set cmdheight=1
set laststatus=2	" 常にステータスライン表示
set ruler	" 右下の行情報
if has('undofile')
	set noundofile	"un~ファイルをつくらない
endif
"set formatoptions+=m	" 整形オプション，マルチバイト系を追加
set formatoptions=	" 自動改行とか一切しない
set ambiwidth=double	" ■●とかを全角で
set wrap	" 自動折り返し
if exists('+autochdir') 
	set autochdir " 自動的にカレントディレクトリ変更
endif
set textwidth=0	" 自動改行は使わない
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " 文字コードと改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']'}%=%l,%c%V%8P " 文字コードを表示

" インデント関係
set smartindent	" 自動インデント
set tabstop=4	" タブ表示幅
set shiftwidth=4	" 自動インデント幅
set noexpandtab	" タブをスペースに展開しない
syntax on

" 検索
set hlsearch	" ハイライト
set nowrapscan	" 先頭に戻って検索しない
set ignorecase	" 大文字小文字無視
set nosmartcase	" 大文字小文字混在時も大文字小文字無視
set showmatch	" 対応括弧をハイライト

" エンコード
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,utf-16LE,utf-16BE,cp932,iso-2022-jp,euc-jp

" readlineキーバインド
imap <C-a> <C-o>^
imap <C-e> <C-o>$
imap <C-h> <Backspace>
imap <C-d> <Del>
imap <C-k> <C-o>D
nmap <C-a> ^
nmap <C-e> $
nmap <C-h> i<Backspace><Esc>
nmap <C-d> x
nmap <C-k> D
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-h> <Backspace>
cmap <C-d> <Del>
cmap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cmap <C-p> <up>
cmap <C-n> <down>
cmap <C-f> <Right>
cmap <C-b> <Left>
vmap <C-a> <Home>
vmap <C-e> <End>

" カスタムキーマップ
nmap t :tabedit<space>
map <C-@> <Esc>
imap <C-@> <ESC>
nmap <C-@> <ESC>
vmap <C-@> <ESC>
cmap <C-@> <ESC>	" うまく機能しない？
map	<C-j> <ESC>
map!	<C-j> <ESC>
nmap <C-n> gt
nmap <C-p> gT

" <C-x><C-o>によるomnifunc補完でhtmlファイルをphp補完
"setlocal omnifunc=syntaxcomplete#Complete
"autocmd FileType html setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType python setlocal omnifunc=pythoncomplete#CompletePython
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType *
"\   if &l:omnifunc == ''
"\ |   setlocal omnifunc=syntaxcomplete#Complete
"\ | endif

if has('mac')
	" <C-g>でChromeで開く
	noremap <C-g> :!open -a "Google Chrome" %<CR>
	set clipboard=unnamed
endif

" netrwの設定
let g:netrw_sort_by           = 'time'
let g:netrw_sort_direction    = 'r'
let g:netrw_list_hide='.*\.un\~$\|.*\.swp$'
let g:netrw_hide = 1

" diffsplitの設定
set diffopt=filler,context:6,vertical

" configファイルなどでコメント行を折りたためる
"set foldmethod=expr これを指定しておくとデフォで畳まれちゃうのでコメントアウト
if exists('+foldmethod')
	set foldexpr=getline(v:lnum)=~'^\\s*[#;\"]'?1:getline(prevnonblank(v:lnum))=~'^\\s*#'?1:getline(nextnonblank(v:lnum))=~'^\\s*#'?1:0
endif

" JSON Format
" Jq
" 外部コマンドjqのインストールが必要
" レンジ指定不可
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
	if 0 == a:0
		let l:arg = "."
	else
		let l:arg = a:1
	endif
	execute "%! jq \"" . l:arg . "\""
endfunction

" JsonFormat
" サロゲート文字の変換でエラー発生
command! -range=% JsonFormat :execute '<line1>,<line2>!python -m json.tool'
\ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)), sys.stdin.read()))"'
\ | :%s/ \+$//ge
\ | :set ft=javascript
\ | :1

" Wrap
command! -nargs=? Wrap :execute '%s/.\{'.<f-args>.'}/&\r/g'

" set paste時の自動復帰
autocmd InsertLeave * set nopaste

" vim-plug
"call plug#begin()
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"call plug#end()

if &term =~ "xterm" || &term =~ "screen" || &term =~ "vt100"
    " Disable appkeypad
	" テンキーパッドを使えるようにする
    let &t_ks = "\e[?1h"
endif

":SyntaxInfo とするとハイライト情報を取得できる
"https://cohama.hateblo.jp/entry/2013/08/11/020849
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
