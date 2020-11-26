" auto pairs 設定

" 設定 php 檔標籤不要自動生成結束標籤 ?>
au FileType php let b:AutoPairs = AutoPairsDefine({}, ['<?', '<?php'])
" 關閉此功能，避免在 vim " 註解一直刪除空白行
let g:AutoPairsMultilineClose = 0
