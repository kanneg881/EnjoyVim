" 原本是重複上一次的替換操作，不保留旗標
" 改為重複上一次的替換操作，並保留旗標
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" 按 Enter 插入一行
nnoremap <CR> o

" Ex模式輸入 %% 為當前緩衝區文件目錄
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" 按 <Leader>q 離開
" 按 <Leader>Q 儲存離開
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :wq<CR>

vnoremap _g y:exe "grep /" . escape(@", '\\/') . "/ *.c *.h"<CR>
