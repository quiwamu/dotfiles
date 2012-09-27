set nocompatible	" お約束

" log
set viminfo='20,\"50	" 各50行までバッファ
set history=50
" set backup
set nobackup

" 全般
set bs=indent,eol,start		" バックスペースの挙動
set whichwrap=b,s,h,l,<,>,[,]	" 行頭＜＞行末間の移動
set visualbell
set wildmenu
set showcmd
set cmdheight=1
set laststatus=2	" 常にステータスライン表示
set ruler	" 右下の行情報
if has('mouse')
	set mouse=a
endif
set formatoptions+=m	" 整形オプション，マルチバイト系を追加
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

" emacsキーバインド
"imap <C-d> <C-o>x
imap <C-a> <C-o>0
imap <C-e> <C-o>$
imap <C-k> <C-o>d$
nmap <C-d> x
nmap <C-a> 0
nmap <C-e> $
nmap <C-k> d$
cmap <C-p> <up>
cmap <C-n> <down>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>

" カスタムキーマップ
nmap t :tabedit<space>
imap <C-@> <ESC>	" <C-[>の打ち間違い用
nmap <C-@> <ESC>	" <C-[>の打ち間違い用
vmap <C-@> <ESC>	" <C-[>の打ち間違い用
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

" プラグイン管理pathogen
"call pathogen#runtime_append_all_bundles()

" netrwの設定
let g:netrw_sort_by           = 'time'
let g:netrw_sort_direction    = 'r'

" diffsplitの設定
set diffopt=filler,context:6,vertical

" mp-image(vim6)用
"inoremap ^? 	"^?の部分はmp-imagteで<C-v><bs>

" 挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" 行末改行対応<C-d>
function! Superx()
	if col('.') <= len(getline('.'))
		normal! x
	else
		let pos = getpos('.')
		execute 'join!'
		call setpos('.', pos)
	endif
	return ''
endfunction
inoremap <C-d> <C-R>=Superx()<Cr>
