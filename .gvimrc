colorscheme solarized
set background=light

set guioptions-=T	"ツールバー非表示
set transparency=5
set guifont=Menlo:h24
set guifontwide=ヒラギノ丸ゴ\ Pro\ W4:h24
set antialias
set columns=80
set lines=42
"set cmdheight=1 GUIのときは2でいいか
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif
"↑使えてない？
if has('mouse')
        set mouse=a
endif

" カラースキームをランダムに変える color/以下においてないので使えない
"function! s:gundam() 
"  let colors = map(split(globpath(&runtimepath, 'colors/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")') 
"  execute 'colorscheme ' . colors[localtime() % len(colors)] 
"endfunction 
"
"call s:gundam() 
